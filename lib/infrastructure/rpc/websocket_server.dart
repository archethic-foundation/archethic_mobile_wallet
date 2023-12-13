import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:aewallet/domain/rpc/subscription.dart';
import 'package:aewallet/infrastructure/rpc/add_service/command_handler.dart';
import 'package:aewallet/infrastructure/rpc/dto/rpc_command_handler.dart';
import 'package:aewallet/infrastructure/rpc/dto/rpc_request.dart';
import 'package:aewallet/infrastructure/rpc/dto/rpc_subscription.dart';
import 'package:aewallet/infrastructure/rpc/get_accounts/command_handler.dart';
import 'package:aewallet/infrastructure/rpc/get_current_account/command_handler.dart';
import 'package:aewallet/infrastructure/rpc/get_endpoint/command_handler.dart';
import 'package:aewallet/infrastructure/rpc/get_services_from_keychain/command_handler.dart';
import 'package:aewallet/infrastructure/rpc/keychain_derive_address/command_handler.dart';
import 'package:aewallet/infrastructure/rpc/keychain_derive_keypair/command_handler.dart';
import 'package:aewallet/infrastructure/rpc/refresh_current_account/command_handler.dart';
import 'package:aewallet/infrastructure/rpc/send_transaction/command_handler.dart';
import 'package:aewallet/infrastructure/rpc/sign_transactions/command_handler.dart';
import 'package:aewallet/infrastructure/rpc/sub_account/command_handler.dart';
import 'package:aewallet/infrastructure/rpc/sub_current_account/command_handler.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:json_rpc_2/json_rpc_2.dart';
import 'package:nsd/nsd.dart';
import 'package:web_socket_channel/io.dart';

/// A [Peer] composition which handles subscription requests
class _SubscribablePeer {
  _SubscribablePeer(this._peer);

  final Peer _peer;

  final Map<String, StreamSubscription> _subscriptions = {};

  Future<void> close() => _peer.close();

  void registerMethod(String name, Function callback) =>
      _peer.registerMethod(name, callback);

  void registerSubscriptionMethod(
    String name,
    Future<RPCSubscriptionDTO> Function(dynamic params) subscriptionCallback,
  ) {
    registerMethod(
      name,
      (params) async {
        final result = await subscriptionCallback(params);

        final streamSubscription = result.updates.listen((value) {
          _peer.sendNotification('addSubscriptionNotification', value);
        });
        _registerSubscription(result.id, streamSubscription);

        return result.toJson();
      },
    );
  }

  void registerUnsubscriptionMethod(
    String name,
  ) {
    registerMethod(
      name,
      (params) async {
        final requestDTO = RPCRequestDTO.fromJson(
          params.value,
        );

        final unsubscribeCommand = RPCUnsubscribeCommandDTO.fromJson(
          requestDTO.payload,
        );
        _removeSubscription(unsubscribeCommand.subscriptionId);
        return {};
      },
    );
  }

  void registerFallback(Function(Parameters parameters) callback) =>
      _peer.registerFallback(callback);

  void _removeSubscription(String subscriptionId) {
    _subscriptions.remove(subscriptionId);
  }

  void _registerSubscription(String subscriptionId, StreamSubscription sub) {
    _subscriptions[subscriptionId] = sub;
  }

  void _cleanupSubscriptions() {
    for (final subscription in _subscriptions.entries) {
      subscription.value.cancel();
    }
    _subscriptions.clear();
  }

  Future listen() async {
    await _peer.listen();
    _cleanupSubscriptions();
  }
}

class ArchethicWebsocketRPCServer {
  ArchethicWebsocketRPCServer();

  static const logName = 'RPC Server';
  static const name = 'archethic_wallet';
  static const host = 'localhost';
  static const port = 12345;

  Registration? mDnsRegistration;

  static bool get isPlatformCompatible {
    return !kIsWeb &&
        (Platform.isLinux || Platform.isMacOS || Platform.isWindows);
  }

  HttpServer? _runningHttpServer;
  final Set<_SubscribablePeer> _openedSockets = {};

  bool get isRunning => _openedSockets.isNotEmpty || _runningHttpServer != null;

  Future<List<int>> _loadBundleIntList(String asset) async {
    final byteData = await rootBundle.load(asset);
    return byteData.buffer.asInt8List();
  }

  Future<SecurityContext> _setupServerContext() async {
    final serverContext = SecurityContext()
      ..useCertificateChainBytes(
        await _loadBundleIntList('assets/ssl/server.crt'),
      )
      ..usePrivateKeyBytes(
        await _loadBundleIntList('assets/ssl/private_key.pem'),
      );
    return serverContext;
  }

  Future<void> mDnsRegister() async {
    mDnsRegistration = await register(
      const Service(name: name, type: '_http._tcp', port: port),
    );
  }

  Future<void> mDnsUnRegister() async {
    if (mDnsRegistration == null) return;
    await unregister(mDnsRegistration!);
    mDnsRegistration = null;
  }

  Future<void> run() async {
    runZonedGuarded(
      () async {
        if (isRunning) {
          log('Already running. Cancel `start`', name: logName);
          return;
        }

        log('Starting at wss://$host:$port', name: logName);

        try {
          final httpServer = await HttpServer.bindSecure(
            host,
            port,
            await _setupServerContext(),
            shared: true,
          );
          // final httpServer = await HttpServer.bind(
          //   host,
          //   port,
          //   shared: true,
          // );
          httpServer.listen((HttpRequest request) async {
            log('Received request', name: logName);

            final socket = await WebSocketTransformer.upgrade(request);
            final channel = IOWebSocketChannel(socket);

            final peerServer = _SubscribablePeer(Peer(channel.cast<String>()))
              ..registerMethod(
                'sendTransaction',
                (params) => _handle(RPCSendTransactionCommandHandler(), params),
              )
              ..registerMethod(
                'getEndpoint',
                (params) => _handle(RPCGetEndpointCommandHandler(), params),
              )
              ..registerMethod(
                'refreshCurrentAccount',
                (params) =>
                    _handle(RPCRefreshCurrentAccountCommandHandler(), params),
              )
              ..registerMethod(
                'getCurrentAccount',
                (params) =>
                    _handle(RPCGetCurrentAccountCommandHandler(), params),
              )
              ..registerMethod(
                'getAccounts',
                (params) => _handle(RPCGetAccountsCommandHandler(), params),
              )
              ..registerSubscriptionMethod(
                'subscribeAccount',
                (params) => _handleSubscription(
                  RPCSubscribeAccountCommandHandler(),
                  params,
                ),
              )
              ..registerUnsubscriptionMethod(
                'unsubscribeAccount',
              )
              ..registerSubscriptionMethod(
                'subscribeCurrentAccount',
                (params) => _handleSubscription(
                  RPCSubscribeCurrentAccountCommandHandler(),
                  params,
                ),
              )
              ..registerUnsubscriptionMethod(
                'unsubscribeCurrentAccount',
              )
              ..registerMethod(
                'addService',
                (params) => _handle(RPCAddServiceCommandHandler(), params),
              )
              ..registerMethod(
                'getServicesFromKeychain',
                (params) =>
                    _handle(RPCGetServicesFromKeychainCommandHandler(), params),
              )
              ..registerMethod(
                'keychainDeriveKeypair',
                (params) =>
                    _handle(RPCKeychainDeriveKeypairCommandHandler(), params),
              )
              ..registerMethod(
                'keychainDeriveAddress',
                (params) =>
                    _handle(RPCKeychainDeriveAddressCommandHandler(), params),
              )
              ..registerMethod(
                'signTransactions',
                (params) =>
                    _handle(RPCSignTransactionsCommandHandler(), params),
              );

            _openedSockets.add(peerServer);
            await peerServer.listen();
          });
          _runningHttpServer = httpServer;
        } catch (error, stack) {
          log(
            'WebSocket server failed',
            error: error,
            stackTrace: stack,
            name: logName,
          );
        }

        log('mDns registration', name: logName);
        await mDnsRegister();
      },
      (error, stack) {
        log(
          'WebSocket server failed',
          error: error,
          stackTrace: stack,
          name: logName,
        );
      },
    );
  }

  Future<void> stop() async {
    runZonedGuarded(
      () async {
        if (!isRunning) {
          log('Already stopped. Cancel `stop`', name: logName);
          return;
        }

        log('Closing all websocket connections', name: logName);
        for (final socket in _openedSockets) {
          await socket.close();
        }
        _openedSockets.clear();

        log('Stopping at ws://$host:$port', name: logName);
        await _runningHttpServer?.close();
        _runningHttpServer = null;
        log('Server stopped at ws://$host:$port', name: logName);

        log('mDns unregistration', name: logName);
        await mDnsUnRegister();
      },
      (error, stack) {
        log(
          'WebSocket server failed to stop',
          error: error,
          stackTrace: stack,
          name: logName,
        );
      },
    );
  }

  Future<Map<String, dynamic>> _handle(
    RPCCommandHandler commandHandler,
    Parameters params,
  ) async {
    final result = await commandHandler.handle(params.value);
    return result.map(
      success: commandHandler.resultFromModel,
      failure: (failure) {
        log(
          'Command failed',
          name: logName,
          error: failure,
        );

        throw RpcException(
          failure.code,
          failure.message ?? 'Command failed',
        );
      },
    );
  }

  Future<RPCSubscriptionDTO> _handleSubscription(
    RPCSubscriptionHandler commandHandler,
    Parameters params,
  ) async {
    final result = await commandHandler.handle(params.value);
    return result.map(
      success: (success) {
        success as RPCSubscription;
        return RPCSubscriptionDTO(
          id: success.id,
          updates: success.updates
              .map(
                (update) => RPCSubscriptionUpdateDTO(
                  subscriptionId: success.id,
                  data: commandHandler.notificationFromModel(update),
                ),
              )
              .distinct()
              .map((dto) => dto.toJson()),
        );
      },
      failure: (failure) {
        log(
          'Command failed',
          name: logName,
          error: failure,
        );

        throw RpcException(
          failure.code,
          failure.message ?? 'Command failed',
        );
      },
    );
  }
}

abstract class ExceptionUtil {
  static R guard<R>(
    R Function() call,
    Exception Function(Object) onError,
  ) {
    try {
      return call();
    } catch (e) {
      throw onError(e);
    }
  }
}

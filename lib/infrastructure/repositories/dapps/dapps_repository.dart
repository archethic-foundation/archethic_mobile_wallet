import 'dart:convert';

import 'package:aewallet/domain/models/dapp.dart';
import 'package:aewallet/domain/repositories/dapps/dapps_repository.dart';
import 'package:archethic_dapp_framework_flutter/archethic_dapp_framework_flutter.dart'
    as aedappfm;
import 'package:archethic_lib_dart/archethic_lib_dart.dart';
import 'package:collection/collection.dart';
import 'package:flutter/services.dart';

class DAppsRepositoryImpl implements DAppsRepositoryInterface {
  Future<List<DApp>> _getDAppsLocal() async {
    final dApps = <DApp>[];
    final jsonContent =
        await rootBundle.loadString('lib/domain/repositories/dapps/dapps.json');

    final Map<String, dynamic> jsonMap = jsonDecode(jsonContent);
    if (jsonMap['DApps'] != null) {
      for (final dapp in jsonMap['DApps'] as List) {
        dApps.add(
          DApp(
            code: dapp['code'],
            url: dapp['url'],
            accessToken: dapp['accessToken'] ?? '',
          ),
        );
      }
    }

    return dApps;
  }

  @override
  Future<DApp?> getDApp(
    aedappfm.Environment environment,
    String code,
    ApiService apiService,
  ) async {
    final dapps = await getDAppsFromNetwork(environment, apiService);
    if (dapps.isEmpty) return null;

    return dapps.firstWhereOrNull(
      (element) => element.code.toUpperCase() == code.toUpperCase(),
    );
  }

  @override
  Future<List<DApp>> getDAppsFromNetwork(
    aedappfm.Environment environment,
    ApiService apiService,
  ) async {
    switch (environment) {
      // aeWallet-DApps-Conf service
      case aedappfm.Environment.testnet:
        return _getDAppsFromBlockchain(
          '00009087BB05F2D4DDBDFA833486CD303A805C5F73154473E5604BEB1C1512475B42',
          apiService,
        );
      case aedappfm.Environment.mainnet:
        return _getDAppsFromBlockchain(
          '0000679EF0AF4ED6EDB1790B8E082880BD18632BB66190DE93422C8CFC7E57D678EE',
          apiService,
        );
      case aedappfm.Environment.devnet:
        final dApps = await _getDAppsLocal();
        return dApps;
    }
  }

  Future<List<DApp>> _getDAppsFromBlockchain(
    String txAddress,
    ApiService apiService,
  ) async {
    final dAppsFromBlockchain = <DApp>[];

    final lastAddressMap = await apiService
        .getLastTransaction([txAddress], request: 'data { content }');
    if (lastAddressMap[txAddress] != null &&
        lastAddressMap[txAddress]!.data != null &&
        lastAddressMap[txAddress]!.data!.content != null) {
      final Map<String, dynamic> jsonMap =
          jsonDecode(lastAddressMap[txAddress]!.data!.content!);
      if (jsonMap['DApps'] != null) {
        for (final dapp in jsonMap['DApps'] as List) {
          dAppsFromBlockchain.add(
            DApp(
              code: dapp['code'],
              url: dapp['url'],
              accessToken: dapp['accessToken'] ?? '',
              category: dapp['category'],
              description: dapp['description'],
              iconUrl: dapp['iconUrl'],
              name: dapp['name'],
            ),
          );
        }
      }
    }
    return dAppsFromBlockchain;
  }
}

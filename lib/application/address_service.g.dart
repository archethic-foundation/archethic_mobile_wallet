// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$addressServiceHash() => r'bc17692213a3b9a5576f80ab845926a9cb458f2b';

/// See also [addressService].
@ProviderFor(addressService)
final addressServiceProvider = AutoDisposeProvider<AddressService>.internal(
  addressService,
  name: r'addressServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$addressServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AddressServiceRef = AutoDisposeProviderRef<AddressService>;
String _$genesisAddressHash() => r'a1192fe19625715ac2ff80318fadd121e9c9365d';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [genesisAddress].
@ProviderFor(genesisAddress)
const genesisAddressProvider = GenesisAddressFamily();

/// See also [genesisAddress].
class GenesisAddressFamily extends Family<AsyncValue<String>> {
  /// See also [genesisAddress].
  const GenesisAddressFamily();

  /// See also [genesisAddress].
  GenesisAddressProvider call(
    String address,
  ) {
    return GenesisAddressProvider(
      address,
    );
  }

  @override
  GenesisAddressProvider getProviderOverride(
    covariant GenesisAddressProvider provider,
  ) {
    return call(
      provider.address,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'genesisAddressProvider';
}

/// See also [genesisAddress].
class GenesisAddressProvider extends AutoDisposeFutureProvider<String> {
  /// See also [genesisAddress].
  GenesisAddressProvider(
    String address,
  ) : this._internal(
          (ref) => genesisAddress(
            ref as GenesisAddressRef,
            address,
          ),
          from: genesisAddressProvider,
          name: r'genesisAddressProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$genesisAddressHash,
          dependencies: GenesisAddressFamily._dependencies,
          allTransitiveDependencies:
              GenesisAddressFamily._allTransitiveDependencies,
          address: address,
        );

  GenesisAddressProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.address,
  }) : super.internal();

  final String address;

  @override
  Override overrideWith(
    FutureOr<String> Function(GenesisAddressRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GenesisAddressProvider._internal(
        (ref) => create(ref as GenesisAddressRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        address: address,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String> createElement() {
    return _GenesisAddressProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GenesisAddressProvider && other.address == address;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, address.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GenesisAddressRef on AutoDisposeFutureProviderRef<String> {
  /// The parameter `address` of this provider.
  String get address;
}

class _GenesisAddressProviderElement
    extends AutoDisposeFutureProviderElement<String> with GenesisAddressRef {
  _GenesisAddressProviderElement(super.provider);

  @override
  String get address => (origin as GenesisAddressProvider).address;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

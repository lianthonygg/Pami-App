// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(commonRepositoryImpl)
const commonRepositoryImplProvider = CommonRepositoryImplProvider._();

final class CommonRepositoryImplProvider
    extends
        $FunctionalProvider<
          CommonRepositoryImpl,
          CommonRepositoryImpl,
          CommonRepositoryImpl
        >
    with $Provider<CommonRepositoryImpl> {
  const CommonRepositoryImplProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'commonRepositoryImplProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$commonRepositoryImplHash();

  @$internal
  @override
  $ProviderElement<CommonRepositoryImpl> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CommonRepositoryImpl create(Ref ref) {
    return commonRepositoryImpl(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CommonRepositoryImpl value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CommonRepositoryImpl>(value),
    );
  }
}

String _$commonRepositoryImplHash() =>
    r'55774548a4379c6639755dc6e12cc85c8e0dbb97';

@ProviderFor(localRepositoryImpl)
const localRepositoryImplProvider = LocalRepositoryImplProvider._();

final class LocalRepositoryImplProvider
    extends
        $FunctionalProvider<
          LocalRepositoryImpl,
          LocalRepositoryImpl,
          LocalRepositoryImpl
        >
    with $Provider<LocalRepositoryImpl> {
  const LocalRepositoryImplProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'localRepositoryImplProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$localRepositoryImplHash();

  @$internal
  @override
  $ProviderElement<LocalRepositoryImpl> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LocalRepositoryImpl create(Ref ref) {
    return localRepositoryImpl(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocalRepositoryImpl value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocalRepositoryImpl>(value),
    );
  }
}

String _$localRepositoryImplHash() =>
    r'f5ec3f4dbe8f784368804dcef99e46496de3822e';

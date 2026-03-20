// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(pregestanteRepositoryImpl)
const pregestanteRepositoryImplProvider = PregestanteRepositoryImplProvider._();

final class PregestanteRepositoryImplProvider
    extends
        $FunctionalProvider<
          PregestanteRepositoryImpl,
          PregestanteRepositoryImpl,
          PregestanteRepositoryImpl
        >
    with $Provider<PregestanteRepositoryImpl> {
  const PregestanteRepositoryImplProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pregestanteRepositoryImplProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pregestanteRepositoryImplHash();

  @$internal
  @override
  $ProviderElement<PregestanteRepositoryImpl> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PregestanteRepositoryImpl create(Ref ref) {
    return pregestanteRepositoryImpl(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PregestanteRepositoryImpl value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PregestanteRepositoryImpl>(value),
    );
  }
}

String _$pregestanteRepositoryImplHash() =>
    r'41bd1b0f6c8e25f75a54e972dd2522dee4c62144';

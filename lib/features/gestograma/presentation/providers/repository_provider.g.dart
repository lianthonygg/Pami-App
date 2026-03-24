// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(gestanteRepositoryImpl)
const gestanteRepositoryImplProvider = GestanteRepositoryImplProvider._();

final class GestanteRepositoryImplProvider
    extends
        $FunctionalProvider<
          GestanteRepositoryImpl,
          GestanteRepositoryImpl,
          GestanteRepositoryImpl
        >
    with $Provider<GestanteRepositoryImpl> {
  const GestanteRepositoryImplProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'gestanteRepositoryImplProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$gestanteRepositoryImplHash();

  @$internal
  @override
  $ProviderElement<GestanteRepositoryImpl> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GestanteRepositoryImpl create(Ref ref) {
    return gestanteRepositoryImpl(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GestanteRepositoryImpl value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GestanteRepositoryImpl>(value),
    );
  }
}

String _$gestanteRepositoryImplHash() =>
    r'323f3a4ee23488ef9ae477ef958c7d05bf6aa8cb';

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(puerperaRepositoryImpl)
const puerperaRepositoryImplProvider = PuerperaRepositoryImplProvider._();

final class PuerperaRepositoryImplProvider
    extends
        $FunctionalProvider<
          PuerperaRepositoryImpl,
          PuerperaRepositoryImpl,
          PuerperaRepositoryImpl
        >
    with $Provider<PuerperaRepositoryImpl> {
  const PuerperaRepositoryImplProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'puerperaRepositoryImplProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$puerperaRepositoryImplHash();

  @$internal
  @override
  $ProviderElement<PuerperaRepositoryImpl> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PuerperaRepositoryImpl create(Ref ref) {
    return puerperaRepositoryImpl(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PuerperaRepositoryImpl value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PuerperaRepositoryImpl>(value),
    );
  }
}

String _$puerperaRepositoryImplHash() =>
    r'dbb05f31305e6642b6200e026332b5b54b784f63';

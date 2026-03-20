// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usecase_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(gestanteUseCase)
const gestanteUseCaseProvider = GestanteUseCaseProvider._();

final class GestanteUseCaseProvider
    extends
        $FunctionalProvider<GestanteUseCase, GestanteUseCase, GestanteUseCase>
    with $Provider<GestanteUseCase> {
  const GestanteUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'gestanteUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$gestanteUseCaseHash();

  @$internal
  @override
  $ProviderElement<GestanteUseCase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GestanteUseCase create(Ref ref) {
    return gestanteUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GestanteUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GestanteUseCase>(value),
    );
  }
}

String _$gestanteUseCaseHash() => r'aeaf37f7948c0e7b25af7f90f4411b95c2d002f0';

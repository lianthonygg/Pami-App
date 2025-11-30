// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usecase_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(puerperaUseCase)
const puerperaUseCaseProvider = PuerperaUseCaseProvider._();

final class PuerperaUseCaseProvider
    extends
        $FunctionalProvider<PuerperaUseCase, PuerperaUseCase, PuerperaUseCase>
    with $Provider<PuerperaUseCase> {
  const PuerperaUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'puerperaUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$puerperaUseCaseHash();

  @$internal
  @override
  $ProviderElement<PuerperaUseCase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PuerperaUseCase create(Ref ref) {
    return puerperaUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PuerperaUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PuerperaUseCase>(value),
    );
  }
}

String _$puerperaUseCaseHash() => r'b4e08842c433d2c311020a5fa533a52152538c01';

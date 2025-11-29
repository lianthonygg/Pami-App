// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usecase_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(pregestantesUseCase)
const pregestantesUseCaseProvider = PregestantesUseCaseProvider._();

final class PregestantesUseCaseProvider
    extends
        $FunctionalProvider<
          PregestantesUseCase,
          PregestantesUseCase,
          PregestantesUseCase
        >
    with $Provider<PregestantesUseCase> {
  const PregestantesUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pregestantesUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pregestantesUseCaseHash();

  @$internal
  @override
  $ProviderElement<PregestantesUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PregestantesUseCase create(Ref ref) {
    return pregestantesUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PregestantesUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PregestantesUseCase>(value),
    );
  }
}

String _$pregestantesUseCaseHash() =>
    r'2d22c3411a78c3dd1113ef9db7db94f55fff4214';

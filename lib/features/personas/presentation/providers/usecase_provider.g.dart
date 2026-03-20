// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usecase_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(personaUseCase)
const personaUseCaseProvider = PersonaUseCaseProvider._();

final class PersonaUseCaseProvider
    extends $FunctionalProvider<PersonaUseCase, PersonaUseCase, PersonaUseCase>
    with $Provider<PersonaUseCase> {
  const PersonaUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'personaUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$personaUseCaseHash();

  @$internal
  @override
  $ProviderElement<PersonaUseCase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PersonaUseCase create(Ref ref) {
    return personaUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PersonaUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PersonaUseCase>(value),
    );
  }
}

String _$personaUseCaseHash() => r'b2f7025c5d2533bb6de7052049eddd146b977b02';

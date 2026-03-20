// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(personaRepositoryImpl)
const personaRepositoryImplProvider = PersonaRepositoryImplProvider._();

final class PersonaRepositoryImplProvider
    extends
        $FunctionalProvider<
          PersonaRepositoryImpl,
          PersonaRepositoryImpl,
          PersonaRepositoryImpl
        >
    with $Provider<PersonaRepositoryImpl> {
  const PersonaRepositoryImplProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'personaRepositoryImplProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$personaRepositoryImplHash();

  @$internal
  @override
  $ProviderElement<PersonaRepositoryImpl> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PersonaRepositoryImpl create(Ref ref) {
    return personaRepositoryImpl(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PersonaRepositoryImpl value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PersonaRepositoryImpl>(value),
    );
  }
}

String _$personaRepositoryImplHash() =>
    r'928fc0071c56dda7cdab43dd4d1490160965c19f';

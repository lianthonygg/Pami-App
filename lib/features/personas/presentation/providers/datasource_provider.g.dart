// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datasource_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(personaRemoteDataSource)
const personaRemoteDataSourceProvider = PersonaRemoteDataSourceProvider._();

final class PersonaRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          PersonaRemoteDatasource,
          PersonaRemoteDatasource,
          PersonaRemoteDatasource
        >
    with $Provider<PersonaRemoteDatasource> {
  const PersonaRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'personaRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$personaRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<PersonaRemoteDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PersonaRemoteDatasource create(Ref ref) {
    return personaRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PersonaRemoteDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PersonaRemoteDatasource>(value),
    );
  }
}

String _$personaRemoteDataSourceHash() =>
    r'b38a4abd1534c762d0efe85c32a71e190a5e4ad9';

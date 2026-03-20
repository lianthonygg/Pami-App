// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datasource_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(gestantesLocalDataSource)
const gestantesLocalDataSourceProvider = GestantesLocalDataSourceProvider._();

final class GestantesLocalDataSourceProvider
    extends
        $FunctionalProvider<
          GestantesLocalDataSource,
          GestantesLocalDataSource,
          GestantesLocalDataSource
        >
    with $Provider<GestantesLocalDataSource> {
  const GestantesLocalDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'gestantesLocalDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$gestantesLocalDataSourceHash();

  @$internal
  @override
  $ProviderElement<GestantesLocalDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GestantesLocalDataSource create(Ref ref) {
    return gestantesLocalDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GestantesLocalDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GestantesLocalDataSource>(value),
    );
  }
}

String _$gestantesLocalDataSourceHash() =>
    r'f7e550ff25dc97aeb2a6ee5e9d5aa91df890f51a';

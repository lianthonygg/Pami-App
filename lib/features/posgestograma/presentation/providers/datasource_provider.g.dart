// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datasource_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(puerperaLocalDataSource)
const puerperaLocalDataSourceProvider = PuerperaLocalDataSourceProvider._();

final class PuerperaLocalDataSourceProvider
    extends
        $FunctionalProvider<
          PuerperaLocalDataSource,
          PuerperaLocalDataSource,
          PuerperaLocalDataSource
        >
    with $Provider<PuerperaLocalDataSource> {
  const PuerperaLocalDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'puerperaLocalDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$puerperaLocalDataSourceHash();

  @$internal
  @override
  $ProviderElement<PuerperaLocalDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PuerperaLocalDataSource create(Ref ref) {
    return puerperaLocalDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PuerperaLocalDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PuerperaLocalDataSource>(value),
    );
  }
}

String _$puerperaLocalDataSourceHash() =>
    r'0f953ccb1974cc0e2539e1f22abcef1db5a4a736';

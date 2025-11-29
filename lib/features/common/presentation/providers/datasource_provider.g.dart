// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datasource_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(commonRemoteDataSource)
const commonRemoteDataSourceProvider = CommonRemoteDataSourceProvider._();

final class CommonRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          CommonRemoteDatasource,
          CommonRemoteDatasource,
          CommonRemoteDatasource
        >
    with $Provider<CommonRemoteDatasource> {
  const CommonRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'commonRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$commonRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<CommonRemoteDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CommonRemoteDatasource create(Ref ref) {
    return commonRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CommonRemoteDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CommonRemoteDatasource>(value),
    );
  }
}

String _$commonRemoteDataSourceHash() =>
    r'6244213b84e6454e970d76ea14e10ab510c761c3';

import 'package:pami_app/core/network/dio_provider.dart';
import 'package:pami_app/features/common/data/datasources/common_remote_datasource.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'datasource_provider.g.dart';

@riverpod
CommonRemoteDatasource commonRemoteDataSource(Ref ref) {
  final dio = ref.watch(dioProvider);
  return CommonRemoteDatasource(dio);
}

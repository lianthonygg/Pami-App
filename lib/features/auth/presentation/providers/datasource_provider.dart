import 'package:pami_app/core/network/dio_provider.dart';
import 'package:pami_app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'datasource_provider.g.dart';

@riverpod
AuthRemoteDatasource authRemoteDatasource(Ref ref) {
  final dio = ref.watch(dioProvider);
  return AuthRemoteDatasource(dio);
}

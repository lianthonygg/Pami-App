import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pami_app/core/network/dio_provider.dart';
import 'package:pami_app/features/auth/data/datasources/auth_remote_datasource.dart';

final authRemoteDataSourceProvider = Provider<AuthRemoteDatasource>((ref) {
  final dio = ref.watch(dioProvider);
  return AuthRemoteDatasource(dio);
});

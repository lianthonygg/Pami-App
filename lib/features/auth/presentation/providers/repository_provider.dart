import 'package:pami_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:pami_app/features/auth/presentation/providers/datasource_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repository_provider.g.dart';

@riverpod
AuthRepositoryImpl authRepositoryImpl(Ref ref) {
  final remoteDataSource = ref.watch(authRemoteDatasourceProvider);
  return AuthRepositoryImpl(remoteDataSource);
}

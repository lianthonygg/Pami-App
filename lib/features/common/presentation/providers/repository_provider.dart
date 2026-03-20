import 'package:pami_app/features/common/data/local/db_provider.dart';
import 'package:pami_app/features/common/data/repositories/common_repository_impl.dart';
import 'package:pami_app/features/common/data/repositories/local_repository_impl.dart';
import 'package:pami_app/features/common/presentation/providers/datasource_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repository_provider.g.dart';

@riverpod
CommonRepositoryImpl commonRepositoryImpl(Ref ref) {
  final remoteDatasource = ref.watch(commonRemoteDataSourceProvider);
  return CommonRepositoryImpl(remoteDatasource);
}

@riverpod
LocalRepositoryImpl localRepositoryImpl(Ref ref) {
  final db = ref.watch(databaseProvider);
  return LocalRepositoryImpl(db);
}

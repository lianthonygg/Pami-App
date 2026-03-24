import 'package:pami_app/features/gestograma/data/repositories/gestante_repository_impl.dart';
import 'package:pami_app/features/gestograma/presentation/providers/datasource_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repository_provider.g.dart';

@riverpod
GestanteRepositoryImpl gestanteRepositoryImpl(Ref ref) {
  final localDataSource = ref.watch(gestantesLocalDataSourceProvider);
  final remoteDataSource = ref.watch(gestantesRemoteDataSourceProvider);
  return GestanteRepositoryImpl(localDataSource, remoteDataSource);
}

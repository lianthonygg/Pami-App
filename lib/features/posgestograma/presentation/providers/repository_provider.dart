import 'package:pami_app/features/posgestograma/data/repositories/puerpera_repository_impl.dart';
import 'package:pami_app/features/posgestograma/presentation/providers/datasource_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repository_provider.g.dart';

@riverpod
PuerperaRepositoryImpl puerperaRepositoryImpl(Ref ref) {
  final localDataSource = ref.watch(puerperaLocalDataSourceProvider);
  return PuerperaRepositoryImpl(localDataSource);
}

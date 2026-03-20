import 'package:pami_app/features/common/data/local/db_provider.dart';
import 'package:pami_app/features/pregestograma/data/repositories/pregestante_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repository_provider.g.dart';

@riverpod
PregestanteRepositoryImpl pregestanteRepositoryImpl(Ref ref) {
  final db = ref.watch(databaseProvider);
  return PregestanteRepositoryImpl(db);
}

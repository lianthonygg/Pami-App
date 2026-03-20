import 'package:pami_app/features/common/data/local/db_provider.dart';
import 'package:pami_app/features/gestograma/data/datasources/gestantes_local_datasource.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'datasource_provider.g.dart';

@riverpod
GestantesLocalDataSource gestantesLocalDataSource(Ref ref) {
  final db = ref.watch(databaseProvider);
  return GestantesLocalDataSource(db);
}

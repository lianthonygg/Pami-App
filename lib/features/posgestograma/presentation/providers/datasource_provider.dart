import 'package:pami_app/features/common/data/local/db_provider.dart';
import 'package:pami_app/features/posgestograma/data/datasources/puerpera_local_datasource.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'datasource_provider.g.dart';

@riverpod
PuerperaLocalDataSource puerperaLocalDataSource(Ref ref) {
  final db = ref.watch(databaseProvider);
  return PuerperaLocalDataSource(db);
}

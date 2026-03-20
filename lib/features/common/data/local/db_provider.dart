import 'package:pami_app/features/common/data/local/app_database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'db_provider.g.dart';

// final databaseProvider = Provider<AppDatabase>((ref) {
//   final db = AppDatabase();
//   ref.onDispose(() {
//     db.close();
//   });
//   return db;
// });

@Riverpod(keepAlive: true)
AppDatabase database(Ref ref) {
  final db = AppDatabase();

  ref.onDispose(() {
    db.close();
  });

  return db;
}

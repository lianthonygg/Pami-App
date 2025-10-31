import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pami_app/features/common/data/local/app_database.dart';

final databaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(() {
    db.close();
  });
  return db;
});
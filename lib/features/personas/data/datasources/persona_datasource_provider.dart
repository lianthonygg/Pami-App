import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pami_app/core/network/dio_provider.dart';
import 'package:pami_app/features/personas/data/datasources/persona_remote_datasource.dart';

final personaRemoteDatasourceProvider = Provider<PersonaRemoteDatasource>((
  ref,
) {
  final dio = ref.watch(dioProvider);
  return PersonaRemoteDatasource(dio);
});

import 'package:pami_app/core/network/dio_provider.dart';
import 'package:pami_app/features/personas/data/datasources/persona_remote_datasource.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'datasource_provider.g.dart';

@riverpod
PersonaRemoteDatasource personaRemoteDataSource(Ref ref) {
  final dio = ref.watch(dioProvider);
  return PersonaRemoteDatasource(dio);
}

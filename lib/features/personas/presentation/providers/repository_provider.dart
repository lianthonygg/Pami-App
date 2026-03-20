import 'package:pami_app/features/personas/data/repositories/persona_repository_impl.dart';
import 'package:pami_app/features/personas/presentation/providers/datasource_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repository_provider.g.dart';

@riverpod
PersonaRepositoryImpl personaRepositoryImpl(Ref ref) {
  final remoteDatasource = ref.watch(personaRemoteDataSourceProvider);
  return PersonaRepositoryImpl(remoteDatasource);
}

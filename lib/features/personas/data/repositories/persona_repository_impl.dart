import 'package:pami_app/features/personas/data/datasources/persona_remote_datasource.dart';
import 'package:pami_app/features/personas/data/model/create_persona_model.dart';
import 'package:pami_app/features/common/domain/entities/persona.dart';
import 'package:pami_app/features/personas/domain/repositories/persona_repository.dart';

class PersonaRepositoryImpl implements PersonaRepository {
  final PersonaRemoteDatasource remoteDatasource;

  PersonaRepositoryImpl(this.remoteDatasource);

  @override
  Future<CreatePersonaResponse> createPerson(
    CreatePersonaRequest request,
  ) async {
    try {
      final ResponseCreatePersonaModel persona = await remoteDatasource
          .createPerson(request);
      return persona;
    } catch (e) {
      rethrow;
    }
  }
}

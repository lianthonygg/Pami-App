import 'package:pami_app/features/personas/data/model/create_persona_model.dart';
import 'package:pami_app/features/common/domain/entities/persona.dart';

abstract class PersonaRepository {
  Future<CreatePersonaResponse> createPerson(CreatePersonaRequest request);
}

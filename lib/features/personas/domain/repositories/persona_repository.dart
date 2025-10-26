import 'package:pami_app/features/personas/data/model/create_persona_model.dart';
import 'package:pami_app/features/personas/domain/entities/persona.dart';

abstract class PersonaRepository {
  Future<List<Persona>> getAll();

  Future<Persona> getByCI(String ci);

  Future<CreatePersonaResponse> createPerson(CreatePersonaRequest request);
}

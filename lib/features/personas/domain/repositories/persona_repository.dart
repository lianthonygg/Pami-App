import 'package:pami_app/features/personas/domain/entities/persona.dart';

abstract class PersonaRepository {
  Future<Persona> getByCI(String ci);
}

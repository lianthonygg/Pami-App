import 'package:pami_app/features/common/data/local/app_database.dart';
import 'package:pami_app/features/common/data/model/persona_model.dart';
import 'package:pami_app/features/common/domain/entities/cdr.dart';
import 'package:pami_app/features/common/domain/entities/circunscripcion.dart';
import 'package:pami_app/features/common/domain/entities/gestante.dart';
import 'package:pami_app/features/common/domain/entities/persona.dart';
import 'package:pami_app/features/common/domain/entities/puerpera.dart';
import 'package:pami_app/features/personas/data/model/create_persona_model.dart';

abstract class LocalRepository {
  Future<void> insertOrUpdateCircunscripcion(
    List<Circunscripcion> circunscripciones,
  );

  Stream<List<CircunscripcionEntity>> watchAllCircunscripciones();

  Future<void> insertOrUpdateCDR(List<Cdr> cdrs);

  Stream<List<CdrEntity>> watchCdrsByCircunscripcion(String circunscripcionId);

  Future<void> insertOrUpdatePersonas(List<Persona> personas);

  Stream<List<PersonasEntity>> watchPacientes();

  Future<PersonaConCdrYCircunscripcion?> getPacienteByCi(String ci);

  Future<void> insertOrUpdateGestantes(List<Gestante> gestantes);

  Future<void> insertOrUpdatePuerperas(List<Puerpera> puerperas);

  Future<void> createPerson(CreatePersonaRequest request);
}

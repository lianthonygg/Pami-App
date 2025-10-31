import 'package:pami_app/features/common/domain/entities/cdr.dart';
import 'package:pami_app/features/common/domain/entities/circunscripcion.dart';
import 'package:pami_app/features/common/domain/entities/persona.dart';

abstract class CommonRepository {
  Future<List<Circunscripcion>> getCircunscripciones(DateTime? lastModified);

  Future<Persona> getByCI(String ci);

  Future<List<Cdr>> getCdrs(String circunscripcion);
}

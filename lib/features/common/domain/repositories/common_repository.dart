import 'package:pami_app/features/common/domain/entities/cdr.dart';
import 'package:pami_app/features/common/domain/entities/circunscripcion.dart';

abstract class CommonRepository {
  Future<List<Circunscripcion>> getCircunscripciones();

  Future<List<Cdr>> getCdrs(String circunscripcion);
}

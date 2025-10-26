import 'package:pami_app/features/common/domain/entities/circunscripcion.dart';
import 'package:pami_app/features/common/domain/repositories/common_repository.dart';

class CircunscripcionUseCase {
  final CommonRepository repository;

  CircunscripcionUseCase(this.repository);

  Future<List<Circunscripcion>> getCircunscripciones() {
    return repository.getCircunscripciones();
  }
}

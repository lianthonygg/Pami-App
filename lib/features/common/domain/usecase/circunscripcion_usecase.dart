import 'package:pami_app/features/common/data/local/app_database.dart';
import 'package:pami_app/features/common/domain/entities/circunscripcion.dart';
import 'package:pami_app/features/common/domain/repositories/common_repository.dart';
import 'package:pami_app/features/common/domain/repositories/local_repository.dart';

class CircunscripcionUseCase {
  final CommonRepository repository;
  final LocalRepository localRepository;

  CircunscripcionUseCase(this.repository, this.localRepository);

  Future<List<Circunscripcion>> getCircunscripciones(DateTime? lastModified) {
    return repository.getCircunscripciones(lastModified);
  }

  Stream<List<CircunscripcionEntity>> watchCircunscripciones() {
    return localRepository.watchAllCircunscripciones();
  }
}

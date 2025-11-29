import 'package:pami_app/features/common/domain/entities/gestante.dart';
import 'package:pami_app/features/common/domain/entities/persona.dart';
import 'package:pami_app/features/common/domain/entities/puerpera.dart';
import 'package:pami_app/features/common/domain/repositories/common_repository.dart';
import 'package:pami_app/features/common/domain/repositories/local_repository.dart';

class PersonasSyncUseCase {
  final CommonRepository repository;
  final LocalRepository localRepository;

  PersonasSyncUseCase(this.repository, this.localRepository);

  Future<List<Persona>> getPacientes(DateTime? lastModified) {
    return repository.getPacientes(lastModified);
  }

  Future<List<Gestante>> getGestantes(DateTime? lastModified) {
    return repository.getGestantes(lastModified);
  }

  Future<List<Puerpera>> getPuerperas(DateTime? lastModified) {
    return repository.getPuerperas(lastModified);
  }
}

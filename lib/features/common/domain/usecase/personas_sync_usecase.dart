import 'package:pami_app/features/common/domain/entities/persona.dart';
import 'package:pami_app/features/common/domain/repositories/common_repository.dart';
import 'package:pami_app/features/common/domain/repositories/local_repository.dart';

class PersonasSyncUseCase {
  final CommonRepository repository;
  final LocalRepository localRepository;

  PersonasSyncUseCase(this.repository, this.localRepository);

  Future<List<Persona>> getPacientes(DateTime? lastModified) {
    return repository.getPacientes(lastModified);
  }
}

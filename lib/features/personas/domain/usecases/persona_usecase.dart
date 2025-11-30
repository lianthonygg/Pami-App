import 'package:pami_app/features/common/data/local/app_database.dart';
import 'package:pami_app/features/common/data/model/persona_model.dart';
import 'package:pami_app/features/common/domain/repositories/common_repository.dart';
import 'package:pami_app/features/common/domain/repositories/local_repository.dart';
import 'package:pami_app/features/personas/data/model/create_persona_model.dart';
import 'package:pami_app/features/common/domain/entities/persona.dart';
import 'package:pami_app/features/personas/domain/repositories/persona_repository.dart';

class PersonaUseCase {
  final PersonaRepository repository;
  final CommonRepository commonRepository;
  final LocalRepository localRepository;

  PersonaUseCase(this.repository, this.commonRepository, this.localRepository);

  Stream<List<PersonasEntity>> watchPacientes() {
    return localRepository.watchPacientes();
  }

  Future<PersonaConCdrYCircunscripcion?> watchPacienteByCi(String ci) {
    return localRepository.getPacienteByCi(ci);
  }

  Future<CreatePersonaResponse> create(CreatePersonaRequest request) {
    return repository.createPerson(request);
  }
}

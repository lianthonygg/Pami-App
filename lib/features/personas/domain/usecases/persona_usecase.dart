import 'package:pami_app/features/common/domain/repositories/common_repository.dart';
import 'package:pami_app/features/common/domain/repositories/local_repository.dart';
import 'package:pami_app/features/personas/data/model/create_persona_model.dart';
import 'package:pami_app/features/common/domain/entities/persona.dart';
import 'package:pami_app/features/personas/domain/repositories/persona_repository.dart';

import '../../../common/data/local/app_database.dart';

class PersonaUseCase {
  final PersonaRepository repository;
  final CommonRepository commonRepository;

  PersonaUseCase(this.repository, this.commonRepository);

  Future<List<Persona>> all() {
    return repository.getAll();
  }

  Future<Persona> call(String ci) {
    return commonRepository.getByCI(ci);
  }

  Future<CreatePersonaResponse> create(CreatePersonaRequest request) {
    return repository.createPerson(request);
  }
}

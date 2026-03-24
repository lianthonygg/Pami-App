import 'package:pami_app/features/common/domain/entities/persona.dart';
import 'package:pami_app/features/common/domain/repositories/common_repository.dart';
import 'package:pami_app/features/gestograma/data/model/create_gestante_model.dart';
import 'package:pami_app/features/gestograma/data/model/gestante_model.dart';
import 'package:pami_app/features/gestograma/domain/entities/gestante.dart';
import 'package:pami_app/features/gestograma/domain/repositories/gestante_repository.dart';

class GestanteUseCase {
  final GestanteRepository repository;
  final CommonRepository commonRepository;

  GestanteUseCase(this.repository, this.commonRepository);

  Stream<List<GestantesResponseModel>> watchGestantes() {
    return repository.watchGestantes();
  }

  Future<PersonaWithGestanteDetail?> getGestanteByCi(String ci) async {
    return repository.getGestanteByCi(ci);
  }

  Future<Persona?> getTryGestanteByCi(String ci) {
    return commonRepository.getTryGestanteByCI(ci);
  }

  Future<void> saveLocal(CreateGestanteRequest request) async {
    return repository.createGestante(request);
  }

  Future<CreatePersonaResponse> create(CreateGestanteRequest request) {
    return repository.createGestanteServer(request);
  }
}

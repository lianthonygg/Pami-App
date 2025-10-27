import 'package:pami_app/features/common/domain/entities/persona.dart';
import 'package:pami_app/features/common/domain/repositories/common_repository.dart';
import 'package:pami_app/features/pregestograma/domain/entities/pregestante.dart';
import 'package:pami_app/features/pregestograma/domain/repositories/pregestante_repository.dart';

class PregestantesUseCase {
  final PregestanteRepository repository;
  final CommonRepository commonRepository;

  PregestantesUseCase(this.repository, this.commonRepository);

  Future<List<Pregestante>> all() async {
    return repository.getAll();
  }

  Future<Persona> search(String ci) {
    return commonRepository.getByCI(ci);
  }
}

import 'package:pami_app/features/gestograma/data/model/gestante_model.dart';
import 'package:pami_app/features/gestograma/domain/repositories/gestante_repository.dart';

class GestanteUseCase {
  final GestanteRepository repository;

  GestanteUseCase(this.repository);

  Stream<List<GestantesResponseModel>> watchGestantes() {
    return repository.watchGestantes();
  }
}

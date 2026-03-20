import 'package:pami_app/features/gestograma/data/model/gestante_model.dart';
import 'package:pami_app/features/gestograma/domain/entities/gestante.dart';

abstract class GestanteRepository {
  Stream<List<GestantesResponseModel>> watchGestantes();

  Future<PersonaWithGestanteDetail?> getGestanteByCi(String ci);
}

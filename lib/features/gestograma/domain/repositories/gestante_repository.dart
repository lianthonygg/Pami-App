import 'package:pami_app/features/gestograma/data/model/gestante_model.dart';

abstract class GestanteRepository {
  Stream<List<GestantesResponseModel>> watchGestantes();
}

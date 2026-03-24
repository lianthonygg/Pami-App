import 'package:pami_app/features/gestograma/data/model/create_gestante_model.dart';
import 'package:pami_app/features/gestograma/data/model/gestante_model.dart';
import 'package:pami_app/features/gestograma/domain/entities/gestante.dart';
import 'package:pami_app/features/personas/data/model/create_persona_model.dart';

abstract class GestanteRepository {
  Future<void> createGestante(CreateGestanteRequest request);

  Future<ResponseCreatePersonaModel> createGestanteServer(CreateGestanteRequest request);

  Stream<List<GestantesResponseModel>> watchGestantes();

  Future<PersonaWithGestanteDetail?> getGestanteByCi(String ci);
}

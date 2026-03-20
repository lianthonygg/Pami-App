import 'package:pami_app/features/pregestograma/domain/entities/pregestante.dart';

abstract class PregestanteRepository {
  Future<List<Pregestante>> getAll();
}

import 'package:pami_app/features/pregestograma/data/datasource/pregestante_remote_datasource.dart';
import 'package:pami_app/features/pregestograma/data/model/pregestante_model.dart';
import 'package:pami_app/features/pregestograma/domain/entities/pregestante.dart';
import 'package:pami_app/features/pregestograma/domain/repositories/pregestante_repository.dart';

class PregestanteRepositoryImpl implements PregestanteRepository {
  final PregestanteRemoteDatasource remoteDatasource;

  PregestanteRepositoryImpl(this.remoteDatasource);

  @override
  Future<List<Pregestante>> getAll() async {
    try {
      final List<PregestanteModel> pregestantes =
          await remoteDatasource.getPregestantes();
      return pregestantes;
    } catch (e) {
      rethrow;
    }
  }
}

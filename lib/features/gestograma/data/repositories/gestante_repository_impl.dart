import 'package:pami_app/features/gestograma/data/datasources/gestantes_local_datasource.dart';
import 'package:pami_app/features/gestograma/data/model/gestante_model.dart';
import 'package:pami_app/features/gestograma/domain/repositories/gestante_repository.dart';

class GestanteRepositoryImpl extends GestanteRepository {
  final GestantesLocalDataSource localDataSource;

  GestanteRepositoryImpl(this.localDataSource);

  @override
  Stream<List<GestantesResponseModel>> watchGestantes() {
    return localDataSource.watchGestantes();
  }
}

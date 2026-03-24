import 'package:pami_app/features/gestograma/data/datasources/gestantes_local_datasource.dart';
import 'package:pami_app/features/gestograma/data/datasources/gestantes_remote_datasource.dart';
import 'package:pami_app/features/gestograma/data/model/create_gestante_model.dart';
import 'package:pami_app/features/gestograma/data/model/gestante_model.dart';
import 'package:pami_app/features/gestograma/domain/entities/gestante.dart';
import 'package:pami_app/features/gestograma/domain/repositories/gestante_repository.dart';
import 'package:pami_app/features/personas/data/model/create_persona_model.dart';

class GestanteRepositoryImpl extends GestanteRepository {
  final GestantesLocalDataSource localDataSource;
  final GestantesRemoteDataSource remoteDataSource;

  GestanteRepositoryImpl(this.localDataSource, this.remoteDataSource);

  @override
  Stream<List<GestantesResponseModel>> watchGestantes() {
    return localDataSource.watchGestantes();
  }

  @override
  Future<PersonaWithGestanteDetail?> getGestanteByCi(String ci) {
    return localDataSource.getGestanteByCi(ci);
  }

  @override
  Future<void> createGestante(CreateGestanteRequest request) {
    return localDataSource.createGestante(request);
  }

  @override
  Future<ResponseCreatePersonaModel> createGestanteServer(
    CreateGestanteRequest request,
  ) {
    return remoteDataSource.createGestante(request);
  }
}

import 'package:pami_app/features/posgestograma/data/datasources/puerpera_local_datasource.dart';
import 'package:pami_app/features/posgestograma/data/model/puerpera_model.dart';
import 'package:pami_app/features/posgestograma/domain/repositories/puerpera_repository.dart';

class PuerperaRepositoryImpl implements PuerperaRepository {
  final PuerperaLocalDataSource localDataSource;

  PuerperaRepositoryImpl(this.localDataSource);

  @override
  Stream<List<PuerperasResponseModel>> watchPuerperas() {
    return localDataSource.watchPuerperas();
  }
}

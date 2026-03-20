import 'package:pami_app/features/posgestograma/data/model/puerpera_model.dart';
import 'package:pami_app/features/posgestograma/domain/repositories/puerpera_repository.dart';

class PuerperaUseCase {
  final PuerperaRepository repository;

  PuerperaUseCase(this.repository);

  Stream<List<PuerperasResponseModel>> watchPuerperas() {
    return repository.watchPuerperas();
  }
}

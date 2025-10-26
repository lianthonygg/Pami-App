import 'package:pami_app/features/common/domain/entities/cdr.dart';
import 'package:pami_app/features/common/domain/repositories/common_repository.dart';

class CdrUseCase {
  final CommonRepository repository;

  CdrUseCase(this.repository);

  Future<List<Cdr>> getCdrs(String circunscripcion) {
    return repository.getCdrs(circunscripcion);
  }
}

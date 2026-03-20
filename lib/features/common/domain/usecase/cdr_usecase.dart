import 'package:pami_app/features/common/data/local/app_database.dart';
import 'package:pami_app/features/common/domain/entities/cdr.dart';
import 'package:pami_app/features/common/domain/repositories/common_repository.dart';
import 'package:pami_app/features/common/domain/repositories/local_repository.dart';

class CdrUseCase {
  final CommonRepository repository;
  final LocalRepository localRepository;

  CdrUseCase(this.repository, this.localRepository);

  Future<List<Cdr>> getCdrs(DateTime? lastModified) {
    return repository.getCdrs(lastModified);
  }

  Stream<List<CdrEntity>> watchCdrs(String circunscripcionId) {
    return localRepository.watchCdrsByCircunscripcion(circunscripcionId);
  }
}

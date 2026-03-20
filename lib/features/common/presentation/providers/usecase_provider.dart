import 'package:pami_app/features/common/domain/usecase/cdr_usecase.dart';
import 'package:pami_app/features/common/domain/usecase/circunscripcion_usecase.dart';
import 'package:pami_app/features/common/domain/usecase/personas_sync_usecase.dart';
import 'package:pami_app/features/common/presentation/providers/repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'usecase_provider.g.dart';

@riverpod
CdrUseCase cdrUseCase(Ref ref) {
  final repository = ref.watch(commonRepositoryImplProvider);
  final localRepository = ref.watch(localRepositoryImplProvider);
  return CdrUseCase(repository, localRepository);
}

@riverpod
CircunscripcionUseCase circunscripcionUseCase(Ref ref) {
  final repository = ref.watch(commonRepositoryImplProvider);
  final localRepository = ref.watch(localRepositoryImplProvider);
  return CircunscripcionUseCase(repository, localRepository);
}

@riverpod
PersonasSyncUseCase personasSyncUseCase(Ref ref) {
  final repository = ref.watch(commonRepositoryImplProvider);
  final localRepository = ref.watch(localRepositoryImplProvider);
  return PersonasSyncUseCase(repository, localRepository);
}

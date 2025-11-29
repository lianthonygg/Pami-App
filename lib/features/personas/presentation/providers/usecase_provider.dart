import 'package:pami_app/features/common/presentation/providers/repository_provider.dart';
import 'package:pami_app/features/personas/domain/usecases/persona_usecase.dart';
import 'package:pami_app/features/personas/presentation/providers/repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'usecase_provider.g.dart';

@riverpod
PersonaUseCase personaUseCase(Ref ref) {
  final repository = ref.watch(personaRepositoryImplProvider);
  final commonRepository = ref.watch(commonRepositoryImplProvider);
  final localRepository = ref.watch(localRepositoryImplProvider);
  return PersonaUseCase(repository, commonRepository, localRepository);
}

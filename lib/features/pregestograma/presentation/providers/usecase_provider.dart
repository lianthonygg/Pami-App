import 'package:pami_app/features/common/presentation/providers/repository_provider.dart';
import 'package:pami_app/features/pregestograma/domain/usecases/pregestantes_usecase.dart';
import 'package:pami_app/features/pregestograma/presentation/providers/repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'usecase_provider.g.dart';

@riverpod
PregestantesUseCase pregestantesUseCase(Ref ref) {
  final repository = ref.watch(pregestanteRepositoryImplProvider);
  final commonRepository = ref.watch(commonRepositoryImplProvider);
  return PregestantesUseCase(repository, commonRepository);
}

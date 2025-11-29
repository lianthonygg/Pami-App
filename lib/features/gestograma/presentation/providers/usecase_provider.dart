import 'package:pami_app/features/gestograma/domain/usecases/gestante_usecase.dart';
import 'package:pami_app/features/gestograma/presentation/providers/repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'usecase_provider.g.dart';

@riverpod
GestanteUseCase gestanteUseCase(Ref ref) {
  final repository = ref.watch(gestanteRepositoryImplProvider);
  return GestanteUseCase(repository);
}

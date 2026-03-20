import 'package:pami_app/features/posgestograma/domain/usecases/puerpera_usecase.dart';
import 'package:pami_app/features/posgestograma/presentation/providers/repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'usecase_provider.g.dart';

@riverpod
PuerperaUseCase puerperaUseCase(Ref ref) {
  final repository = ref.watch(puerperaRepositoryImplProvider);
  return PuerperaUseCase(repository);
}

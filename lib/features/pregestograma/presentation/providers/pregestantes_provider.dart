import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pami_app/features/pregestograma/domain/usecases/pregestantes_usecase.dart';
import 'package:pami_app/features/pregestograma/presentation/viewmodels/pregestantes_viewmodel.dart';

final observacionesProvider = StateProvider<String>((ref) => '');
final ciProvider = StateProvider<String>((ref) => '');

final pregestantesUseCaseProvider = Provider<PregestantesUseCase>((ref) {
  throw UnimplementedError(
    'pregestantesUseCaseProvider debe ser sobreescrito en main.dart',
  );
});

final pregestantesViewModelProvider =
    StateNotifierProvider<PregestantesViewModel, PregestantesState>((ref) {
      final useCase = ref.watch(pregestantesUseCaseProvider);
      return PregestantesViewModel(useCase);
    });

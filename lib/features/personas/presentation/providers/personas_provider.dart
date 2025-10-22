import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pami_app/features/personas/domain/usecases/persona_usecase.dart';
import 'package:pami_app/features/personas/presentation/viewmodels/personas_viewmodel.dart';

final personasUseCaseProvider = Provider<PersonaUseCase>((ref) {
  throw UnimplementedError(
    'personasUseCaseProvider debe ser sobreescrito en main.dart',
  );
});

final personasViewModelProvider =
    StateNotifierProvider<PersonasViewModel, PersonasState>((ref) {
      final useCase = ref.watch(personasUseCaseProvider);
      return PersonasViewModel(useCase);
    });

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pami_app/features/common/data/local/app_database.dart';
import 'package:pami_app/features/common/domain/entities/cdr.dart';
import 'package:pami_app/features/common/domain/entities/circunscripcion.dart';
import 'package:pami_app/features/common/domain/usecase/cdr_usecase.dart';
import 'package:pami_app/features/common/domain/usecase/circunscripcion_usecase.dart';
import 'package:pami_app/features/common/domain/entities/persona.dart';
import 'package:pami_app/features/personas/domain/usecases/persona_usecase.dart';
import 'package:pami_app/features/personas/presentation/providers/persona_form_provider.dart';
import 'package:pami_app/features/personas/presentation/viewmodels/personas_viewmodel.dart';

final personasUseCaseProvider = Provider<PersonaUseCase>((ref) {
  throw UnimplementedError(
    'personasUseCaseProvider debe ser sobreescrito en main.dart',
  );
});

final circunscripcionesUseCaseProvider = Provider<CircunscripcionUseCase>((
  ref,
) {
  throw UnimplementedError(
    'circunscripcionesUseCaseProvider debe ser sobreescrito en main.dart',
  );
});

final cdrUseCaseProvider = Provider<CdrUseCase>((ref) {
  throw UnimplementedError(
    'cdrUseCaseProvider debe ser sobreescrito en main.dart',
  );
});

final personasViewModelProvider =
    StateNotifierProvider<PersonasViewModel, PersonasState>((ref) {
      final useCase = ref.watch(personasUseCaseProvider);
      return PersonasViewModel(useCase);
    });

final circunscripcionProvider = StateNotifierProvider<
  CircunscripcionNotifier,
  SelectState<CircunscripcionEntity>
>((ref) {
  final circunscripcionUseCase = ref.watch(circunscripcionesUseCaseProvider);
  return CircunscripcionNotifier(circunscripcionUseCase);
});

final cdrProvider = StateNotifierProvider<CdrNotifier, SelectState<Cdr>>((ref) {
  final cdrUseCase = ref.watch(cdrUseCaseProvider);
  return CdrNotifier(cdrUseCase);
});

final personaByCiProvider = FutureProvider.family<Persona, String>((
  ref,
  ci,
) async {
  final usecase = ref.read(personasUseCaseProvider);
  return await usecase.call(ci);
});

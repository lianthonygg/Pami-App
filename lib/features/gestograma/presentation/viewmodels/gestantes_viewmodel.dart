import 'package:pami_app/features/gestograma/domain/entities/gestante.dart';
import 'package:pami_app/features/gestograma/domain/usecases/gestante_usecase.dart';
import 'package:pami_app/features/gestograma/presentation/providers/usecase_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'gestantes_viewmodel.g.dart';

@riverpod
class GestantesViewModel extends _$GestantesViewModel {
  late final GestanteUseCase gestanteUseCase;

  @override
  GestantesState build() {
    gestanteUseCase = ref.watch(gestanteUseCaseProvider);
    return GestantesState();
  }

  Future<void> getAll() async {
    state = state.copyWith(isLoading: true, error: null);

    gestanteUseCase.watchGestantes().listen((gestantes) {
      state = state.copyWith(isLoading: false, items: gestantes);
    });
  }
}

class GestantesState {
  final bool isLoading;
  final List<Gestante>? items;
  final String? error;

  GestantesState({this.isLoading = false, this.error, this.items});

  GestantesState copyWith({
    bool? isLoading,
    String? error,
    List<Gestante>? items,
  }) {
    return GestantesState(
      isLoading: isLoading ?? this.isLoading,
      items: items,
      error: error,
    );
  }
}

import 'package:pami_app/core/error/server_exception.dart';
import 'package:pami_app/features/common/domain/entities/persona.dart';
import 'package:pami_app/features/pregestograma/domain/entities/pregestante.dart';
import 'package:pami_app/features/pregestograma/domain/usecases/pregestantes_usecase.dart';
import 'package:pami_app/features/pregestograma/presentation/providers/usecase_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pregestantes_viewmodel.g.dart';

@riverpod
class PregestantesViewModel extends _$PregestantesViewModel {
  late final PregestantesUseCase pregestantesUseCase;

  @override
  PregestantesState build() {
    pregestantesUseCase = ref.read(pregestantesUseCaseProvider);
    return PregestantesState();
  }

  Future<void> getAll() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final pregestantes = await pregestantesUseCase.all();
      state = state.copyWith(isLoading: false, items: pregestantes);
    } on ServerException catch (e) {
      state = state.copyWith(isLoading: false, error: e.detail);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> getByCi(String ci) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final persona = await pregestantesUseCase.search(ci);
      state = state.copyWith(isLoading: false, data: persona);
    } on ServerException catch (e) {
      state = state.copyWith(isLoading: false, error: e.detail);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}

class PregestantesState {
  final bool isLoading;
  final List<Pregestante>? items;
  final Persona? data;
  final String? error;

  PregestantesState({
    this.isLoading = false,
    this.error,
    this.items,
    this.data,
  });

  PregestantesState copyWith({
    bool? isLoading,
    String? error,
    List<Pregestante>? items,
    Persona? data,
  }) {
    return PregestantesState(
      isLoading: isLoading ?? this.isLoading,
      data: data ?? this.data,
      items: items,
      error: error ?? this.error,
    );
  }
}

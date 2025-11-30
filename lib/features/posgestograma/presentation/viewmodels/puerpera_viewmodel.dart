import 'package:pami_app/features/posgestograma/domain/entities/puerpera.dart';
import 'package:pami_app/features/posgestograma/domain/usecases/puerpera_usecase.dart';
import 'package:pami_app/features/posgestograma/presentation/providers/usecase_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'puerpera_viewmodel.g.dart';

@riverpod
class PuerperaViewModel extends _$PuerperaViewModel {
  late final PuerperaUseCase _puerperaUseCase;

  @override
  PuerperasState build() {
    _puerperaUseCase = ref.watch(puerperaUseCaseProvider);
    return PuerperasState();
  }

  Future<void> getAll() async {
    state = state.copyWith(isLoading: true, error: null);

    _puerperaUseCase.watchPuerperas().listen((puerperas) {
      state = state.copyWith(isLoading: false, items: puerperas);
    });
  }
}

class PuerperasState {
  final bool isLoading;
  final List<Puerpera>? items;
  final String? error;

  PuerperasState({this.isLoading = false, this.error, this.items});

  PuerperasState copyWith({
    bool? isLoading,
    String? error,
    List<Puerpera>? items,
  }) {
    return PuerperasState(
      isLoading: isLoading ?? this.isLoading,
      items: items,
      error: error,
    );
  }
}

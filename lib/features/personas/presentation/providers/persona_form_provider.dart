import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pami_app/features/common/domain/entities/cdr.dart';
import 'package:pami_app/features/common/domain/entities/circunscripcion.dart';
import 'package:pami_app/features/common/domain/usecase/cdr_usecase.dart';
import 'package:pami_app/features/common/domain/usecase/circunscripcion_usecase.dart';

final fullNameProvider = StateProvider<String>((ref) => '');
final ciProvider = StateProvider<String>((ref) => '');
final sexoProvider = StateProvider<String>((ref) => '');
final razaProvider = StateProvider<String>((ref) => '');
final direccionCIProvider = StateProvider<String>((ref) => '');
final direccionViveProvider = StateProvider<String>((ref) => '');
final phoneProvider = StateProvider<String>((ref) => '');
final antPpProvider = StateProvider<String>((ref) => '');
final nivelEscolarProvider = StateProvider<String>((ref) => '');
final profesionProvider = StateProvider<String>((ref) => '');
final grupoDispensarialProvider = StateProvider<String>((ref) => '');
final observacionesProvider = StateProvider<String>((ref) => '');
final controladaProvider = StateProvider<String>((ref) => 'false');

// ==== STATE ====
class SelectState<T> {
  final List<T> items;
  final bool isLoading;
  final String? error;
  final T? selected;

  const SelectState({
    this.items = const [],
    this.isLoading = false,
    this.error,
    this.selected,
  });

  SelectState<T> copyWith({
    List<T>? items,
    bool? isLoading,
    String? error,
    T? selected,
  }) {
    return SelectState<T>(
      items: items ?? this.items,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      selected: selected ?? this.selected,
    );
  }
}

// ==== NOTIFIERS ====
class CircunscripcionNotifier
    extends StateNotifier<SelectState<Circunscripcion>> {
  final CircunscripcionUseCase circunscripcionUseCase;

  CircunscripcionNotifier(this.circunscripcionUseCase)
    : super(const SelectState());

  Future<void> load() async {
    state = state.copyWith(isLoading: true);

    try {
      final circunscripciones =
          await circunscripcionUseCase.getCircunscripciones();

      state = state.copyWith(isLoading: false, items: circunscripciones);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  void select(Circunscripcion? c) {
    state = state.copyWith(selected: c);
  }

  void reset() {
    state = const SelectState();
  }
}

class CdrNotifier extends StateNotifier<SelectState<Cdr>> {
  final CdrUseCase cdrUseCase;

  CdrNotifier(this.cdrUseCase) : super(const SelectState());

  Future<void> load(String circunscripcionId) async {
    state = state.copyWith(isLoading: true);

    try {
      final cdrs = await cdrUseCase.getCdrs(circunscripcionId);
      state = state.copyWith(isLoading: false, items: cdrs);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  void select(Cdr? c) {
    state = state.copyWith(selected: c);
  }

  void reset() {
    state = const SelectState();
  }
}

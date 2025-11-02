import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pami_app/features/common/data/local/app_database.dart';
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
    extends StateNotifier<SelectState<CircunscripcionEntity>> {
  final CircunscripcionUseCase circunscripcionUseCase;

  CircunscripcionNotifier(this.circunscripcionUseCase)
    : super(const SelectState()) {
    _init();
  }

  void _init() {
    circunscripcionUseCase.watchCircunscripciones().listen((circunscripciones) {
      state = state.copyWith(isLoading: false, items: circunscripciones);
    });
  }

  // Future<void> load() async {
  //   state = state.copyWith(isLoading: true);
  //
  //   try {
  //     final circunscripciones =
  //         await circunscripcionUseCase.getCircunscripciones(DateTime.now());
  //
  //     state = state.copyWith(isLoading: false, items: circunscripciones);
  //   } catch (e) {
  //     state = state.copyWith(isLoading: false, error: e.toString());
  //   }
  // }

  void select(CircunscripcionEntity? c) {
    state = state.copyWith(selected: c);
  }

  void reset() {
    state = const SelectState();
  }
}

class CdrNotifier extends StateNotifier<SelectState<CdrEntity>> {
  final CdrUseCase cdrUseCase;

  CdrNotifier(this.cdrUseCase) : super(const SelectState());

  void init(String circunscripcionId) {
    cdrUseCase.watchCdrs(circunscripcionId).listen((cdrs) {
      state = state.copyWith(isLoading: false, items: cdrs);
    });
  }

  // Future<void> load(String circunscripcionId) async {
  //   state = state.copyWith(isLoading: true);

  //   try {
  //     final cdrs = await cdrUseCase.getCdrs(DateTime.now());
  //     state = state.copyWith(isLoading: false, items: cdrs);
  //   } catch (e) {
  //     state = state.copyWith(isLoading: false, error: e.toString());
  //   }
  // }

  void select(CdrEntity? c) {
    state = state.copyWith(selected: c);
  }

  void reset() {
    state = const SelectState();
  }
}

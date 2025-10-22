import 'package:flutter_riverpod/flutter_riverpod.dart';

class Circunscripcion {
  final String id;
  final String nombre;
  Circunscripcion({required this.id, required this.nombre});
}

class Cdr {
  final String id;
  final String nombre;
  final String circunscripcionId;
  Cdr({
    required this.id,
    required this.nombre,
    required this.circunscripcionId,
  });
}

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
  CircunscripcionNotifier() : super(const SelectState());

  Future<void> load() async {
    state = state.copyWith(isLoading: true);

    await Future.delayed(const Duration(milliseconds: 800));
    final mock = [
      Circunscripcion(
        id: '97eaf158-9040-41fd-acbf-4bacd78bd7d5',
        nombre: 'Circunscripción 1',
      ),
      Circunscripcion(id: '2', nombre: 'Circunscripción 2'),
    ];

    state = state.copyWith(isLoading: false, items: mock);
  }

  void select(Circunscripcion c) {
    state = state.copyWith(selected: c);
  }
}

class CdrNotifier extends StateNotifier<SelectState<Cdr>> {
  CdrNotifier() : super(const SelectState());

  Future<void> load(String circunscripcionId) async {
    state = state.copyWith(isLoading: true);

    await Future.delayed(const Duration(milliseconds: 600)); // simula backend
    final mock =
        [
          Cdr(
            id: 'e1172efa-cf2b-411d-997c-6c69f0aca0a3',
            nombre: 'CDR 1',
            circunscripcionId: '97eaf158-9040-41fd-acbf-4bacd78bd7d5',
          ),
          Cdr(
            id: 'b',
            nombre: 'CDR 2',
            circunscripcionId: '97eaf158-9040-41fd-acbf-4bacd78bd7d5',
          ),
          Cdr(id: 'c', nombre: 'CDR 3', circunscripcionId: '2'),
        ].where((cdr) => cdr.circunscripcionId == circunscripcionId).toList();

    state = state.copyWith(isLoading: false, items: mock);
  }

  void select(Cdr c) {
    state = state.copyWith(selected: c);
  }
}

// ==== PROVIDERS ====
final circunscripcionProvider = StateNotifierProvider<
  CircunscripcionNotifier,
  SelectState<Circunscripcion>
>((ref) => CircunscripcionNotifier());

final cdrProvider = StateNotifierProvider<CdrNotifier, SelectState<Cdr>>(
  (ref) => CdrNotifier(),
);

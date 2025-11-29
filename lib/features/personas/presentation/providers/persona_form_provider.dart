import 'package:pami_app/features/common/data/local/app_database.dart';
import 'package:pami_app/features/common/domain/usecase/cdr_usecase.dart';
import 'package:pami_app/features/common/domain/usecase/circunscripcion_usecase.dart';
import 'package:pami_app/features/common/presentation/providers/usecase_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'persona_form_provider.g.dart';

@riverpod
class CircunscripcionNotifier extends _$CircunscripcionNotifier {
  late final CircunscripcionUseCase circunscripcionUseCase;

  @override
  SelectState build() {
    circunscripcionUseCase = ref.read(circunscripcionUseCaseProvider);
    _init();
    return SelectState();
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

@riverpod
class CdrNotifier extends _$CdrNotifier {
  late final CdrUseCase cdrUseCase;

  @override
  SelectState build() {
    cdrUseCase = ref.read(cdrUseCaseProvider);
    return SelectState();
  }

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

// final grupoDispensarialProvider = StateProvider<String>((ref) => '');
// final observacionesProvider = StateProvider<String>((ref) => '');
// final controladaProvider = StateProvider<String>((ref) => 'false');

@Riverpod(keepAlive: false)
class FullName extends _$FullName {
  @override
  String build() => '';

  void set(String value) => state = value;
}

@Riverpod(keepAlive: false)
class Ci extends _$Ci {
  @override
  String build() => '';

  void set(String value) => state = value;
}

@Riverpod(keepAlive: false)
class Sexo extends _$Sexo {
  @override
  String build() => '';

  void set(String value) => state = value;
}

@Riverpod(keepAlive: false)
class Raza extends _$Raza {
  @override
  String build() => '';

  void set(String value) => state = value;
}

@Riverpod(keepAlive: false)
class DireccionCI extends _$DireccionCI {
  @override
  String build() => '';

  void set(String value) => state = value;
}

@Riverpod(keepAlive: false)
class DireccionVive extends _$DireccionVive {
  @override
  String build() => '';

  void set(String value) => state = value;
}

@Riverpod(keepAlive: false)
class Phone extends _$Phone {
  @override
  String build() => '';

  void set(String value) => state = value;
}

@Riverpod(keepAlive: false)
class AntPp extends _$AntPp {
  @override
  String build() => '';

  void set(String value) => state = value;
}

@Riverpod(keepAlive: false)
class NivelEscolar extends _$NivelEscolar {
  @override
  String build() => '';

  void set(String value) => state = value;
}

@Riverpod(keepAlive: false)
class Profesion extends _$Profesion {
  @override
  String build() => '';

  void set(String value) => state = value;
}

@Riverpod(keepAlive: false)
class GrupoDispensarial extends _$GrupoDispensarial {
  @override
  String build() => '';

  void set(String value) => state = value;
}

@Riverpod(keepAlive: false)
class Observaciones extends _$Observaciones {
  @override
  String build() => '';

  void set(String value) => state = value;
}

@Riverpod(keepAlive: false)
class Controlada extends _$Controlada {
  @override
  String build() => '';

  void set(String value) => state = value;
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

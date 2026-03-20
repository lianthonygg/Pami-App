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

@Riverpod(keepAlive: true)
class PersonaForm extends _$PersonaForm {
  @override
  ({
    String fullName,
    String ci,
    String sexo,
    String raza,
    String direccionCi,
    String direccionVive,
    String phone,
    String antPp,
    String nivelEscolar,
    String profesion,
    String grupoDispensarial,
    String observaciones,
    String controlada,
  })
  build() => (
    fullName: '',
    ci: '',
    sexo: '',
    raza: '',
    direccionCi: '',
    direccionVive: '',
    phone: '',
    antPp: '',
    nivelEscolar: '',
    profesion: '',
    grupoDispensarial: '',
    observaciones: '',
    controlada: '',
  );

  void setFullName(String value) =>
      state = (
        fullName: value,
        ci: state.ci,
        sexo: state.sexo,
        raza: state.raza,
        direccionCi: state.direccionCi,
        direccionVive: state.direccionVive,
        phone: state.phone,
        antPp: state.antPp,
        nivelEscolar: state.nivelEscolar,
        profesion: state.profesion,
        grupoDispensarial: state.grupoDispensarial,
        observaciones: state.observaciones,
        controlada: state.controlada,
      );

  void setCi(String value) =>
      state = (
        fullName: state.fullName,
        ci: value,
        sexo: state.sexo,
        raza: state.raza,
        direccionCi: state.direccionCi,
        direccionVive: state.direccionVive,
        phone: state.phone,
        antPp: state.antPp,
        nivelEscolar: state.nivelEscolar,
        profesion: state.profesion,
        grupoDispensarial: state.grupoDispensarial,
        observaciones: state.observaciones,
        controlada: state.controlada,
      );

  void setSexo(String value) =>
      state = (
        fullName: state.fullName,
        ci: state.ci,
        sexo: value,
        raza: state.raza,
        direccionCi: state.direccionCi,
        direccionVive: state.direccionVive,
        phone: state.phone,
        antPp: state.antPp,
        nivelEscolar: state.nivelEscolar,
        profesion: state.profesion,
        grupoDispensarial: state.grupoDispensarial,
        observaciones: state.observaciones,
        controlada: state.controlada,
      );

  void setRaza(String value) =>
      state = (
        fullName: state.fullName,
        ci: state.ci,
        sexo: state.sexo,
        raza: value,
        direccionCi: value,
        direccionVive: state.direccionVive,
        phone: state.phone,
        antPp: state.antPp,
        nivelEscolar: state.nivelEscolar,
        profesion: state.profesion,
        grupoDispensarial: state.grupoDispensarial,
        observaciones: state.observaciones,
        controlada: state.controlada,
      );

  void setDireccionCi(String value) =>
      state = (
        fullName: state.fullName,
        ci: state.ci,
        sexo: state.sexo,
        raza: state.raza,
        direccionCi: value,
        direccionVive: state.direccionVive,
        phone: state.phone,
        antPp: state.antPp,
        nivelEscolar: state.nivelEscolar,
        profesion: state.profesion,
        grupoDispensarial: state.grupoDispensarial,
        observaciones: state.observaciones,
        controlada: state.controlada,
      );

  void setDireccionVive(String value) =>
      state = (
        fullName: state.fullName,
        ci: state.ci,
        sexo: state.sexo,
        raza: state.raza,
        direccionCi: state.direccionCi,
        direccionVive: value,
        phone: state.phone,
        antPp: state.antPp,
        nivelEscolar: state.nivelEscolar,
        profesion: state.profesion,
        grupoDispensarial: state.grupoDispensarial,
        observaciones: state.observaciones,
        controlada: state.controlada,
      );

  void setPhone(String value) =>
      state = (
        fullName: state.fullName,
        ci: state.ci,
        sexo: state.sexo,
        raza: state.raza,
        direccionCi: state.direccionCi,
        direccionVive: state.direccionVive,
        phone: value,
        antPp: state.antPp,
        nivelEscolar: state.nivelEscolar,
        profesion: state.profesion,
        grupoDispensarial: state.grupoDispensarial,
        observaciones: state.observaciones,
        controlada: state.controlada,
      );

  void setAntPp(String value) =>
      state = (
        fullName: state.fullName,
        ci: state.ci,
        sexo: state.sexo,
        raza: state.raza,
        direccionCi: state.direccionCi,
        direccionVive: state.direccionVive,
        phone: state.phone,
        antPp: value,
        nivelEscolar: state.nivelEscolar,
        profesion: state.profesion,
        grupoDispensarial: state.grupoDispensarial,
        observaciones: state.observaciones,
        controlada: state.controlada,
      );

  void setNivelEscolar(String value) =>
      state = (
        fullName: state.fullName,
        ci: state.ci,
        sexo: state.sexo,
        raza: state.raza,
        direccionCi: state.direccionCi,
        direccionVive: state.direccionVive,
        phone: state.phone,
        antPp: state.antPp,
        nivelEscolar: value,
        profesion: state.profesion,
        grupoDispensarial: state.grupoDispensarial,
        observaciones: state.observaciones,
        controlada: state.controlada,
      );

  void setProfesion(String value) =>
      state = (
        fullName: state.fullName,
        ci: state.ci,
        sexo: state.sexo,
        raza: state.raza,
        direccionCi: state.direccionCi,
        direccionVive: state.direccionVive,
        phone: state.phone,
        antPp: state.antPp,
        nivelEscolar: state.nivelEscolar,
        profesion: value,
        grupoDispensarial: state.grupoDispensarial,
        observaciones: state.observaciones,
        controlada: state.controlada,
      );

  void setGrupoDispensarial(String value) =>
      state = (
        fullName: state.fullName,
        ci: state.ci,
        sexo: state.sexo,
        raza: state.raza,
        direccionCi: state.direccionCi,
        direccionVive: state.direccionVive,
        phone: state.phone,
        antPp: state.antPp,
        nivelEscolar: state.nivelEscolar,
        profesion: state.profesion,
        grupoDispensarial: value,
        observaciones: state.observaciones,
        controlada: state.controlada,
      );

  void setObservaciones(String value) =>
      state = (
        fullName: state.fullName,
        ci: state.ci,
        sexo: state.sexo,
        raza: state.raza,
        direccionCi: state.direccionCi,
        direccionVive: state.direccionVive,
        phone: state.phone,
        antPp: state.antPp,
        nivelEscolar: state.nivelEscolar,
        profesion: state.profesion,
        grupoDispensarial: state.grupoDispensarial,
        observaciones: value,
        controlada: state.controlada,
      );

  void setControlada(String value) =>
      state = (
        fullName: state.fullName,
        ci: state.ci,
        sexo: state.sexo,
        raza: state.raza,
        direccionCi: state.direccionCi,
        direccionVive: state.direccionVive,
        phone: state.phone,
        antPp: state.antPp,
        nivelEscolar: state.nivelEscolar,
        profesion: state.profesion,
        grupoDispensarial: state.grupoDispensarial,
        observaciones: state.observaciones,
        controlada: value,
      );

  void clear() =>
      state = (
        fullName: '',
        ci: '',
        sexo: '',
        raza: '',
        direccionCi: '',
        direccionVive: '',
        phone: '',
        antPp: '',
        nivelEscolar: '',
        profesion: '',
        grupoDispensarial: '',
        observaciones: '',
        controlada: '',
      );
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

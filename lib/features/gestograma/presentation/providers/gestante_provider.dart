import 'package:pami_app/features/common/domain/entities/persona.dart';
import 'package:pami_app/features/gestograma/domain/entities/gestante.dart';
import 'package:pami_app/features/gestograma/presentation/providers/usecase_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'gestante_provider.g.dart';

@riverpod
Future<PersonaWithGestanteDetail?> gestanteByCi(Ref ref, String ci) async {
  final usecase = ref.read(gestanteUseCaseProvider);
  return await usecase.getGestanteByCi(ci);
}

@riverpod
Future<Persona?> tryGestanteByCi(Ref ref, String? ci) async {
  final usecase = ref.read(gestanteUseCaseProvider);
  if (ci == null) return null;
  return await usecase.getTryGestanteByCi(ci);
}

@Riverpod(keepAlive: true)
class GestanteForm extends _$GestanteForm {
  @override
  ({
    String antPp,
    String observaciones,
    String tgCaptacion,
    String fum,
    String gestaciones,
    String partos,
    String abortos,
    String cesareas,
    String antPPretermino,
    String fechaCaptacion,
    String rciu,
    String imc,
    int clasificacionRiesgo,
    String fechaProbableParto,
  })
  build() => (
    antPp: '',
    observaciones: '',
    tgCaptacion: '',
    fum: '',
    gestaciones: '',
    partos: '',
    abortos: '',
    cesareas: '',
    antPPretermino: '',
    fechaCaptacion: '',
    rciu: '',
    imc: '',
    clasificacionRiesgo: 0,
    fechaProbableParto: '',
  );

  void setAntPp(String value) =>
      state = (
        antPp: value,
        observaciones: state.observaciones,
        tgCaptacion: state.tgCaptacion,
        fum: state.fum,
        gestaciones: state.gestaciones,
        partos: state.partos,
        abortos: state.abortos,
        cesareas: state.cesareas,
        antPPretermino: state.antPPretermino,
        fechaCaptacion: state.fechaCaptacion,
        rciu: state.rciu,
        imc: state.imc,
        clasificacionRiesgo: state.clasificacionRiesgo,
        fechaProbableParto: state.fechaProbableParto,
      );

  void setObservaciones(String value) =>
      state = (
        antPp: state.antPp,
        observaciones: value,
        tgCaptacion: state.tgCaptacion,
        fum: state.fum,
        gestaciones: state.gestaciones,
        partos: state.partos,
        abortos: state.abortos,
        cesareas: state.cesareas,
        antPPretermino: state.antPPretermino,
        fechaCaptacion: state.fechaCaptacion,
        rciu: state.rciu,
        imc: state.imc,
        clasificacionRiesgo: state.clasificacionRiesgo,
        fechaProbableParto: state.fechaProbableParto,
      );

  void setTgCaptacion(int sem, int dias) =>
      state = (
        antPp: state.antPp,
        observaciones: state.observaciones,
        tgCaptacion: "$sem.${dias}sem",
        fum: state.fum,
        gestaciones: state.gestaciones,
        partos: state.partos,
        abortos: state.abortos,
        cesareas: state.cesareas,
        antPPretermino: state.antPPretermino,
        fechaCaptacion: state.fechaCaptacion,
        rciu: state.rciu,
        imc: state.imc,
        clasificacionRiesgo: state.clasificacionRiesgo,
        fechaProbableParto: state.fechaProbableParto,
      );

  void setFum(String value) =>
      state = (
        antPp: state.antPp,
        observaciones: state.observaciones,
        tgCaptacion: state.tgCaptacion,
        fum: value,
        gestaciones: state.gestaciones,
        partos: state.partos,
        abortos: state.abortos,
        cesareas: state.cesareas,
        antPPretermino: state.antPPretermino,
        fechaCaptacion: state.fechaCaptacion,
        rciu: state.rciu,
        imc: state.imc,
        clasificacionRiesgo: state.clasificacionRiesgo,
        fechaProbableParto: state.fechaProbableParto,
      );

  void setObstetricos(
    String gestaciones,
    String partos,
    String abortos,
    String cesareas,
  ) =>
      state = (
        antPp: state.antPp,
        observaciones: state.observaciones,
        tgCaptacion: state.tgCaptacion,
        fum: state.fum,
        gestaciones: gestaciones,
        partos: partos,
        abortos: abortos,
        cesareas: cesareas,
        antPPretermino: state.antPPretermino,
        fechaCaptacion: state.fechaCaptacion,
        rciu: state.rciu,
        imc: state.imc,
        clasificacionRiesgo: state.clasificacionRiesgo,
        fechaProbableParto: state.fechaProbableParto,
      );

  void setAntPPretermino(String value) =>
      state = (
        antPp: state.antPp,
        observaciones: state.observaciones,
        tgCaptacion: state.tgCaptacion,
        fum: state.fum,
        gestaciones: state.gestaciones,
        partos: state.partos,
        abortos: state.abortos,
        cesareas: state.cesareas,
        antPPretermino: value,
        fechaCaptacion: state.fechaCaptacion,
        rciu: state.rciu,
        imc: state.imc,
        clasificacionRiesgo: state.clasificacionRiesgo,
        fechaProbableParto: state.fechaProbableParto,
      );

  void setFechaCaptacion(String value) =>
      state = (
        antPp: state.antPp,
        observaciones: state.observaciones,
        tgCaptacion: state.tgCaptacion,
        fum: state.fum,
        gestaciones: state.gestaciones,
        partos: state.partos,
        abortos: state.abortos,
        cesareas: state.cesareas,
        antPPretermino: state.antPPretermino,
        fechaCaptacion: value,
        rciu: state.rciu,
        imc: state.imc,
        clasificacionRiesgo: state.clasificacionRiesgo,
        fechaProbableParto: state.fechaProbableParto,
      );

  void setRciu(String value) =>
      state = (
        antPp: state.antPp,
        observaciones: state.observaciones,
        tgCaptacion: state.tgCaptacion,
        fum: state.fum,
        gestaciones: state.gestaciones,
        partos: state.partos,
        abortos: state.abortos,
        cesareas: state.cesareas,
        antPPretermino: state.antPPretermino,
        fechaCaptacion: state.fechaCaptacion,
        rciu: value,
        imc: state.imc,
        clasificacionRiesgo: state.clasificacionRiesgo,
        fechaProbableParto: state.fechaProbableParto,
      );

  void setImc(String value) =>
      state = (
        antPp: state.antPp,
        observaciones: state.observaciones,
        tgCaptacion: state.tgCaptacion,
        fum: state.fum,
        gestaciones: state.gestaciones,
        partos: state.partos,
        abortos: state.abortos,
        cesareas: state.cesareas,
        antPPretermino: state.antPPretermino,
        fechaCaptacion: state.fechaCaptacion,
        rciu: state.rciu,
        imc: value,
        clasificacionRiesgo: state.clasificacionRiesgo,
        fechaProbableParto: state.fechaProbableParto,
      );

  void setClasificacionRiesgo(int value) =>
      state = (
        antPp: state.antPp,
        observaciones: state.observaciones,
        tgCaptacion: state.tgCaptacion,
        fum: state.fum,
        gestaciones: state.gestaciones,
        partos: state.partos,
        abortos: state.abortos,
        cesareas: state.cesareas,
        antPPretermino: state.antPPretermino,
        fechaCaptacion: state.fechaCaptacion,
        rciu: state.rciu,
        imc: state.imc,
        clasificacionRiesgo: value,
        fechaProbableParto: state.fechaProbableParto,
      );

  void setFechaProbableParto(String value) =>
      state = (
        antPp: state.antPp,
        observaciones: state.observaciones,
        tgCaptacion: state.tgCaptacion,
        fum: state.fum,
        gestaciones: state.gestaciones,
        partos: state.partos,
        abortos: state.abortos,
        cesareas: state.cesareas,
        antPPretermino: state.antPPretermino,
        fechaCaptacion: state.fechaCaptacion,
        rciu: state.rciu,
        imc: state.imc,
        clasificacionRiesgo: state.clasificacionRiesgo,
        fechaProbableParto: value,
      );

  void clear() =>
      state = (
        antPp: '',
        observaciones: '',
        tgCaptacion: '',
        fum: '',
        gestaciones: '',
        partos: '',
        abortos: '',
        cesareas: '',
        antPPretermino: '',
        fechaCaptacion: '',
        rciu: '',
        imc: '',
        clasificacionRiesgo: 0,
        fechaProbableParto: '',
      );
}

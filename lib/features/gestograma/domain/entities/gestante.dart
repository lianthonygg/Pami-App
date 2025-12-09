import 'package:pami_app/features/common/data/local/app_database.dart';

class PersonaWithGestanteData {
  final PersonasEntity persona;
  final GestanteEntity gestante;
  final String tgActual;

  PersonaWithGestanteData({
    required this.persona,
    required this.gestante,
    required this.tgActual,
  });
}

class PersonaWithGestanteDetail {
  final PersonasEntity persona;
  final GestanteEntity gestante;
  final CdrEntity cdr;
  final CircunscripcionEntity circunscripcion;
  final String tgActual;

  PersonaWithGestanteDetail({
    required this.persona,
    required this.gestante,
    required this.cdr,
    required this.circunscripcion,
    required this.tgActual,
  });
}

class Gestante {
  final String id;
  final String nombre;
  final String ci;
  final String personaId;
  final String? direccionDelCi;
  final String? direccionEnQueVive;
  final String? telefono;
  final String antPP;
  final String observaciones;
  final String tgCaptacion;
  final String tgActual;
  final String tgFinal;
  final DateTime fum;
  final String gestaciones;
  final String partos;
  final String abortos;
  final String cesareas;
  final String antPPretermino;
  final DateTime fechaCaptacion;
  final DateTime fechaProbableParto;
  final String rciu;
  final String imc;
  final int clasificacionRiesgo;

  Gestante({
    required this.id,
    required this.nombre,
    required this.ci,
    required this.personaId,
    required this.direccionDelCi,
    required this.direccionEnQueVive,
    required this.telefono,
    required this.antPP,
    required this.observaciones,
    required this.tgCaptacion,
    required this.tgActual,
    required this.tgFinal,
    required this.fum,
    required this.gestaciones,
    required this.partos,
    required this.abortos,
    required this.cesareas,
    required this.antPPretermino,
    required this.fechaCaptacion,
    required this.fechaProbableParto,
    required this.rciu,
    required this.imc,
    required this.clasificacionRiesgo,
  });
}

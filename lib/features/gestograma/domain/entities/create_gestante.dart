class CreateGestantePost {
  final String id;
  final String personaId;
  final String esposoId;
  final String antPP;
  final String antPFam;
  final String observaciones;
  final String tgCaptacion;
  final String tgFinal;
  final String fum;
  final String gestaciones;
  final String partos;
  final String abortos;
  final String cesareas;
  final String antPPretermino;
  final String fechaCaptacion;
  final String rciu;
  final String imc;
  final String fechaProbableParto;
  final int clasificacionRiesgo;

  CreateGestantePost({
    required this.id,
    required this.personaId,
    required this.esposoId,
    required this.antPP,
    required this.antPFam,
    required this.observaciones,
    required this.tgCaptacion,
    required this.tgFinal,
    required this.fum,
    required this.gestaciones,
    required this.partos,
    required this.abortos,
    required this.cesareas,
    required this.antPPretermino,
    required this.fechaCaptacion,
    required this.rciu,
    required this.imc,
    required this.fechaProbableParto,
    required this.clasificacionRiesgo,
  });
}

import 'package:pami_app/features/gestograma/domain/entities/create_gestante.dart';

class CreateGestanteRequest extends CreateGestantePost {
  CreateGestanteRequest({
    required super.id,
    required super.personaId,
    required super.esposoId,
    required super.antPP,
    required super.antPFam,
    required super.observaciones,
    required super.tgCaptacion,
    required super.tgFinal,
    required super.fum,
    required super.gestaciones,
    required super.partos,
    required super.abortos,
    required super.cesareas,
    required super.antPPretermino,
    required super.fechaCaptacion,
    required super.rciu,
    required super.imc,
    required super.fechaProbableParto,
    required super.clasificacionRiesgo,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id.trim(),
      "personaId": personaId.trim(),
      "esposoId": esposoId.trim(),
      "antPp": antPP.trim(),
      "antPFamiliares": antPFam.trim(),
      "observaciones": observaciones.trim(),
      "tgCaptacion": tgCaptacion.trim(),
      "tgFinal": tgFinal.trim(),
      "fum": fum.trim(),
      "gestaciones": gestaciones.trim(),
      "partos": partos.trim(),
      "abortos": abortos.trim(),
      "cesareas": cesareas.trim(),
      "antPPretermino": antPPretermino.trim(),
      "fechaCaptacion": fechaCaptacion.trim(),
      "rciu": rciu.trim(),
      "imc": imc.trim(),
      "fechaProbableParto": fechaProbableParto.trim(),
      "clasificacionRiesgo": clasificacionRiesgo,
    };
  }
}

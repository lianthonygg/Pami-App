import 'package:pami_app/features/posgestograma/domain/entities/puerpera.dart';

class PuerperasResponseModel extends Puerpera {
  PuerperasResponseModel({
    required super.id,
    required super.nombre,
    required super.ci,
    required super.personaId,
    required super.direccionDelCi,
    required super.direccionEnQueVive,
    required super.telefono,
    required super.antPP,
    required super.observaciones,
    required super.gestaciones,
    required super.partos,
    required super.abortos,
    required super.cesareas,
    required super.antPPretermino,
    required super.tipoParto,
  });

  factory PuerperasResponseModel.fromEntity(PersonaWithPuerperaData data) =>
      PuerperasResponseModel(
        id: data.puerpera.id,
        nombre: data.persona.fullName,
        ci: data.persona.ci,
        personaId: data.puerpera.personaId,
        direccionDelCi: data.persona.direccionCi,
        direccionEnQueVive: data.persona.direccionVive,
        telefono: data.persona.telefono,
        antPP: data.puerpera.antPp,
        observaciones: data.puerpera.observaciones,
        gestaciones: data.puerpera.gestaciones,
        partos: data.puerpera.partos,
        abortos: data.puerpera.abortos,
        cesareas: data.puerpera.cesareas,
        antPPretermino: data.puerpera.antPPretermino,
        tipoParto: data.puerpera.tipoParto,
      );
}

import 'package:pami_app/features/common/domain/entities/persona.dart';

class ResponseCreatePersonaModel extends CreatePersonaResponse {
  ResponseCreatePersonaModel({
    required super.id,
    required super.fullName,
    required super.ci,
  });

  factory ResponseCreatePersonaModel.fromJson(Map<String, dynamic> json) =>
      ResponseCreatePersonaModel(
        id: json['id'],
        fullName: json['nombre'],
        ci: json['ci'],
      );
}

class CreatePersonaRequest extends CreatePersonaPost {
  CreatePersonaRequest({
    required super.fullName,
    required super.ci,
    required super.sexo,
    required super.raza,
    required super.direccionDelCI,
    required super.direccionEnQueVive,
    required super.telefono,
    required super.antPP,
    required super.nivelEscolar,
    required super.profesion,
    required super.grupoDispensarial,
    required super.observaciones,
    required super.cdrId,
    required super.isController,
  });

  Map<String, dynamic> toJson() {
    return {
      "fullName": fullName.trim(),
      "ci": ci.trim(),
      "sexo": sexo,
      "raza": raza,
      "direccionDelCi": direccionDelCI.trim(),
      "direccionEnQVive": direccionEnQueVive.trim(),
      "telefono": telefono.trim(),
      "antPp": antPP.trim(),
      "nivelEscolar": nivelEscolar,
      "profesion": profesion.trim(),
      "grupoDispensarial": grupoDispensarial,
      "observaciones": observaciones.trim(),
      "cdr": cdrId,
      "isController": isController,
    };
  }
}

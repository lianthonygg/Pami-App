import 'package:pami_app/features/personas/domain/entities/persona.dart';

class PersonaModel extends Persona {
  PersonaModel({
    required super.id,
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
    required super.circunscripcion,
    required super.cdr,
  });

  factory PersonaModel.fromJson(Map<String, dynamic> json) => PersonaModel(
    id: json['id'],
    fullName: json['fullName'],
    ci: json['ci'],
    sexo: json['sexo'],
    raza: json['raza'],
    direccionDelCI: json['direccionDelCi'],
    direccionEnQueVive: json['direccionEnQVive'],
    telefono: json['telefono'],
    antPP: json['antPp'],
    nivelEscolar: json['nivelEscolar'],
    profesion: json['profesion'],
    grupoDispensarial: json['grupoDispensarial'],
    observaciones: json['observaciones'],
    circunscripcion: CircunscripcionModelResponse.fromJson(
      json["circunscripcion"] ?? {},
    ),
    cdr: CdrModel.fromJson(json['cdr'] ?? {}),
  );
}

class CircunscripcionModelResponse extends CircunscripcionResponse {
  CircunscripcionModelResponse({required super.id, required super.numero});

  factory CircunscripcionModelResponse.fromJson(Map<String, dynamic> json) {
    return CircunscripcionModelResponse(
      id: json['id'] ?? '',
      numero: json['numero']?.toString() ?? '',
    );
  }
}

class CdrModel extends CDR {
  CdrModel({required super.id, required super.numero});

  factory CdrModel.fromJson(Map<String, dynamic> json) {
    return CdrModel(
      id: json['id'] ?? '',
      numero: json['numero']?.toString() ?? '',
    );
  }
}

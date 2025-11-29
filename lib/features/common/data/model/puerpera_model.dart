import 'package:pami_app/features/common/domain/entities/puerpera.dart';

class PuerperaModel extends Puerpera {
  PuerperaModel({
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
    required super.lastModified,
  });

  factory PuerperaModel.fromJson(Map<String, dynamic> json) => PuerperaModel(
    id: json['id'],
    nombre: json['nombre'],
    ci: json['ci'],
    personaId: json['personaId'],
    direccionDelCi: json['direccionDelCi'],
    direccionEnQueVive: json['direccionEnQVive'],
    telefono: json['telefono'],
    antPP: json['antPp'],
    observaciones: json['observaciones'],
    gestaciones: json["gestaciones"],
    partos: json['partos'],
    abortos: json["abortos"],
    cesareas: json['cesareas'],
    antPPretermino: json["antPPretermino"],
    tipoParto: json['tipoParto'],
    lastModified: DateTime.parse(json['lastModified']),
  );
}

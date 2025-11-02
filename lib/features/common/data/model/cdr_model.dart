import 'package:pami_app/features/common/domain/entities/cdr.dart';

class CdrModel extends Cdr {
  CdrModel({
    required super.id,
    required super.numero,
    required super.presidente,
    required super.circunscripcion,
    required super.lastModified,
  });

  factory CdrModel.fromJson(Map<String, dynamic> json) => CdrModel(
    id: json["id"],
    numero: json["numero"],
    presidente: json["presidente"],
    circunscripcion: json["circunscripcionId"],
    lastModified: DateTime.parse(json['lastModified']),
  );
}

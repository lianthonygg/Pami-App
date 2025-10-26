import 'package:pami_app/features/common/domain/entities/circunscripcion.dart';

class CircunscripcionModel extends Circunscripcion {
  CircunscripcionModel({required super.id, required super.numero});

  factory CircunscripcionModel.fromJson(Map<String, dynamic> json) =>
      CircunscripcionModel(id: json["id"], numero: json["numero"]);
}

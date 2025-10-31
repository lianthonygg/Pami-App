import 'package:pami_app/features/common/domain/entities/circunscripcion.dart';

class CircunscripcionModel extends Circunscripcion {
  CircunscripcionModel({required super.id, required super.numero, required super.delegado, required super.zona, required super.consejoPopular, required super.lastModified});

  factory CircunscripcionModel.fromJson(Map<String, dynamic> json) =>
      CircunscripcionModel(id: json["id"], numero: json["numero"], delegado: json["delegado"], zona: json["zona"], consejoPopular: json["consejoPopular"], lastModified: DateTime.parse(json['lastModified']));
}

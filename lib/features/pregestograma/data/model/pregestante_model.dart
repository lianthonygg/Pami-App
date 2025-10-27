import 'package:pami_app/features/pregestograma/domain/entities/pregestante.dart';

class PregestanteModel extends Pregestante {
  PregestanteModel({
    required super.nombre,
    required super.ci,
    required super.telefono,
    required super.grupoRiesgo,
    required super.isController,
  });

  factory PregestanteModel.fromJson(Map<String, dynamic> json) =>
      PregestanteModel(
        nombre: json["nombre"],
        ci: json["ci"],
        telefono: json["telefono"],
        grupoRiesgo: json["grupoRiesgo"],
        isController: json["isController"],
      );
}

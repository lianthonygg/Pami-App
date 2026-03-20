import 'package:pami_app/features/common/data/local/app_database.dart';
import 'package:pami_app/features/pregestograma/domain/entities/pregestante.dart';

class PregestanteModel extends Pregestante {
  PregestanteModel({
    required super.nombre,
    required super.ci,
    required super.telefono,
    required super.grupoRiesgo,
    required super.isController,
  });

  factory PregestanteModel.fromEntity(PersonasEntity entity) =>
      PregestanteModel(
        nombre: entity.fullName,
        ci: entity.ci,
        telefono: entity.telefono,
        grupoRiesgo: entity.grupoDispensarial,
        isController: entity.isController,
      );
}

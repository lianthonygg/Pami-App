import 'package:pami_app/features/common/data/local/app_database.dart';

class Puerpera {
  final String id;
  final String nombre;
  final String ci;
  final String personaId;
  final String? direccionDelCi;
  final String? direccionEnQueVive;
  final String? telefono;
  final String antPP;
  final String observaciones;
  final String gestaciones;
  final String partos;
  final String abortos;
  final String cesareas;
  final String antPPretermino;
  final int tipoParto;

  Puerpera({
    required this.id,
    required this.nombre,
    required this.ci,
    required this.personaId,
    required this.direccionDelCi,
    required this.direccionEnQueVive,
    required this.telefono,
    required this.antPP,
    required this.observaciones,
    required this.gestaciones,
    required this.partos,
    required this.abortos,
    required this.cesareas,
    required this.antPPretermino,
    required this.tipoParto,
  });
}

class PersonaWithPuerperaData {
  final PersonasEntity persona;
  final PuerperaEntity puerpera;

  PersonaWithPuerperaData({required this.persona, required this.puerpera});
}

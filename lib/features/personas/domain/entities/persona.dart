class Persona {
  final String id;
  final String fullName;
  final String ci;
  final String sexo;
  final String raza;
  final String direccionDelCI;
  final String direccionEnQueVive;
  final String telefono;
  final String antPP;
  final String nivelEscolar;
  final String profesion;
  final String grupoDispensarial;
  final String observaciones;
  final CircunscripcionResponse circunscripcion;
  final CDR cdr;

  Persona({
    required this.id,
    required this.fullName,
    required this.ci,
    required this.sexo,
    required this.raza,
    required this.direccionDelCI,
    required this.direccionEnQueVive,
    required this.telefono,
    required this.antPP,
    required this.nivelEscolar,
    required this.profesion,
    required this.grupoDispensarial,
    required this.observaciones,
    required this.circunscripcion,
    required this.cdr,
  });
}

class CreatePersonaPost {
  final String fullName;
  final String ci;
  final String sexo;
  final String raza;
  final String direccionDelCI;
  final String direccionEnQueVive;
  final String telefono;
  final String antPP;
  final String nivelEscolar;
  final String profesion;
  final String grupoDispensarial;
  final String observaciones;
  final String cdrId;

  CreatePersonaPost({
    required this.fullName,
    required this.ci,
    required this.sexo,
    required this.raza,
    required this.direccionDelCI,
    required this.direccionEnQueVive,
    required this.telefono,
    required this.antPP,
    required this.nivelEscolar,
    required this.profesion,
    required this.grupoDispensarial,
    required this.observaciones,
    required this.cdrId,
  });
}

class CreatePersonaResponse {
  final String id;
  final String fullName;
  final String ci;

  CreatePersonaResponse({
    required this.id,
    required this.fullName,
    required this.ci,
  });
}

class CircunscripcionResponse {
  final String id;
  final String numero;

  CircunscripcionResponse({required this.id, required this.numero});
}

class CDR {
  final String id;
  final String numero;

  CDR({required this.id, required this.numero});
}

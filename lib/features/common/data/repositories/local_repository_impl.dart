import 'package:drift/drift.dart';
import 'package:pami_app/features/common/data/local/app_database.dart';
import 'package:pami_app/features/common/data/model/persona_model.dart';
import 'package:pami_app/features/common/domain/entities/cdr.dart';
import 'package:pami_app/features/common/domain/entities/circunscripcion.dart';
import 'package:pami_app/features/common/domain/entities/gestante.dart';
import 'package:pami_app/features/common/domain/entities/persona.dart';
import 'package:pami_app/features/common/domain/entities/puerpera.dart';
import 'package:pami_app/features/common/domain/repositories/local_repository.dart';
import 'package:pami_app/features/personas/data/model/create_persona_model.dart';

class LocalRepositoryImpl implements LocalRepository {
  final AppDatabase db;

  LocalRepositoryImpl(this.db);

  @override
  Future<void> insertOrUpdateCircunscripcion(
    List<Circunscripcion> circunscripciones,
  ) async {
    await db.batch((batch) {
      for (final circ in circunscripciones) {
        batch.insert(
          db.circunscripcionTable,
          CircunscripcionTableCompanion(
            id: Value(circ.id),
            numero: Value(circ.numero),
            delegado: Value(circ.delegado),
            zona: Value(circ.zona),
            consejoPopular: Value(circ.consejoPopular),
            isAvailable: Value(true),
          ),
          mode: InsertMode.insertOrReplace,
        );
      }
    });
  }

  @override
  Stream<List<CircunscripcionEntity>> watchAllCircunscripciones() {
    return db.select(db.circunscripcionTable).watch();
  }

  @override
  Future<void> insertOrUpdateCDR(List<Cdr> cdrs) async {
    await db.batch((batch) {
      for (final cdr in cdrs) {
        batch.insert(
          db.cdrTable,
          CdrTableCompanion(
            id: Value(cdr.id),
            numero: Value(cdr.numero),
            presidente: Value(cdr.presidente),
            circunscripcionId: Value(cdr.circunscripcion),
            isAvailable: Value(true),
          ),
          mode: InsertMode.insertOrReplace,
        );
      }
    });
  }

  @override
  Stream<List<CdrEntity>> watchCdrsByCircunscripcion(String circunscripcionId) {
    return (db.select(
      db.cdrTable,
    )..where((cdr) => cdr.circunscripcionId.equals(circunscripcionId))).watch();
  }

  @override
  Future<void> insertOrUpdatePersonas(List<Persona> personas) async {
    await db.batch((batch) {
      for (final persona in personas) {
        batch.insert(
          db.personasTable,
          PersonasTableCompanion(
            id: Value(persona.id),
            fullName: Value(persona.fullName),
            ci: Value(persona.ci),
            sexo: Value(persona.sexo),
            raza: Value(persona.raza),
            direccionCi: Value(persona.direccionDelCI),
            direccionVive: Value(persona.direccionEnQueVive),
            telefono: Value(persona.telefono),
            antPP: Value(persona.antPP),
            nivelEscolar: Value(persona.nivelEscolar),
            profesion: Value(persona.profesion),
            grupoDispensarial: Value(persona.grupoDispensarial),
            observaciones: Value(persona.observaciones),
            cdrId: Value(persona.cdr.id),
            isAvailable: Value(persona.isAvailable),
            isGestante: Value(persona.isGestante),
          ),
          mode: InsertMode.insertOrReplace,
        );
      }
    });
  }

  @override
  Stream<List<PersonasEntity>> watchPacientes() {
    return (db.select(db.personasTable)..where((p) => p.isAvailable)).watch();
  }

  @override
  Future<PersonaConCdrYCircunscripcion?> getPacienteByCi(String ci) async {
    final query = db.select(db.personasTable).join([
      innerJoin(db.cdrTable, db.cdrTable.id.equalsExp(db.personasTable.cdrId)),
      innerJoin(
        db.circunscripcionTable,
        db.circunscripcionTable.id.equalsExp(db.cdrTable.circunscripcionId),
      ),
    ])..where(db.personasTable.ci.equals(ci.trim()));

    final row = await query.getSingleOrNull();

    if (row == null) return null;

    return PersonaConCdrYCircunscripcion(
      persona: row.readTable(db.personasTable),
      cdr: row.readTable(db.cdrTable),
      circunscripcion: row.readTable(db.circunscripcionTable),
    );
  }

  @override
  Future<void> insertOrUpdateGestantes(List<Gestante> gestantes) async {
    await db.batch((batch) {
      for (final gestante in gestantes) {
        batch.insert(
          db.gestanteTable,
          GestanteTableCompanion(
            id: Value(gestante.id),
            antPp: Value(gestante.antPP),
            observaciones: Value(gestante.observaciones),
            tgCaptacion: Value(gestante.tgCaptacion),
            tgFinal: Value(gestante.tgFinal),
            fum: Value(gestante.fum),
            gestaciones: Value(gestante.gestaciones),
            partos: Value(gestante.partos),
            abortos: Value(gestante.abortos),
            cesareas: Value(gestante.cesareas),
            antPPretermino: Value(gestante.antPPretermino),
            fechaCaptacion: Value(gestante.fechaCaptacion),
            fechaProbableParto: Value(gestante.fechaProbableParto),
            rciu: Value(gestante.rciu),
            imc: Value(gestante.imc),
            clasificacionRiesgo: Value(gestante.clasificacionRiesgo),
            personaId: Value(gestante.personaId),
            isAvailable: Value(gestante.isAvailable),
          ),
          mode: InsertMode.insertOrReplace,
        );
      }
    });
  }

  @override
  Future<void> insertOrUpdatePuerperas(List<Puerpera> puerperas) async {
    await db.batch((batch) {
      for (final puerpera in puerperas) {
        batch.insert(
          db.puerperaTable,
          PuerperaTableCompanion(
            id: Value(puerpera.id),
            antPp: Value(puerpera.antPP),
            observaciones: Value(puerpera.observaciones),
            gestaciones: Value(puerpera.gestaciones),
            partos: Value(puerpera.partos),
            abortos: Value(puerpera.abortos),
            cesareas: Value(puerpera.cesareas),
            antPPretermino: Value(puerpera.antPPretermino),
            tipoParto: Value(puerpera.tipoParto),
            personaId: Value(puerpera.personaId),
            isAvailable: Value(puerpera.isAvailable),
          ),
          mode: InsertMode.insertOrReplace,
        );
      }
    });
  }

  @override
  Future<void> createPerson(CreatePersonaRequest request) async {
    await db
        .into(db.personasTable)
        .insert(
          PersonasTableCompanion(
            id: Value(request.id),
            fullName: Value(request.fullName),
            ci: Value(request.ci),
            sexo: Value(request.sexo),
            raza: Value(request.raza),
            direccionCi: Value(request.direccionDelCI),
            direccionVive: Value(request.direccionEnQueVive),
            telefono: Value(request.telefono),
            antPP: Value(request.antPP),
            nivelEscolar: Value(request.nivelEscolar),
            profesion: Value(request.profesion),
            grupoDispensarial: Value(request.grupoDispensarial),
            observaciones: Value(request.observaciones),
            cdrId: Value(request.cdrId),
            isAvailable: Value(true),
            isGestante: Value(request.isController),
          ),
        );
  }
}

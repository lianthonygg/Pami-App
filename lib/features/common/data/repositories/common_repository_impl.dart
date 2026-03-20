import 'package:pami_app/features/common/data/datasources/common_remote_datasource.dart';
import 'package:pami_app/features/common/data/model/cdr_model.dart';
import 'package:pami_app/features/common/data/model/circunscripcion_model.dart';
import 'package:pami_app/features/common/data/model/gestantes_model.dart';
import 'package:pami_app/features/common/data/model/persona_model.dart';
import 'package:pami_app/features/common/data/model/puerpera_model.dart';
import 'package:pami_app/features/common/domain/entities/cdr.dart';
import 'package:pami_app/features/common/domain/entities/circunscripcion.dart';
import 'package:pami_app/features/common/domain/entities/gestante.dart';
import 'package:pami_app/features/common/domain/entities/persona.dart';
import 'package:pami_app/features/common/domain/entities/puerpera.dart';
import 'package:pami_app/features/common/domain/repositories/common_repository.dart';

class CommonRepositoryImpl implements CommonRepository {
  final CommonRemoteDatasource remoteDatasource;

  CommonRepositoryImpl(this.remoteDatasource);

  @override
  Future<List<Circunscripcion>> getCircunscripciones(
    DateTime? lastModified,
  ) async {
    try {
      final List<CircunscripcionModel> circunscripciones =
          await remoteDatasource.getCircunscripciones(lastModified);
      return circunscripciones;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Cdr>> getCdrs(DateTime? lastModified) async {
    try {
      final List<CdrModel> cdrs = await remoteDatasource.getCdrs(lastModified);
      return cdrs;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Persona> getByCI(String ci) async {
    try {
      final PersonaModel persona = await remoteDatasource.getByCI(ci);
      return persona;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Persona>> getPacientes(DateTime? lastModified) async {
    try {
      final List<PersonaModel> personas = await remoteDatasource.getPacientes(
        lastModified,
      );
      return personas;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Gestante>> getGestantes(DateTime? lastModified) async {
    try {
      final List<GestantesModel> personas = await remoteDatasource.getGestantes(
        lastModified,
      );
      return personas;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Puerpera>> getPuerperas(DateTime? lastModified) async {
    try {
      final List<PuerperaModel> personas = await remoteDatasource.getPuerperas(
        lastModified,
      );
      return personas;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Persona> getTryGestanteByCI(String ci) async {
    try {
      final PersonaModel persona = await remoteDatasource.getTryGestanteByCI(
        ci,
      );
      return persona;
    } catch (e) {
      rethrow;
    }
  }
}

import 'package:pami_app/features/common/data/datasources/common_remote_datasource.dart';
import 'package:pami_app/features/common/data/model/cdr_model.dart';
import 'package:pami_app/features/common/data/model/circunscripcion_model.dart';
import 'package:pami_app/features/common/data/model/persona_model.dart';
import 'package:pami_app/features/common/domain/entities/cdr.dart';
import 'package:pami_app/features/common/domain/entities/circunscripcion.dart';
import 'package:pami_app/features/common/domain/entities/persona.dart';
import 'package:pami_app/features/common/domain/repositories/common_repository.dart';

class CommonRepositoryImpl implements CommonRepository {
  final CommonRemoteDatasource remoteDatasource;

  CommonRepositoryImpl(this.remoteDatasource);

  @override
  Future<List<Circunscripcion>> getCircunscripciones() async {
    try {
      final List<CircunscripcionModel> circunscripciones =
          await remoteDatasource.getCircunscripciones();
      return circunscripciones;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Cdr>> getCdrs(String circunscripcion) async {
    try {
      final List<CdrModel> cdrs = await remoteDatasource.getCdrs(
        circunscripcion,
      );
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
}

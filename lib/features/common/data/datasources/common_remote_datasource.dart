import 'package:dio/dio.dart';
import 'package:pami_app/core/error/server_exception.dart';
import 'package:pami_app/features/common/data/model/cdr_model.dart';
import 'package:pami_app/features/common/data/model/circunscripcion_model.dart';
import 'package:pami_app/features/common/data/model/persona_model.dart';

class CommonRemoteDatasource {
  final Dio dio;

  CommonRemoteDatasource(this.dio);

  Future<PersonaModel> getByCI(String ci) async {
    try {
      final response = await dio.get('/persona/$ci');

      return PersonaModel.fromJson(response.data);
    } on DioException catch (e) {
      throw e.error as ServerException;
    }
  }

  Future<List<PersonaModel>> getPacientes(DateTime? lastModified) async {
    try {
      final queryParams = <String, dynamic>{};
      if (lastModified != null) {
        queryParams["lastModified"] = lastModified.toIso8601String();
      }
      final response = await dio.get(
        "/persona/mobile/get-by-consultorio",
        queryParameters: queryParams,
      );

      return (response.data as List)
          .map((item) => PersonaModel.fromJson(item))
          .toList();
    } on DioException catch (e) {
      throw e.error as ServerException;
    }
  }

  Future<List<CircunscripcionModel>> getCircunscripciones(
    DateTime? lastSync,
  ) async {
    try {
      final queryParams = <String, dynamic>{};
      if (lastSync != null) {
        queryParams["lastModified"] = lastSync.toIso8601String();
      }
      final response = await dio.get(
        "/circunscripcion/mobile/get-circunscripciones",
        queryParameters: queryParams,
      );

      return (response.data as List)
          .map((item) => CircunscripcionModel.fromJson(item))
          .toList();
    } on DioException catch (e) {
      throw e.error as ServerException;
    }
  }

  Future<List<CdrModel>> getCdrs(DateTime? lastModified) async {
    try {
      final queryParams = <String, dynamic>{};
      if (lastModified != null) {
        queryParams["lastModified"] = lastModified.toIso8601String();
      }

      final response = await dio.get(
        "/cdr/mobile/get-by-consultorio",
        queryParameters: queryParams,
      );

      return (response.data as List)
          .map((item) => CdrModel.fromJson(item))
          .toList();
    } on DioException catch (e) {
      throw e.error as ServerException;
    }
  }
}

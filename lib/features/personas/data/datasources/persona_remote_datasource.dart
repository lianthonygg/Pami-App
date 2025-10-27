import 'package:dio/dio.dart';
import 'package:pami_app/core/error/server_exception.dart';
import 'package:pami_app/features/personas/data/model/create_persona_model.dart';
import 'package:pami_app/features/common/data/model/persona_model.dart';

class PersonaRemoteDatasource {
  final Dio dio;

  PersonaRemoteDatasource(this.dio);

  Future<List<PersonaModel>> getPacientes() async {
    try {
      final response = await dio.get("/persona/mobile/get-by-consultorio");

      return (response.data as List)
          .map((item) => PersonaModel.fromJson(item))
          .toList();
    } on DioException catch (e) {
      throw e.error as ServerException;
    }
  }

  Future<ResponseCreatePersonaModel> createPerson(
    CreatePersonaRequest persona,
  ) async {
    try {
      final response = await dio.post(
        '/persona',
        data: persona.toJson(),
        options: Options(headers: {'X-Mobile-App': true}),
      );

      return ResponseCreatePersonaModel.fromJson(response.data);
    } on DioException catch (e) {
      throw e.error as ServerException;
    }
  }
}

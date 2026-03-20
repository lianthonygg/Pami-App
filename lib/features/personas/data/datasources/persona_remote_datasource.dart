import 'package:dio/dio.dart';
import 'package:pami_app/core/error/server_exception.dart';
import 'package:pami_app/features/personas/data/model/create_persona_model.dart';

class PersonaRemoteDatasource {
  final Dio dio;

  PersonaRemoteDatasource(this.dio);

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

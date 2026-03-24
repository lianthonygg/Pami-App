import 'package:dio/dio.dart';
import 'package:pami_app/core/error/server_exception.dart';
import 'package:pami_app/features/gestograma/data/model/create_gestante_model.dart';
import 'package:pami_app/features/personas/data/model/create_persona_model.dart';

class GestantesRemoteDataSource {
  final Dio dio;

  GestantesRemoteDataSource(this.dio);

  Future<ResponseCreatePersonaModel> createGestante(
    CreateGestanteRequest persona,
  ) async {
    try {
      final response = await dio.post(
        '/gestantes',
        data: persona.toJson(),
        options: Options(headers: {'X-Mobile-App': true}),
      );

      return ResponseCreatePersonaModel.fromJson(response.data);
    } on DioException catch (e) {
      throw e.error as ServerException;
    }
  }
}

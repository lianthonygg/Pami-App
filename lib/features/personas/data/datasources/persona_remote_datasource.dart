import 'package:dio/dio.dart';
import 'package:pami_app/core/error/server_exception.dart';
import 'package:pami_app/features/personas/data/model/persona_model.dart';

class PersonaRemoteDatasource {
  final Dio dio;

  PersonaRemoteDatasource(this.dio);

  Future<PersonaModel> getByCI(String ci) async {
    try {
      final response = await dio.get(
        '/persona/$ci',
        options: Options(headers: {'X-Mobile-App': true}),
      );

      return PersonaModel.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response != null && e.response?.data is Map<String, dynamic>) {
        final data = e.response!.data as Map<String, dynamic>;
        final title = data['title'] ?? 'Error';
        final detail = data['detail'] ?? 'Ocurrió un error inesperado';
        final status = data['status'] ?? e.response!.statusCode;
        final code = data['errorCode'] ?? '';

        throw ServerException(
          title: title.toString(),
          detail: detail.toString(),
          status: status is int ? status : int.tryParse(status.toString()) ?? 0,
          errorCode: code.toString(),
        );
      }

      throw ServerException(
        title: 'Error de red',
        detail: e.message ?? 'Error desconocido en la conexión',
        status: e.response?.statusCode ?? 0,
        errorCode: 'Network.Error',
      );
    } catch (e) {
      throw ServerException(
        title: 'Excepción',
        detail: e.toString(),
        status: 500,
        errorCode: 'App.Error',
      );
    }
  }
}

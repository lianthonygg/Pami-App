import 'package:dio/dio.dart';
import 'package:pami_app/core/error/server_exception.dart';
import 'package:pami_app/features/pregestograma/data/model/pregestante_model.dart';

class PregestanteRemoteDatasource {
  final Dio dio;

  PregestanteRemoteDatasource(this.dio);

  Future<List<PregestanteModel>> getPregestantes() async {
    try {
      final response = await dio.get("/pregestante/get-by-consultorio");
      return (response.data as List)
          .map((item) => PregestanteModel.fromJson(item))
          .toList();
    } on DioException catch (e) {
      throw e.error as ServerException;
    }
  }
}

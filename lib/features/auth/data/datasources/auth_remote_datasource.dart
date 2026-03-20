import 'package:dio/dio.dart';
import 'package:pami_app/core/error/server_exception.dart';
import 'package:pami_app/features/auth/data/model/user_model.dart';

class AuthRemoteDatasource {
  final Dio dio;

  AuthRemoteDatasource(this.dio);

  Future<UserModel> login(String nickname, String password) async {
    try {
      final response = await dio.post(
        '/auth/login',
        data: {'username': nickname, 'password': password},
        options: Options(headers: {'X-Mobile-App': true}),
      );

      return UserModel.fromJson(response.data);
    } on DioException catch (e) {
      throw e.error as ServerException;
    }
  }
}

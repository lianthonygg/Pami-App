import 'package:pami_app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:pami_app/features/auth/data/model/user_model.dart';
import 'package:pami_app/features/auth/domain/entities/user.dart';
import 'package:pami_app/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource remoteDatasource;

  AuthRepositoryImpl(this.remoteDatasource);

  @override
  Future<User> login(String nickname, String password) async {
    try {
      final UserModel user = await remoteDatasource.login(nickname, password);
      return user;
    } catch (e) {
      rethrow;
    }
  }
}

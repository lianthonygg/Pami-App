import 'package:pami_app/features/auth/domain/entities/user.dart';
import 'package:pami_app/features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<User> call(String nickname, String password) {
    return repository.login(nickname, password);
  }
}

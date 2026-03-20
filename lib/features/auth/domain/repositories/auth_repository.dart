import 'package:pami_app/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<User> login(String nickname, String password);
}

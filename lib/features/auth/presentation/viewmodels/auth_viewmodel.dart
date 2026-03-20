import 'package:pami_app/core/error/server_exception.dart';
import 'package:pami_app/features/auth/domain/entities/user.dart';
import 'package:pami_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:pami_app/features/auth/presentation/providers/usecase_provider.dart';
import 'package:pami_app/features/auth/presentation/viewmodels/auth_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_viewmodel.g.dart';

@riverpod
class AuthViewModel extends _$AuthViewModel {
  late final LoginUseCase loginUseCase;

  @override
  AuthState build() {
    loginUseCase = ref.read(loginUseCaseProvider);
    return AuthState();
  }

  Future<void> login(String nickname, String password) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final result = await loginUseCase(nickname, password);

      final token = result.accessToken;

      await ref.read(authProvider.notifier).login(token);

      state = state.copyWith(isLoading: false, user: result);
    } on ServerException catch (e) {
      state = state.copyWith(isLoading: false, error: e.detail);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  void logout() {
    ref.read(authProvider.notifier).logout();
    state = AuthState();
  }
}

class AuthState {
  final bool isLoading;
  final User? user;
  final String? error;

  AuthState({this.isLoading = false, this.user, this.error});

  AuthState copyWith({bool? isLoading, User? user, String? error}) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      user: user ?? this.user,
      error: error,
    );
  }
}

@Riverpod(keepAlive: true)
class LoginForm extends _$LoginForm {
  @override
  ({String nickname, String password}) build() => (nickname: '', password: '');

  void setNickname(String value) =>
      state = (nickname: value, password: state.password);

  void setPassword(String value) =>
      state = (nickname: state.nickname, password: value);

  // opcional: limpiar el formulario
  void clear() => state = (nickname: '', password: '');
}

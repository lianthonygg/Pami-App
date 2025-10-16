import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pami_app/core/error/server_exception.dart';
import 'package:pami_app/features/auth/domain/entities/user.dart';
import 'package:pami_app/features/auth/domain/usecases/login_usecase.dart';

class AuthViewModel extends StateNotifier<AuthState> {
  final LoginUseCase loginUseCase;

  AuthViewModel(this.loginUseCase) : super(AuthState());

  Future<void> login(String nickname, String password) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final user = await loginUseCase(nickname, password);
      state = state.copyWith(isLoading: false, user: user);
    } on ServerException catch (e) {
      state = state.copyWith(isLoading: false, error: e.detail);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  void logout() {
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

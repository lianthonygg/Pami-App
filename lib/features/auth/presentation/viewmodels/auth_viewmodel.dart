import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pami_app/core/error/server_exception.dart';
import 'package:pami_app/features/auth/domain/entities/user.dart';
import 'package:pami_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:pami_app/features/auth/presentation/viewmodels/auth_notifier.dart';

class AuthViewModel extends StateNotifier<AuthState> {
  final LoginUseCase loginUseCase;
  final Ref ref;

  AuthViewModel(this.loginUseCase, this.ref) : super(AuthState());

  Future<void> login(String nickname, String password) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final result = await loginUseCase(nickname, password);

      final token = result.accessToken;

      await ref.read(authNotifierProvider.notifier).login(token);

      state = state.copyWith(isLoading: false, user: result);
    } on ServerException catch (e) {
      state = state.copyWith(isLoading: false, error: e.detail);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  void logout() {
    ref.read(authNotifierProvider.notifier).logout();
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

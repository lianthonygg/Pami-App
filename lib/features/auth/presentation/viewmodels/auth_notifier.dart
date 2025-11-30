import 'package:pami_app/core/services/auth_service.dart';
import 'package:pami_app/features/auth/domain/entities/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_notifier.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  Future<AuthNotifierState> build() async {
    final loggedIn = await AuthService.isLoggedIn();
    if (loggedIn) {
      final token = await AuthService.getAccessToken();
      return AuthNotifierState(accessToken: token, isLoading: false);
    } else {
      return const AuthNotifierState(accessToken: null, isLoading: false);
    }
  }

  Future<void> login(String accessToken, {String? refreshToken}) async {
    await AuthService.saveTokens(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
    if (!ref.mounted) return;
    state = AsyncData(state.value!.copyWith(accessToken: accessToken));
  }

  Future<void> logout() async {
    await AuthService.logout();

    if (!ref.mounted) return;

    state = const AsyncData(
      AuthNotifierState(accessToken: null, isLoading: false),
    );

    // 4. Opcional pero recomendado:
    //    Si querés reinicializar por completo:
    // ref.invalidateSelf();
  }

  Future<void> refreshAccessToken() async {
    final refreshToken = await AuthService.getRefreshToken();
    if (refreshToken == null) {
      await logout();
      return;
    }

    // Aquí pondrás la llamada al backend cuando implementes el refresh endpoint
    // final newToken = await api.refreshToken(refreshToken);
    // await AuthService.saveTokens(accessToken: newToken, refreshToken: refreshToken);
    // state = state.copyWith(accessToken: newToken);
  }
}

class AuthNotifierState {
  final String? accessToken;
  final User? user;
  final bool isLoading;

  bool get isLoggedIn => accessToken != null;

  const AuthNotifierState({
    this.accessToken,
    this.isLoading = false,
    this.user,
  });

  AuthNotifierState copyWith({
    String? accessToken,
    bool? isLoading,
    User? user,
  }) {
    return AuthNotifierState(
      accessToken: accessToken ?? this.accessToken,
      isLoading: isLoading ?? this.isLoading,
      user: user ?? this.user,
    );
  }
}

@riverpod
AuthRouterState authRouterState(Ref ref) {
  final asyncAuth = ref.watch(authProvider);

  return asyncAuth.when(
    loading: () => AuthRouterState.loading,
    error: (_, _) => AuthRouterState.loggedOut,
    data:
        (auth) =>
            auth.isLoggedIn
                ? AuthRouterState.loggedIn
                : AuthRouterState.loggedOut,
  );
}

enum AuthRouterState { loading, loggedIn, loggedOut }

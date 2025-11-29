import 'package:pami_app/core/services/auth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_notifier.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  AuthNotifierState build() {
    _init();
    return const AuthNotifierState(isLoading: true);
  }

  Future<void> _init() async {
    final loggedIn = await AuthService.isLoggedIn();
    if (loggedIn) {
      final token = await AuthService.getAccessToken();
      state = state.copyWith(accessToken: token, isLoading: false);
    } else {
      state = state.copyWith(isLoading: false, accessToken: null);
    }
  }

  Future<void> login(String accessToken, {String? refreshToken}) async {
    await AuthService.saveTokens(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
    state = state.copyWith(accessToken: accessToken);
  }

  Future<void> logout() async {
    await AuthService.logout();
    state = const AuthNotifierState(accessToken: null);
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
  final bool isLoading;

  bool get isLoggedIn => accessToken != null;

  const AuthNotifierState({this.accessToken, this.isLoading = false});

  AuthNotifierState copyWith({String? accessToken, bool? isLoading}) {
    return AuthNotifierState(
      accessToken: accessToken ?? this.accessToken,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

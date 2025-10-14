import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pami_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:pami_app/features/auth/presentation/viewmodels/auth_viewmodel.dart';

final loginUseCaseProvider = Provider<LoginUseCase>((ref) {
  throw UnimplementedError(
    'loginUseCaseProvider debe ser sobreescrito en main.dart',
  );
});

final authViewModelProvider = StateNotifierProvider<AuthViewModel, AuthState>((
  ref,
) {
  final useCase = ref.watch(loginUseCaseProvider);
  return AuthViewModel(useCase);
});

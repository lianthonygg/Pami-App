import 'package:pami_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:pami_app/features/auth/presentation/providers/repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'usecase_provider.g.dart';

@riverpod
LoginUseCase loginUseCase(Ref ref) {
  final repository = ref.watch(authRepositoryImplProvider);
  return LoginUseCase(repository);
}

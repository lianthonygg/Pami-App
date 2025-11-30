import 'package:pami_app/features/gestograma/domain/entities/gestante.dart';
import 'package:pami_app/features/gestograma/presentation/providers/usecase_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'gestante_provider.g.dart';

@riverpod
Future<PersonaWithGestanteDetail?> gestanteByCi(Ref ref, String ci) async {
  final usecase = ref.read(gestanteUseCaseProvider);
  return await usecase.getGestanteByCi(ci);
}

import 'package:pami_app/features/common/data/model/persona_model.dart';
import 'package:pami_app/features/personas/presentation/providers/usecase_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'personas_provider.g.dart';

@riverpod
Future<PersonaConCdrYCircunscripcion?> personaByCi(Ref ref, String ci) async {
  final usecase = ref.read(personaUseCaseProvider);
  return await usecase.watchPacienteByCi(ci);
}

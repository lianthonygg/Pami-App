import 'package:flutter_riverpod/flutter_riverpod.dart';

class PersonasViewModel extends StateNotifier<PersonasState> {
  PersonasViewModel() : super(PersonasState.initial());
}

class PersonasState {
  PersonasState();

  factory PersonasState.initial() {
    return PersonasState();
  }
}

PersonasState copyWith() {
  return PersonasState();
}

final personasViewModelProvider =
    StateNotifierProvider<PersonasViewModel, PersonasState>(
      (ref) => PersonasViewModel(),
    );

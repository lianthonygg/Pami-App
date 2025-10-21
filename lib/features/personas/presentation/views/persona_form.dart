import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _fullNameProvider = StateProvider<String>((ref) => '');
final _ciProvider = StateProvider<String>((ref) => '');
final _sexoProvider = StateProvider<String>((ref) => '');
final _razaProvider = StateProvider<String>((ref) => '');
final _direccionCIProvider = StateProvider<String>((ref) => '');
final _direccionViveProvider = StateProvider<String>((ref) => '');

class PersonasForm extends ConsumerStatefulWidget {
  const PersonasForm({super.key});

  @override
  ConsumerState<PersonasForm> createState() => _PersonasFormState();
}

class _PersonasFormState extends ConsumerState<PersonasForm> {
  late final TextEditingController fullNameController;
  late final TextEditingController ciController;
  late final TextEditingController sexoController;
  late final TextEditingController razaController;
  late final TextEditingController direccionCIController;
  late final TextEditingController direccionViveController;
  late final TextEditingController phoneController;
  late final TextEditingController antPpController;
  late final TextEditingController nivelEscolarController;
  late final TextEditingController profesionController;
  late final TextEditingController grupoDispensarialController;
  late final TextEditingController observacionesController;
  //late final SelecController cdrController;

  @override
  void initState() {
    super.initState();
    fullNameController = TextEditingController(
      text: ref.read(_fullNameProvider),
    );
    ciController = TextEditingController(text: ref.read(_ciProvider));
    sexoController = TextEditingController(text: ref.read(_sexoProvider));
    razaController = TextEditingController(text: ref.read(_razaProvider));
    direccionCIController = TextEditingController(
      text: ref.read(_direccionCIProvider),
    );
    direccionViveController = TextEditingController(
      text: ref.read(_direccionViveProvider),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

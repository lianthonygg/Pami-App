import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pami_app/features/personas/data/model/create_persona_model.dart';
import 'package:pami_app/features/personas/presentation/providers/persona_form_provider.dart';
import 'package:pami_app/features/personas/presentation/providers/personas_provider.dart';

class PersonaFormFooter extends ConsumerWidget {
  final GlobalKey<FormState> formKey;

  const PersonaFormFooter({super.key, required this.formKey});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final personasState = ref.watch(personasViewModelProvider);
    final personasViewModel = ref.read(personasViewModelProvider.notifier);
    final cdrSeleccionado = ref.watch(cdrProvider).selected;

    return ElevatedButton.icon(
      icon:
          personasState.isLoading
              ? const SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              )
              : const Icon(Icons.save),
      label: Text(personasState.isLoading ? 'Guardando...' : 'Guardar'),
      onPressed:
          personasState.isLoading
              ? null
              : () {
                if (formKey.currentState!.validate()) {
                  if (cdrSeleccionado == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Debe seleccionar un CDR')),
                    );
                    return;
                  }

                  final data = CreatePersonaRequest(
                    fullName: ref.read(fullNameProvider),
                    ci: ref.read(ciProvider),
                    sexo: ref.read(sexoProvider),
                    raza: ref.read(razaProvider),
                    direccionDelCI: ref.read(direccionCIProvider),
                    direccionEnQueVive: ref.read(direccionViveProvider),
                    telefono: ref.read(phoneProvider) ?? "",
                    antPP: ref.read(antPpProvider) ?? "",
                    nivelEscolar: ref.read(nivelEscolarProvider) ?? "",
                    profesion: ref.read(profesionProvider) ?? "",
                    grupoDispensarial: ref.read(grupoDispensarialProvider),
                    observaciones: ref.read(observacionesProvider) ?? "",
                    cdrId: cdrSeleccionado.id,
                    isController: ref.read(controladaProvider) == "true",
                  );

                  personasViewModel.createPerson(data);
                }
              },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pami_app/features/personas/data/model/create_persona_model.dart';
import 'package:pami_app/features/personas/presentation/providers/persona_form_provider.dart';
import 'package:pami_app/features/personas/presentation/viewmodels/personas_viewmodel.dart';

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

                  final form = ref.read(personaFormProvider);

                  final data = CreatePersonaRequest(
                    fullName: form.fullName,
                    ci: form.ci,
                    sexo: form.sexo,
                    raza: form.raza,
                    direccionDelCI: form.direccionCi,
                    direccionEnQueVive: form.direccionVive,
                    telefono: form.phone,
                    antPP: form.antPp,
                    nivelEscolar: form.nivelEscolar,
                    profesion: form.profesion,
                    grupoDispensarial: form.grupoDispensarial,
                    observaciones: form.observaciones,
                    cdrId: cdrSeleccionado.id,
                    isController: form.controlada == "true",
                  );

                  personasViewModel.createPerson(data);
                }
              },
    );
  }
}

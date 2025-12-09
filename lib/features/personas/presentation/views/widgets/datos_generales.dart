import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pami_app/features/common/presentation/widgets/dropdown_field.dart';
import 'package:pami_app/features/common/presentation/widgets/text_field.dart';
import 'package:pami_app/features/personas/presentation/providers/persona_form_provider.dart';

class DatosGenerales extends ConsumerWidget {
  const DatosGenerales({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        TextFormFieldCustom(
          label: "Antecedentes Patológicos Personales",
          icon: Icons.health_and_safety,
          initialValue: ref.read(personaFormProvider).antPp,
          multiline: true,
          onChanged:
              (v) => ref.read(personaFormProvider.notifier).setAntPp(v.trim()),
        ),
        const SizedBox(height: 16),
        DropdownFormFieldCustom<String>(
          label: "Nivel Escolar",
          icon: Icons.school,
          value:
              ref.watch(personaFormProvider).nivelEscolar.isEmpty
                  ? null
                  : ref.watch(personaFormProvider).nivelEscolar,
          items: const [
            DropdownMenuItem(value: "Primario", child: Text("Primario")),
            DropdownMenuItem(value: "Secundario", child: Text("Secundario")),
            DropdownMenuItem(
              value: "Preuniversitario",
              child: Text("Preuniversitario"),
            ),
            DropdownMenuItem(
              value: "Universitario",
              child: Text("Universitario"),
            ),
          ],
          onChanged:
              (v) => ref
                  .read(personaFormProvider.notifier)
                  .setNivelEscolar(v ?? ''),
        ),
        const SizedBox(height: 16),
        TextFormFieldCustom(
          label: "Profesión",
          icon: Icons.work,
          initialValue: ref.read(personaFormProvider).profesion,
          onChanged:
              (v) =>
                  ref.read(personaFormProvider.notifier).setProfesion(v.trim()),
        ),
        const SizedBox(height: 16),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            labelText: "Grupo Dispensarial",
            prefixIcon: Icon(Icons.group_work),
          ),
          initialValue:
              ref.watch(personaFormProvider).grupoDispensarial.isEmpty
                  ? null
                  : ref.watch(personaFormProvider).grupoDispensarial,
          items: const [
            DropdownMenuItem(value: "Grupo 1", child: Text("Grupo 1")),
            DropdownMenuItem(value: "Grupo 2", child: Text("Grupo 2")),
            DropdownMenuItem(value: "Grupo 3", child: Text("Grupo 3")),
            DropdownMenuItem(value: "Grupo 4", child: Text("Grupo 4")),
          ],
          onChanged:
              (v) => ref
                  .read(personaFormProvider.notifier)
                  .setGrupoDispensarial(v ?? ''),
          validator: (v) => v == null || v.isEmpty ? "Campo requerido" : null,
        ),
        const SizedBox(height: 16),

        TextFormField(
          decoration: InputDecoration(
            labelText: "Observaciones",
            prefixIcon: Icon(Icons.notes),
          ),
          initialValue: ref.read(personaFormProvider).observaciones,
          keyboardType: TextInputType.multiline,
          textInputAction: TextInputAction.newline,
          minLines: 3,
          maxLines: null,
          onChanged:
              (v) => ref
                  .read(personaFormProvider.notifier)
                  .setObservaciones(v.trim()),
        ),
      ],
    );
  }
}

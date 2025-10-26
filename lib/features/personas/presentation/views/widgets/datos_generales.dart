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
          initialValue: ref.read(antPpProvider),
          multiline: true,
          onChanged: (v) => ref.read(antPpProvider.notifier).state = v.trim(),
        ),
        const SizedBox(height: 16),
        DropdownFormFieldCustom<String>(
          label: "Nivel Escolar",
          icon: Icons.school,
          value:
              ref.watch(nivelEscolarProvider).isEmpty
                  ? null
                  : ref.watch(nivelEscolarProvider),
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
              (v) => ref.read(nivelEscolarProvider.notifier).state = v ?? '',
        ),
        const SizedBox(height: 16),
        TextFormFieldCustom(
          label: "Profesión",
          icon: Icons.work,
          initialValue: ref.read(profesionProvider),
          onChanged:
              (v) => ref.read(profesionProvider.notifier).state = v.trim(),
        ),
        const SizedBox(height: 16),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            labelText: "Grupo Dispensarial",
            prefixIcon: Icon(Icons.group_work),
          ),
          value:
              ref.watch(grupoDispensarialProvider).isEmpty
                  ? null
                  : ref.watch(grupoDispensarialProvider),
          items: const [
            DropdownMenuItem(value: "Grupo 1", child: Text("Grupo 1")),
            DropdownMenuItem(value: "Grupo 2", child: Text("Grupo 2")),
            DropdownMenuItem(value: "Grupo 3", child: Text("Grupo 3")),
            DropdownMenuItem(value: "Grupo 4", child: Text("Grupo 4")),
          ],
          onChanged:
              (v) =>
                  ref.read(grupoDispensarialProvider.notifier).state = v ?? '',
          validator: (v) => v == null || v.isEmpty ? "Campo requerido" : null,
        ),
        const SizedBox(height: 16),

        TextFormField(
          decoration: InputDecoration(
            labelText: "Observaciones",
            prefixIcon: Icon(Icons.notes),
          ),
          initialValue: ref.read(observacionesProvider),
          keyboardType: TextInputType.multiline,
          textInputAction: TextInputAction.newline,
          minLines: 3,
          maxLines: null,
          onChanged:
              (v) => ref.read(observacionesProvider.notifier).state = v.trim(),
        ),
      ],
    );
  }
}

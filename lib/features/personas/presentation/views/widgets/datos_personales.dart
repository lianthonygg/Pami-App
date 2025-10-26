import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pami_app/features/common/presentation/widgets/dropdown_field.dart';
import 'package:pami_app/features/common/presentation/widgets/text_field.dart';
import 'package:pami_app/features/personas/presentation/providers/persona_form_provider.dart';

class DatosPersonales extends ConsumerWidget {
  const DatosPersonales({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        TextFormFieldCustom(
          label: "Nombre Completo",
          icon: Icons.person,
          initialValue: ref.read(fullNameProvider),
          keyboardType: TextInputType.name,
          capitalization: TextCapitalization.words,
          validator:
              (v) => v == null || v.trim().isEmpty ? "Campo requerido" : null,
          onChanged:
              (v) => ref.read(fullNameProvider.notifier).state = v.trim(),
        ),
        const SizedBox(height: 16),
        TextFormFieldCustom(
          label: "Carnet de Identidad",
          icon: Icons.badge,
          initialValue: ref.read(ciProvider),
          keyboardType: TextInputType.number,
          maxLength: 11,
          validator: (v) {
            if (v == null || v.isEmpty) return "Campo requerido";
            if (!RegExp(r'^[0-9]+$').hasMatch(v)) return 'Solo números';
            if (v.length != 11) return 'Debe tener 11 dígitos';
            return null;
          },
          onChanged: (v) => ref.read(ciProvider.notifier).state = v.trim(),
        ),
        const SizedBox(height: 16),
        DropdownFormFieldCustom<String>(
          label: "Sexo",
          icon: Icons.transgender,
          value:
              ref.watch(sexoProvider).isEmpty ? null : ref.watch(sexoProvider),
          items: const [
            DropdownMenuItem(value: "M", child: Text("Masculino")),
            DropdownMenuItem(value: "F", child: Text("Femenino")),
          ],
          onChanged: (v) => ref.read(sexoProvider.notifier).state = v ?? '',
          validator: (v) => v == null || v.isEmpty ? "Campo requerido" : null,
        ),
        const SizedBox(height: 16),
        DropdownFormFieldCustom<String>(
          label: "Raza",
          icon: Icons.color_lens,
          value:
              ref.watch(razaProvider).isEmpty ? null : ref.watch(razaProvider),
          items: const [
            DropdownMenuItem(value: 'B', child: Text("Blanca")),
            DropdownMenuItem(value: 'M', child: Text("Mestiza")),
            DropdownMenuItem(value: 'N', child: Text("Negra")),
          ],
          onChanged: (v) => ref.read(razaProvider.notifier).state = v ?? '',
          validator: (v) => v == null || v.isEmpty ? "Campo requerido" : null,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pami_app/features/common/presentation/widgets/text_field.dart';
import 'package:pami_app/features/personas/presentation/providers/persona_form_provider.dart';

class DatosAddressPhone extends ConsumerWidget {
  const DatosAddressPhone({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        TextFormFieldCustom(
          label: "Dirección del Carnet de Identidad",
          icon: Icons.location_pin,
          initialValue: ref.read(direccionCIProvider),
          onChanged:
              (v) => ref.read(direccionCIProvider.notifier).state = v.trim(),
        ),
        const SizedBox(height: 16),
        TextFormFieldCustom(
          label: "Dirección en que Vive",
          icon: Icons.home,
          initialValue: ref.read(direccionViveProvider),
          onChanged:
              (v) => ref.read(direccionViveProvider.notifier).state = v.trim(),
        ),
        const SizedBox(height: 16),
        TextFormFieldCustom(
          label: "Teléfono",
          icon: Icons.phone,
          initialValue: ref.read(phoneProvider),
          keyboardType: TextInputType.phone,
          maxLength: 8,
          validator: (v) {
            if (v != null && v.isNotEmpty) {
              if (!RegExp(r'^[0-9]+$').hasMatch(v)) return 'Solo números';
              if (v.length != 8) return 'Debe tener 8 dígitos';
            }
            return null;
          },
          onChanged: (v) => ref.read(phoneProvider.notifier).state = v.trim(),
        ),
      ],
    );
  }
}

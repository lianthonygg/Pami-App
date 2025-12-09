import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pami_app/features/common/presentation/widgets/dropdown_field.dart';
import 'package:pami_app/features/common/presentation/widgets/text_field.dart';
import 'package:pami_app/features/gestograma/presentation/providers/gestante_provider.dart';
import 'package:pami_app/features/gestograma/presentation/views/widgets/ant_obstetricos.dart';
import 'package:pami_app/features/gestograma/presentation/views/widgets/semanas_dias_field.dart';
import 'package:pami_app/features/personas/presentation/providers/persona_form_provider.dart';

enum Decision { no, si }

enum ClasificacionRiesgo { aro, bro }

class Fields extends ConsumerWidget {
  const Fields({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Decision? antPPretermino = Decision.no;
    Decision? antRCIU = Decision.no;
    ClasificacionRiesgo? clasificacionRiesgo = ClasificacionRiesgo.aro;

    return Column(
      children: [
        TextFormFieldCustom(
          label: "Antecedentes Patológicos Personales",
          icon: Icons.health_and_safety,
          initialValue: ref.read(personaFormProvider).antPp,
          multiline: true,
          onChanged:
              (v) => ref.read(gestanteFormProvider.notifier).setAntPp(v.trim()),
        ),
        const SizedBox(height: 16),
        SemanasDiasField(
          onChanged: (sem, dias) {
            ref.read(gestanteFormProvider.notifier).setTgCaptacion(sem, dias);
          },
        ),
        const SizedBox(height: 16),
        TextField(
          readOnly: true,
          decoration: const InputDecoration(
            labelText: "Fecha de Ultima Menstruación",
            prefixIcon: Icon(Icons.calendar_today_outlined),
            border: OutlineInputBorder(),
          ),
          onTap: () async {
            final DateTime? pickedDate = await showDatePicker(
              context: context,
              locale: const Locale('es', 'ES'),
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
            );

            if (pickedDate != null) {
              ref
                  .read(gestanteFormProvider.notifier)
                  .setFum(
                    "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}",
                  );
            }
          },
        ),
        const SizedBox(height: 16),
        ObstetricosFields(
          onChanged: ({
            required gestaciones,
            required partos,
            required abortos,
            required cesareas,
          }) {
            ref
                .read(gestanteFormProvider.notifier)
                .setObstetricos(
                  gestaciones.toString(),
                  partos.toString(),
                  abortos.toString(),
                  cesareas.toString(),
                );
          },
        ),
        const SizedBox(height: 16),
        const Text("Antecedentes de Partos Pretermino:"),
        const SizedBox(height: 8),

        StatefulBuilder(
          builder: (context, setState) {
            return RadioGroup<Decision>(
              groupValue: antPPretermino,
              onChanged: (Decision? value) {
                ref
                    .read(gestanteFormProvider.notifier)
                    .setAntPPretermino(value == Decision.no ? 'no' : 'si');
                setState(() {
                  antPPretermino = value;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () => setState(() => antPPretermino = Decision.no),
                    child: Row(
                      children: const [
                        Radio<Decision>(value: Decision.no),
                        Text("No", style: TextStyle(fontSize: 17)),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => setState(() => antPPretermino = Decision.si),
                    child: Row(
                      children: const [
                        Radio<Decision>(value: Decision.si),
                        Text("Si", style: TextStyle(fontSize: 17)),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        if (ref.watch(gestanteFormProvider).antPPretermino == 'si') ...[
          const SizedBox(height: 16),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Causas",
              prefixIcon: Icon(Icons.notes),
            ),
            initialValue: ref.read(gestanteFormProvider).observaciones,
            keyboardType: TextInputType.multiline,
            textInputAction: TextInputAction.newline,
            minLines: 3,
            maxLines: null,
            onChanged:
                (v) => ref
                    .read(gestanteFormProvider.notifier)
                    .setObservaciones(v.trim()),
          ),
        ],
        const SizedBox(height: 16),
        TextField(
          readOnly: true,
          decoration: const InputDecoration(
            labelText: "Fecha de Captación",
            prefixIcon: Icon(Icons.calendar_today_outlined),
            border: OutlineInputBorder(),
          ),
          onTap: () async {
            final DateTime? pickedDate = await showDatePicker(
              context: context,
              locale: const Locale('es', 'ES'),
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
            );

            if (pickedDate != null) {
              ref
                  .read(gestanteFormProvider.notifier)
                  .setFechaCaptacion(
                    "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}",
                  );
            }
          },
        ),
        const SizedBox(height: 16),
        const Text("Antecedentes de RCIU:"),
        const SizedBox(height: 8),

        StatefulBuilder(
          builder: (context, setState) {
            return RadioGroup<Decision>(
              groupValue: antRCIU,
              onChanged: (Decision? value) {
                ref
                    .read(gestanteFormProvider.notifier)
                    .setRciu(value == Decision.no ? 'no' : 'si');
                setState(() {
                  antRCIU = value;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () => setState(() => antRCIU = Decision.no),
                    child: Row(
                      children: const [
                        Radio<Decision>(value: Decision.no),
                        Text("No", style: TextStyle(fontSize: 17)),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => setState(() => antRCIU = Decision.si),
                    child: Row(
                      children: const [
                        Radio<Decision>(value: Decision.si),
                        Text("Si", style: TextStyle(fontSize: 17)),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        const SizedBox(height: 16),
        DropdownFormFieldCustom<String>(
          label: "IMC",
          icon: Icons.transgender,
          value:
              ref.watch(gestanteFormProvider).imc.isEmpty
                  ? null
                  : ref.watch(gestanteFormProvider).imc,
          items: const [
            DropdownMenuItem(value: "B", child: Text("Bajo Peso")),
            DropdownMenuItem(value: "N", child: Text("Normopeso")),
            DropdownMenuItem(value: "S", child: Text("Sobrepeso")),
          ],
          onChanged:
              (v) => ref.read(gestanteFormProvider.notifier).setImc(v ?? ''),
          validator: (v) => v == null || v.isEmpty ? "Campo requerido" : null,
        ),
        const SizedBox(height: 16),
        const Text("Clasificación de Riesgo:"),
        const SizedBox(height: 8),

        StatefulBuilder(
          builder: (context, setState) {
            return RadioGroup<ClasificacionRiesgo>(
              groupValue: clasificacionRiesgo,
              onChanged: (ClasificacionRiesgo? value) {
                ref
                    .read(gestanteFormProvider.notifier)
                    .setClasificacionRiesgo(
                      value == ClasificacionRiesgo.aro ? 0 : 1,
                    );
                setState(() {
                  clasificacionRiesgo = value;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap:
                        () => setState(
                          () => clasificacionRiesgo = ClasificacionRiesgo.aro,
                        ),
                    child: Row(
                      children: const [
                        Radio<ClasificacionRiesgo>(
                          value: ClasificacionRiesgo.aro,
                        ),
                        Text("ARO", style: TextStyle(fontSize: 17)),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap:
                        () => setState(
                          () => clasificacionRiesgo = ClasificacionRiesgo.bro,
                        ),
                    child: Row(
                      children: const [
                        Radio<ClasificacionRiesgo>(
                          value: ClasificacionRiesgo.bro,
                        ),
                        Text("BRO", style: TextStyle(fontSize: 17)),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        const SizedBox(height: 16),
        TextField(
          readOnly: true,
          decoration: const InputDecoration(
            labelText: "Fecha de Probable Parto",
            prefixIcon: Icon(Icons.calendar_today_outlined),
            border: OutlineInputBorder(),
          ),
          onTap: () async {
            final DateTime? pickedDate = await showDatePicker(
              context: context,
              locale: const Locale('es', 'ES'),
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
            );

            if (pickedDate != null) {
              ref
                  .read(gestanteFormProvider.notifier)
                  .setFechaProbableParto(
                    "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}",
                  );
            }
          },
        ),
      ],
    );
  }
}

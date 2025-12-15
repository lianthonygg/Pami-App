import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pami_app/features/common/presentation/widgets/dropdown_field.dart';
import 'package:pami_app/features/common/presentation/widgets/text_field.dart';
import 'package:pami_app/features/gestograma/presentation/providers/gestante_provider.dart';
import 'package:pami_app/features/gestograma/presentation/views/widgets/ant_obstetricos.dart';
import 'package:pami_app/features/gestograma/presentation/views/widgets/semanas_dias_field.dart';

enum Decision { no, si }

enum ClasificacionRiesgo { aro, bro }

class Fields extends ConsumerWidget {
  const Fields({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.watch(gestanteFormProvider);

    // Convertir provider → enum
    final decisionPPretermino =
        form.antPPretermino == 'si' ? Decision.si : Decision.no;

    final decisionRCIU = form.rciu == 'si' ? Decision.si : Decision.no;

    final riesgo =
        form.clasificacionRiesgo == 0
            ? ClasificacionRiesgo.aro
            : ClasificacionRiesgo.bro;

    return Column(
      children: [
        TextFormFieldCustom(
          label: "Antecedentes Patológicos Personales",
          icon: Icons.health_and_safety,
          initialValue: form.antPp,
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

        // FUM
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

        // ANTECEDENTES DE PARTO PRETÉRMINO
        const Text("Antecedentes de Partos Pretermino:"),
        const SizedBox(height: 8),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                RadioMenuButton<Decision>(
                  value: Decision.no,
                  groupValue: decisionPPretermino,
                  onChanged: (value) {
                    ref
                        .read(gestanteFormProvider.notifier)
                        .setAntPPretermino('no');
                  },
                  child: const Text("No", style: TextStyle(fontSize: 17)),
                ),
                RadioMenuButton<Decision>(
                  value: Decision.si,
                  groupValue: decisionPPretermino,
                  onChanged: (value) {
                    ref
                        .read(gestanteFormProvider.notifier)
                        .setAntPPretermino('si');
                  },
                  child: const Text("Sí", style: TextStyle(fontSize: 17)),
                ),
              ],
            ),
          ],
        ),

        // CAMPO MOSTRADO CON RADIO = SI
        if (form.antPPretermino == 'si') ...[
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(
              labelText: "Causas",
              prefixIcon: Icon(Icons.notes),
            ),
            initialValue: form.observaciones,
            keyboardType: TextInputType.multiline,
            minLines: 3,
            maxLines: null,
            onChanged:
                (v) => ref
                    .read(gestanteFormProvider.notifier)
                    .setObservaciones(v.trim()),
          ),
        ],

        const SizedBox(height: 16),

        // FECHA CAPTACIÓN
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

        // ANTECEDENTES RCIU
        const Text("Antecedentes de RCIU:"),
        const SizedBox(height: 8),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                RadioMenuButton<Decision>(
                  value: Decision.no,
                  groupValue: decisionRCIU,
                  onChanged: (value) {
                    ref.read(gestanteFormProvider.notifier).setRciu('no');
                  },
                  child: const Text("No", style: TextStyle(fontSize: 17)),
                ),
                RadioMenuButton<Decision>(
                  value: Decision.si,
                  groupValue: decisionRCIU,
                  onChanged: (value) {
                    ref.read(gestanteFormProvider.notifier).setRciu('si');
                  },
                  child: const Text("Sí", style: TextStyle(fontSize: 17)),
                ),
              ],
            ),
          ],
        ),

        const SizedBox(height: 16),

        // IMC
        DropdownFormFieldCustom<String>(
          label: "IMC",
          icon: Icons.transgender,
          value: form.imc.isEmpty ? null : form.imc,
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

        // CLASIFICACION DE RIESGO
        const Text("Clasificación de Riesgo:"),
        const SizedBox(height: 8),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                RadioMenuButton<ClasificacionRiesgo>(
                  value: ClasificacionRiesgo.aro,
                  groupValue: riesgo,
                  onChanged: (value) {
                    ref
                        .read(gestanteFormProvider.notifier)
                        .setClasificacionRiesgo(0);
                  },
                  child: const Text("ARO", style: TextStyle(fontSize: 17)),
                ),
                RadioMenuButton<ClasificacionRiesgo>(
                  value: ClasificacionRiesgo.bro,
                  groupValue: riesgo,
                  onChanged: (value) {
                    ref
                        .read(gestanteFormProvider.notifier)
                        .setClasificacionRiesgo(1);
                  },
                  child: const Text("BRO", style: TextStyle(fontSize: 17)),
                ),
              ],
            ),
          ],
        ),

        const SizedBox(height: 16),

        // FECHA DE PROBABLE PARTO
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

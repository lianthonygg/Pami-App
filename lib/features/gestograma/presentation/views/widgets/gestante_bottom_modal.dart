import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pami_app/features/gestograma/presentation/viewmodels/gestantes_viewmodel.dart';

enum TipoParto { eutocico, distocico }

enum Parto { unico, multiple }

Future<void> showAddGestanteBottomSheet(
  BuildContext context,
  WidgetRef ref,
  GestantesViewModel gestantesViewModel,
) async {
  final fieldNameController = TextEditingController();
  final dateController = TextEditingController();
  TipoParto? tipoParto = TipoParto.eutocico;
  Parto? partoOption = Parto.unico;

  await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (context) {
      final bottomInset = MediaQuery.of(context).viewInsets.bottom;

      return Padding(
        padding: EdgeInsets.only(bottom: bottomInset),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: StatefulBuilder(
            builder: (context, setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  const Text(
                    "Finalizar Gestacion",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: dateController,
                    readOnly: true,
                    decoration: const InputDecoration(
                      labelText: "Fecha de Parto",
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
                        dateController.text =
                            "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                      }
                    },
                  ),
                  const SizedBox(height: 16),
                  const Text("Tipo de Parto:"),
                  const SizedBox(height: 8),

                  RadioGroup<TipoParto>(
                    groupValue: tipoParto,
                    onChanged: (TipoParto? value) {
                      setState(() {
                        tipoParto = value;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap:
                              () => setState(
                                () => tipoParto = TipoParto.eutocico,
                              ),
                          child: Row(
                            children: const [
                              Radio<TipoParto>(value: TipoParto.eutocico),
                              Text("Eutócico", style: TextStyle(fontSize: 17)),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap:
                              () => setState(
                                () => tipoParto = TipoParto.distocico,
                              ),
                          child: Row(
                            children: const [
                              Radio<TipoParto>(value: TipoParto.distocico),
                              Text("Distócico", style: TextStyle(fontSize: 17)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text("Parto:"),
                  const SizedBox(height: 8),

                  RadioGroup<Parto>(
                    groupValue: partoOption,
                    onChanged: (Parto? value) {
                      setState(() {
                        partoOption = value;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap:
                              () => setState(() => partoOption = Parto.unico),
                          child: Row(
                            children: const [
                              Radio<Parto>(value: Parto.unico),
                              Text("Unico", style: TextStyle(fontSize: 17)),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap:
                              () =>
                                  setState(() => partoOption = Parto.multiple),
                          child: Row(
                            children: const [
                              Radio<Parto>(value: Parto.multiple),
                              Text("Multiple", style: TextStyle(fontSize: 17)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => Navigator.of(context).pop(),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.grey[700],
                            side: BorderSide(color: Colors.grey[400]!),
                          ),
                          child: const Text("Cancelar"),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            final name = fieldNameController.text.trim();

                            if (name.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "Todos los campos son obligatorios",
                                  ),
                                ),
                              );
                              return;
                            }

                            Navigator.of(context).pop();
                          },
                          icon: const Icon(Icons.save_outlined),
                          label: const Text("Guardar"),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      );
    },
  );
}

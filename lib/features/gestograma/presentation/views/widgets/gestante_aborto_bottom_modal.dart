import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pami_app/features/gestograma/presentation/viewmodels/gestantes_viewmodel.dart';

enum TipoAborto { esp, prov }

Future<void> showAddAbortoBottomSheet(
  BuildContext context,
  WidgetRef ref,
  GestantesViewModel gestantesViewModel,
) async {
  TipoAborto? tipoAborto = TipoAborto.esp;

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
                    "Finalizar Gestación por Aborto",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  const Text("Tipo de Aborto:"),
                  const SizedBox(height: 8),

                  RadioGroup<TipoAborto>(
                    groupValue: tipoAborto,
                    onChanged: (TipoAborto? value) {
                      setState(() {
                        tipoAborto = value;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap:
                              () => setState(() => tipoAborto = TipoAborto.esp),
                          child: Row(
                            children: const [
                              Radio<TipoAborto>(value: TipoAborto.esp),
                              Text(
                                "Espontaneo",
                                style: TextStyle(fontSize: 17),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap:
                              () =>
                                  setState(() => tipoAborto = TipoAborto.prov),
                          child: Row(
                            children: const [
                              Radio<TipoAborto>(value: TipoAborto.prov),
                              Text("Provocado", style: TextStyle(fontSize: 17)),
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
                            // if (name.isEmpty) {
                            //   ScaffoldMessenger.of(context).showSnackBar(
                            //     const SnackBar(
                            //       content: Text(
                            //         "Todos los campos son obligatorios",
                            //       ),
                            //     ),
                            //   );
                            //   return;
                            // }

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

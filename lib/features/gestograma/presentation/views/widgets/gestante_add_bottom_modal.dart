import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pami_app/features/common/domain/entities/persona.dart';
import 'package:pami_app/features/gestograma/presentation/providers/gestante_provider.dart';
import 'package:pami_app/features/personas/presentation/providers/personas_provider.dart';
import 'package:pami_app/routing/routes.dart';

Future<void> showBuscarGestanteBottomSheet(
  BuildContext context,
  WidgetRef ref,
) {
  final dniController = TextEditingController();

  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return Consumer(
        builder: (context, ref, _) {
          final personaAsync = ref.watch(
            tryGestanteByCiProvider(dniController.text),
          );

          Persona? personaEncontrada;
          personaAsync.when(
            data: (p) => personaEncontrada = p,
            loading: () {},
            error: (_, _) {},
          );

          return Padding(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              top: 24,
              bottom: MediaQuery.of(context).viewInsets.bottom + 16,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: dniController,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                    labelText: "Carnet de Identidad",
                    hintText: "Ingrese el Carnet de Identidad",
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        ref.invalidate(personaByCiProvider(dniController.text));
                      },
                    ),
                  ),
                  onSubmitted: (_) {
                    ref.invalidate(personaByCiProvider(dniController.text));
                  },
                ),

                const SizedBox(height: 25),

                // -----------------------
                // MOSTRAR RESULTADO
                // -----------------------
                personaAsync.when(
                  loading: () => const CircularProgressIndicator(),
                  error:
                      (h, j) => const Text(
                        "No encontrado",
                        style: TextStyle(color: Colors.red),
                      ),
                  data: (persona) {
                    if (persona == null) {
                      return const Text(
                        "No existe una persona con ese CI",
                        style: TextStyle(fontSize: 14),
                      );
                    }
                    return Column(
                      children: [
                        Text(
                          "${persona.fullName} - ${persona.ci}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    );
                  },
                ),

                const SizedBox(height: 30),

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
                        icon: const Icon(Icons.arrow_forward),
                        label: const Text("Siguiente"),
                        onPressed:
                            personaEncontrada != null
                                ? () {
                                  context.push(
                                    Routes.createGestante.replaceFirst(
                                      ':id',
                                      personaEncontrada!.id,
                                    ),
                                  );
                                  Navigator.pop(context);
                                }
                                : null,
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.resolveWith((
                            states,
                          ) {
                            if (states.contains(WidgetState.disabled)) {
                              return Colors.grey.shade300;
                            }
                            return Theme.of(context).primaryColor;
                          }),
                          foregroundColor: WidgetStateProperty.resolveWith((
                            states,
                          ) {
                            if (states.contains(WidgetState.disabled)) {
                              return Colors.grey.shade600;
                            }
                            return Colors.white;
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      );
    },
  );
}

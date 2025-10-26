import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pami_app/core/theme/theme.dart';
import 'package:pami_app/features/personas/presentation/providers/persona_form_provider.dart';
import 'package:pami_app/features/personas/presentation/providers/personas_provider.dart';
import 'package:pami_app/features/personas/presentation/viewmodels/personas_viewmodel.dart';
import 'package:pami_app/features/personas/presentation/views/widgets/datos_address_phone.dart';
import 'package:pami_app/features/personas/presentation/views/widgets/datos_generales.dart';
import 'package:pami_app/features/personas/presentation/views/widgets/datos_personales.dart';
import 'package:pami_app/features/personas/presentation/views/widgets/persona_form_footer.dart';

class PersonaForm extends ConsumerStatefulWidget {
  const PersonaForm({super.key});

  @override
  ConsumerState<PersonaForm> createState() => _PersonaFormState();
}

class _PersonaFormState extends ConsumerState<PersonaForm> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final circState = ref.watch(circunscripcionProvider);
    final cdrState = ref.watch(cdrProvider);
    final personasState = ref.watch(personasViewModelProvider);

    ref.listen<PersonasState>(personasViewModelProvider, (previous, next) {
      if (previous?.isLoading == true &&
          next.isLoading == false &&
          next.error == null) {
        formKey.currentState?.reset();

        // Resetear todos los providers
        ref.read(fullNameProvider.notifier).state = '';
        ref.read(ciProvider.notifier).state = '';
        ref.read(sexoProvider.notifier).state = '';
        ref.read(razaProvider.notifier).state = '';
        ref.read(direccionCIProvider.notifier).state = '';
        ref.read(direccionViveProvider.notifier).state = '';
        ref.read(phoneProvider.notifier).state = '';
        ref.read(antPpProvider.notifier).state = '';
        ref.read(nivelEscolarProvider.notifier).state = '';
        ref.read(profesionProvider.notifier).state = '';
        ref.read(grupoDispensarialProvider.notifier).state = '';
        ref.read(observacionesProvider.notifier).state = '';

        context.pop();
      }
    });

    ref.listenManual(
      circunscripcionProvider,
      (previous, next) {},
      fireImmediately: false,
    );

    if (circState.items.isEmpty && !circState.isLoading) {
      Future.microtask(() {
        ref.read(circunscripcionProvider.notifier).load();
      });
    }

    final currentCdrValue =
        cdrState.items.any((c) => c.id == cdrState.selected?.id)
            ? cdrState.selected?.id
            : null;

    final gradient =
        Theme.of(context).brightness == Brightness.dark
            ? AppTheme.darkBackgroundGradient
            : AppTheme.lightBackgroundGradient;

    return Container(
      decoration: BoxDecoration(gradient: gradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.pop(),
          ),
          title: const Text('Agregar Paciente'),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SafeArea(
          child: Center(
            child: Card(
              margin: const EdgeInsets.all(16),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: formKey,
                  child: ListView(
                    children: [
                      FadeIn(
                        duration: const Duration(milliseconds: 300),
                        child:
                            personasState.error == null
                                ? const SizedBox.shrink()
                                : ShakeX(
                                  duration: const Duration(milliseconds: 600),
                                  child: Container(
                                    padding: const EdgeInsets.all(12),
                                    margin: const EdgeInsets.only(bottom: 16),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).colorScheme.error
                                          .withValues(alpha: 0.2),
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color:
                                            Theme.of(context).colorScheme.error,
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.error_outline,
                                          color: Colors.redAccent,
                                        ),
                                        const SizedBox(width: 8),
                                        Expanded(
                                          child: Text(
                                            personasState.error ??
                                                "Error Inesperado",
                                            style: Theme.of(
                                              context,
                                            ).textTheme.bodyMedium?.copyWith(
                                              color:
                                                  Theme.of(
                                                    context,
                                                  ).colorScheme.error,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                      ),
                      const SizedBox(height: 16),
                      DatosPersonales(),
                      const SizedBox(height: 16),
                      DatosAddressPhone(),
                      const SizedBox(height: 16),
                      DatosGenerales(),
                      const SizedBox(height: 16),

                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: "Circunscripción",
                          prefixIcon: Icon(Icons.location_city),
                        ),
                        value: circState.selected?.id,
                        items:
                            circState.items
                                .map(
                                  (c) => DropdownMenuItem(
                                    value: c.id,
                                    child: Text("CIRC #${c.numero}"),
                                  ),
                                )
                                .toList(),
                        onChanged: (id) {
                          if (id != null) {
                            final selected = circState.items.firstWhere(
                              (c) => c.id == id,
                            );
                            ref.read(cdrProvider.notifier).select(null);

                            ref
                                .read(circunscripcionProvider.notifier)
                                .select(selected);
                            ref.read(cdrProvider.notifier).load(id);
                          }
                        },
                        validator: (v) => v == null ? "Campo requerido" : null,
                      ),
                      const SizedBox(height: 16),

                      DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          labelText: "CDR",
                          prefixIcon: Icon(Icons.home_work),
                        ),
                        value: currentCdrValue, // <-- validado antes
                        items:
                            cdrState.items
                                .map(
                                  (c) => DropdownMenuItem(
                                    value: c.id,
                                    child: Text("CDR #${c.numero}"),
                                  ),
                                )
                                .toList(),
                        onChanged: (id) {
                          if (id != null) {
                            final selected = cdrState.items.firstWhere(
                              (c) => c.id == id,
                            );
                            ref.read(cdrProvider.notifier).select(selected);
                          }
                        },
                        validator: (v) => v == null ? "Campo requerido" : null,
                      ),
                      const SizedBox(height: 24),
                      PersonaFormFooter(formKey: formKey),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

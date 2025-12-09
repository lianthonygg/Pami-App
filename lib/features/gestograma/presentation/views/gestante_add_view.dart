import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pami_app/core/theme/theme.dart';
import 'package:pami_app/features/gestograma/presentation/viewmodels/gestantes_viewmodel.dart';
import 'package:pami_app/features/gestograma/presentation/views/widgets/fields.dart';
import 'package:pami_app/features/personas/presentation/providers/persona_form_provider.dart';

class GestanteAddForm extends ConsumerStatefulWidget {
  final String id;

  const GestanteAddForm({super.key, required this.id});

  @override
  ConsumerState<GestanteAddForm> createState() => _GestanteAddFormState();
}

class _GestanteAddFormState extends ConsumerState<GestanteAddForm> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final personasState = ref.watch(gestantesViewModelProvider);

    ref.listen<GestantesState>(gestantesViewModelProvider, (
      previous,
      next,
    ) async {
      if (previous?.isLoading == true &&
          next.isLoading == false &&
          next.error == null) {
        formKey.currentState?.reset();

        ref.read(personaFormProvider.notifier).clear();

        ref.read(circunscripcionProvider.notifier).reset();
        ref.read(cdrProvider.notifier).reset();

        //await ref.read(circunscripcionProvider.notifier).load();

        if (context.mounted) {
          context.pop();
        }
      }
    });

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
          title: const Text('Agregar Gestante'),
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
                      Fields(),
                      const SizedBox(height: 24),
                      // PersonaFormFooter(formKey: formKey),
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

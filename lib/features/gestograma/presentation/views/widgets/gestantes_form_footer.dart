import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pami_app/features/gestograma/data/model/create_gestante_model.dart';
import 'package:pami_app/features/gestograma/presentation/providers/gestante_provider.dart';
import 'package:pami_app/features/gestograma/presentation/viewmodels/gestantes_viewmodel.dart';
import 'package:uuid/uuid.dart';

class GestanteFormFooter extends ConsumerWidget {
  final GlobalKey<FormState> formKey;
  final String id;

  const GestanteFormFooter({
    super.key,
    required this.formKey,
    required this.id,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gestantesState = ref.watch(gestantesViewModelProvider);
    final gestantesViewModel = ref.read(gestantesViewModelProvider.notifier);
    //final cdrSeleccionado = ref.watch(cdrProvider).selected;

    return ElevatedButton.icon(
      icon:
          gestantesState.isLoading
              ? const SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              )
              : const Icon(Icons.save),
      label: Text(gestantesState.isLoading ? 'Guardando...' : 'Guardar'),
      onPressed:
          gestantesState.isLoading
              ? null
              : () {
                if (formKey.currentState!.validate()) {
                  // if (cdrSeleccionado == null) {
                  //   ScaffoldMessenger.of(context).showSnackBar(
                  //     const SnackBar(content: Text('Debe seleccionar un CDR')),
                  //   );
                  //   return;
                  // }

                  final form = ref.read(gestanteFormProvider);

                  final data = CreateGestanteRequest(
                    id: Uuid().v4(),
                    personaId: id,
                    esposoId: '',
                    antPP: form.antPp,
                    antPFam: '',
                    observaciones: form.observaciones,
                    tgCaptacion: form.tgCaptacion,
                    tgFinal: '',
                    fum: _formatDate(form.fum),
                    gestaciones: form.gestaciones,
                    partos: form.partos,
                    abortos: form.abortos,
                    cesareas: form.cesareas,
                    antPPretermino: form.antPPretermino,
                    fechaCaptacion: _formatDate(form.fechaCaptacion),
                    rciu: form.rciu,
                    imc: form.imc,
                    fechaProbableParto: _formatDate(form.fechaProbableParto),
                    clasificacionRiesgo: form.clasificacionRiesgo,
                  );

                  gestantesViewModel.createGestante(data);
                }
              },
    );
  }

  String _formatDate(String date) {
    final parts = date.split('/');
    final day = parts[0].padLeft(2, '0');
    final month = parts[1].padLeft(2, '0');
    final year = parts[2];
    return '$day/$month/$year';
  }
}

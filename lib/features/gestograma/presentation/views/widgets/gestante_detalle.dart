import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pami_app/core/theme/theme.dart';
import 'package:pami_app/features/gestograma/domain/entities/gestante.dart';
import 'package:pami_app/features/gestograma/presentation/providers/gestante_provider.dart';
import 'package:pami_app/features/gestograma/presentation/viewmodels/gestantes_viewmodel.dart';
import 'package:pami_app/features/gestograma/presentation/views/widgets/gestante_aborto_bottom_modal.dart';
import 'package:pami_app/features/gestograma/presentation/views/widgets/gestante_bottom_modal.dart';

class GestanteDetalle extends ConsumerWidget {
  final String ci;

  const GestanteDetalle({super.key, required this.ci});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final personaAsync = ref.watch(gestanteByCiProvider(ci));
    final gestantesViewModel = ref.read(gestantesViewModelProvider.notifier);
    late final PersonaWithGestanteDetail gestante;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        gradient:
            isDark
                ? AppTheme.darkBackgroundGradient
                : AppTheme.lightBackgroundGradient,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(Icons.arrow_back),
          ),
          title: const Text("Detalle de la Gestante"),
          centerTitle: true,
        ),
        body: SafeArea(
          child: personaAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error:
                (err, _) => Center(
                  child: Text(
                    err.toString(),
                    style: TextStyle(color: colorScheme.error),
                  ),
                ),
            data: (persona) {
              if (persona == null) {
                return const Text("No se encontró la gestante");
              }
              gestante = persona;
              return _buildPersonaDetalle(context, persona);
            },
          ),
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            final a = parseSemValue(gestante.tgActual);
            final b = parseSemValue("24.0sem");
            if (a < b) {
              showAddAbortoBottomSheet(context, ref, gestantesViewModel);
            } else {
              showAddGestantePartoBottomSheet(context, ref, gestantesViewModel);
            }
          },
          child: Icon(Icons.done_rounded),
        ),
      ),
    );
  }

  double parseSemValue(String input) {
    final regex = RegExp(r'^(\d+)(?:\.(\d+))?sem$');
    final match = regex.firstMatch(input);

    if (match == null) return 0;

    final entero = int.parse(match.group(1)!);
    final decimal = match.group(2) != null ? int.parse(match.group(2)!) : 0;

    return entero + decimal / 10;
  }

  Widget _buildPersonaDetalle(
    BuildContext context,
    PersonaWithGestanteDetail data,
  ) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildSection(context, "Datos Generales", [
          _item(context, "Nombre y Apellidos", data.persona.fullName),
          _item(context, "CI", data.persona.ci),
          _item(
            context,
            "Raza",
            data.persona.raza == "B"
                ? "Blanca"
                : data.persona.raza == "M"
                ? "Mestiza"
                : "Negra",
          ),
        ]),
        _buildSection(context, "Dirección", [
          _item(context, "Dirección del CI", data.persona.direccionCi),
          _item(context, "Dirección donde vive", data.persona.direccionVive),
          _item(context, "Circunscripción", data.circunscripcion.numero),
          _item(context, "CDR", data.cdr.numero),
        ]),
        _buildSection(context, "Contacto", [
          _item(context, "Teléfono", data.persona.telefono),
        ]),
        _buildSection(context, "Datos Gestacionales", [
          _item(
            context,
            "Tiempo Gestacional a la Captacion",
            data.gestante.tgCaptacion,
          ),
          _item(context, "Tiempo Gestacional Actual", data.tgActual),
          _item(
            context,
            "Fecha de Ultima Menstruacion",
            parseFecha(data.gestante.fum.toIso8601String()),
          ),
          _item(
            context,
            "Fecha de Captacion",
            parseFecha(data.gestante.fechaCaptacion.toIso8601String()),
          ),
          _item(
            context,
            "Fecha de Probable Parto",
            parseFecha(data.gestante.fechaProbableParto.toIso8601String()),
          ),
          _item(context, "Gestaciones", data.gestante.gestaciones),
          _item(context, "Partos", data.gestante.partos),
          _item(context, "Abortos", data.gestante.abortos),
          _item(context, "Cesareas", data.gestante.cesareas),
        ]),
        _buildSection(context, "Otros Datos", [
          _item(
            context,
            "Antecedentes Patologicos Personales",
            data.gestante.antPp,
          ),
          _item(
            context,
            "Antecedentes de Partos Pretermino",
            data.gestante.antPPretermino,
          ),
          _item(context, "Antecedentes de RCIU", data.gestante.rciu),
          _item(context, "IMC", data.gestante.imc),
          _item(
            context,
            "Clasificacion de Riesgo",
            data.gestante.clasificacionRiesgo == 0 ? 'ARO' : 'BRO',
          ),
          _item(context, "Observaciones", data.gestante.observaciones),
        ]),
      ],
    );
  }

  String parseFecha(String fechaIso) {
    final date = DateTime.parse(fechaIso);
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    final year = date.year.toString();
    return "$day/$month/$year";
  }

  Widget _buildSection(
    BuildContext context,
    String title,
    List<Widget> children,
  ) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: theme.cardTheme.elevation,
      color: theme.cardTheme.color, // usa el translúcido del tema
      shadowColor: theme.cardTheme.shadowColor,
      shape: theme.cardTheme.shape,
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: colorScheme.primary,
              ),
            ),
            const Divider(thickness: 1.1),
            const SizedBox(height: 6),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _item(BuildContext context, String label, String? value) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$label:",
            style: theme.textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: colorScheme.onSurface.withValues(alpha: 0.8),
            ),
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              value!.isEmpty ? "-" : value,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

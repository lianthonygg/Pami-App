import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pami_app/core/theme/theme.dart';
import 'package:pami_app/features/common/data/model/persona_model.dart';
import 'package:pami_app/features/personas/presentation/providers/personas_provider.dart';

class PersonaDetalle extends ConsumerWidget {
  final String ci;

  const PersonaDetalle({super.key, required this.ci});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final personaAsync = ref.watch(personaByCiProvider(ci));
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
          title: const Text("Detalle del Paciente"),
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
                return const Text("No se encontró la persona");
              }
              return _buildPersonaDetalle(context, persona);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildPersonaDetalle(
    BuildContext context,
    PersonaConCdrYCircunscripcion data,
  ) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildSection(context, "Datos Generales", [
          _item(context, "Nombre y Apellidos", data.persona.fullName),
          _item(context, "CI", data.persona.ci),
          _item(
            context,
            "Sexo",
            data.persona.sexo == "M" ? "Masculino" : "Femenino",
          ),
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
        _buildSection(context, "Otros", [
          _item(context, "Nivel Escolar", data.persona.nivelEscolar),
          _item(context, "Profesión", data.persona.profesion),
          _item(context, "Antecedentes Patológicos", data.persona.antPP),
          _item(context, "Grupo Dispensarial", data.persona.grupoDispensarial),
          _item(context, "Observaciones", data.persona.observaciones),
        ]),
      ],
    );
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

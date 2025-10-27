import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pami_app/core/theme/theme.dart';
import 'package:pami_app/features/common/domain/entities/persona.dart';
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
            data: (persona) => _buildPersonaDetalle(context, persona),
          ),
        ),
      ),
    );
  }

  Widget _buildPersonaDetalle(BuildContext context, Persona persona) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildSection(context, "Datos Generales", [
          _item(context, "Nombre y Apellidos", persona.fullName),
          _item(context, "CI", persona.ci),
          _item(
            context,
            "Sexo",
            persona.sexo == "M" ? "Masculino" : "Femenino",
          ),
          _item(
            context,
            "Raza",
            persona.raza == "B"
                ? "Blanca"
                : persona.raza == "M"
                ? "Mestiza"
                : "Negra",
          ),
        ]),
        _buildSection(context, "Dirección", [
          _item(context, "Dirección del CI", persona.direccionDelCI),
          _item(context, "Dirección donde vive", persona.direccionEnQueVive),
          _item(context, "Circunscripción", persona.circunscripcion.numero),
          _item(context, "CDR", persona.cdr.numero),
        ]),
        _buildSection(context, "Contacto", [
          _item(context, "Teléfono", persona.telefono),
        ]),
        _buildSection(context, "Otros", [
          _item(context, "Nivel Escolar", persona.nivelEscolar),
          _item(context, "Profesión", persona.profesion),
          _item(context, "Antecedentes Patológicos", persona.antPP),
          _item(context, "Grupo Dispensarial", persona.grupoDispensarial),
          _item(context, "Observaciones", persona.observaciones),
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

  Widget _item(BuildContext context, String label, String value) {
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
              value.isEmpty ? "-" : value,
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

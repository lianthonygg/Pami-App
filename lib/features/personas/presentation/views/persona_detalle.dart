import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pami_app/features/personas/domain/entities/persona.dart';
import 'package:pami_app/features/personas/presentation/providers/personas_provider.dart';

class PersonaDetalle extends ConsumerWidget {
  final String ci;

  const PersonaDetalle({super.key, required this.ci});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final personaAsync = ref.watch(personaByCiProvider(ci));

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text("Detalle Paciente"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: personaAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, _) => Center(child: Text(err.toString())),
          data: (persona) => _buildPersonaDetalle(persona),
        ),
      ),
    );
  }

  Widget _buildPersonaDetalle(Persona persona) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        _buildSection("Datos Generales", [
          _item("Nombre y Apellidos", persona.fullName),
          _item("CI", persona.ci),
          _item("Sexo", persona.sexo == "M" ? "Masculino" : "Femenino"),
          _item(
            "Raza",
            persona.raza == "B"
                ? "Blanca"
                : persona.raza == "M"
                ? "Mestiza"
                : "Negra",
          ),
        ]),
        _buildSection("Dirección", [
          _item("Dirección del CI", persona.direccionDelCI),
          _item("Dirección donde vive", persona.direccionEnQueVive),
          _item("CDR", persona.cdr.numero),
        ]),
        _buildSection("Contacto", [_item("Teléfono", persona.telefono)]),
        _buildSection("Otros", [
          _item("Nivel Escolar", persona.nivelEscolar),
          _item("Profesión", persona.profesion),
          _item("Antecedentes Patológicos", persona.antPP),
          _item("Grupo Dispensarial", persona.grupoDispensarial),
          _item("Observaciones", persona.observaciones),
        ]),
      ],
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _item(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$label:",
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
          ),
          const SizedBox(height: 4),
          Text(
            value.isEmpty ? "-" : value,
            style: const TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }
}

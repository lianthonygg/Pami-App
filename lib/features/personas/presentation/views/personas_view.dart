import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pami_app/core/widgets/dynamic_drawer.dart';
import 'package:pami_app/features/personas/presentation/providers/personas_provider.dart';
import 'package:pami_app/routing/routes.dart';

class PersonasView extends ConsumerWidget {
  const PersonasView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final personasState = ref.watch(personasViewModelProvider);
    final personasViewModel = ref.read(personasViewModelProvider.notifier);

    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (personasState.items == null) {
        personasViewModel.getAll();
      }
    });

    return Scaffold(
      extendBody: true,
      drawer: const DynamicDrawer(),
      backgroundColor: colorScheme.surfaceContainerHighest,
      appBar: AppBar(
        title: const Text("Pacientes"),
        centerTitle: true,
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        elevation: 0,
      ),
      body: SafeArea(
        child:
            personasState.isLoading
                ? const Center(child: CircularProgressIndicator())
                : personasState.error != null
                ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      personasState.error!,
                      style: textTheme.bodyMedium?.copyWith(
                        color: colorScheme.error,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
                : RefreshIndicator(
                  onRefresh: () async {
                    await personasViewModel.getAll();
                  },
                  child:
                      personasState.items == null ||
                              (personasState.items is List &&
                                  (personasState.items as List).isEmpty)
                          ? ListView(
                            children: [
                              const SizedBox(height: 150),
                              Center(
                                child: Text(
                                  "No hay personas registradas",
                                  style: textTheme.bodyMedium?.copyWith(
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ),
                            ],
                          )
                          : ListView.builder(
                            padding: const EdgeInsets.all(16),
                            itemCount: (personasState.items as List).length,
                            itemBuilder: (context, index) {
                              final personas = personasState.items as List;

                              if (index == 0) {
                                // Encabezado con total
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 12.0),
                                  child: Text(
                                    "Total: ${(personas.length + 1)}",
                                    style: textTheme.titleMedium?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: colorScheme.primary,
                                    ),
                                  ),
                                );
                              }

                              final persona = personas[index];
                              return _PersonaCard(
                                onTap: () {
                                  context.push(
                                    Routes.detallePersona.replaceFirst(
                                      ':ci',
                                      persona.ci,
                                    ),
                                  );
                                },
                                name: persona.fullName,
                                ci: persona.ci,
                                telefono: persona.telefono,
                                grupo: persona.grupoDispensarial,
                              );
                            },
                          ),
                ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (context.mounted) {
            context.push(Routes.createPersona);
          }
        },
        child: const Icon(Icons.person_add_alt),
      ),
    );
  }
}

class _PersonaCard extends StatelessWidget {
  final String name;
  final String ci;
  final String telefono;
  final String grupo;
  final VoidCallback? onTap;

  const _PersonaCard({
    required this.name,
    required this.ci,
    required this.telefono,
    required this.grupo,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Card(
      elevation: 3,
      color: colorScheme.surface,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: ListTile(
          leading: CircleAvatar(
            radius: 24,
            backgroundColor: colorScheme.primary,
            child: Icon(Icons.person, color: colorScheme.onPrimary),
          ),
          title: Text(
            name,
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "CI: $ci",
                style: textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              Text(
                "Teléfono: $telefono",
                style: textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              Text(
                "Grupo: $grupo",
                style: textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 18,
            color: colorScheme.primary,
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}

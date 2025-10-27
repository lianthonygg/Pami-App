import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pami_app/core/widgets/dynamic_drawer.dart';
import 'package:pami_app/features/pregestograma/presentation/providers/pregestantes_provider.dart';

class PregestogramaView extends ConsumerWidget {
  const PregestogramaView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pregestantesState = ref.watch(pregestantesViewModelProvider);
    final pregestantesViewModel = ref.watch(
      pregestantesViewModelProvider.notifier,
    );

    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (pregestantesState.items == null) {
        pregestantesViewModel.getAll();
      }
    });

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text("Mujeres en Edad Fertil"),
        centerTitle: true,
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        elevation: 0,
      ),
      backgroundColor: colorScheme.surfaceContainerHighest,
      drawer: const DynamicDrawer(),
      body: SafeArea(
        child:
            pregestantesState.isLoading
                ? const Center(child: CircularProgressIndicator())
                : pregestantesState.error != null
                ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      pregestantesState.error!,
                      style: textTheme.bodyMedium?.copyWith(
                        color: colorScheme.error,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
                : RefreshIndicator(
                  child:
                      pregestantesState.items == null ||
                              (pregestantesState.items is List &&
                                  (pregestantesState.items as List).isEmpty)
                          ? ListView(
                            children: [
                              const SizedBox(height: 150),
                              Center(
                                child: Text(
                                  "No Hay Resultados",
                                  style: textTheme.bodyMedium?.copyWith(
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ),
                            ],
                          )
                          : ListView.builder(
                            padding: EdgeInsets.all(16),
                            itemCount: (pregestantesState.items as List).length,
                            itemBuilder: (context, index) {
                              final pregestante =
                                  (pregestantesState.items as List)[index];
                              return _PregestantesCard(
                                name: pregestante.nombre,
                                ci: pregestante.ci,
                                telefono: pregestante.telefono,
                                grupo: pregestante.grupoRiesgo,
                                controlada:
                                    pregestante.isController ? "Si" : "No",
                              );
                            },
                          ),
                  onRefresh: () async {
                    await pregestantesViewModel.getAll();
                  },
                ),
      ),
    );
  }
}

class _PregestantesCard extends StatelessWidget {
  final String name;
  final String ci;
  final String telefono;
  final String grupo;
  final String controlada;

  const _PregestantesCard({
    required this.name,
    required this.ci,
    required this.telefono,
    required this.grupo,
    required this.controlada,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Card(
      elevation: 3,
      color: colorScheme.surface,
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
              Text(
                "Controlada: $controlada",
                style: textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

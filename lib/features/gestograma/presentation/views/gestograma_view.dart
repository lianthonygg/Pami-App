import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pami_app/core/widgets/dynamic_drawer.dart';
import 'package:pami_app/features/gestograma/presentation/viewmodels/gestantes_viewmodel.dart';
import 'package:pami_app/features/gestograma/presentation/views/widgets/gestante_card.dart';

class GestogramaView extends ConsumerWidget {
  const GestogramaView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gestantesState = ref.watch(gestantesViewModelProvider);
    final gestantesViewModel = ref.read(gestantesViewModelProvider.notifier);
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (gestantesState.items == null) {
        gestantesViewModel.getAll();
      }
    });

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text("MINSAP App"),
        centerTitle: true,
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        elevation: 0,
      ),
      backgroundColor: colorScheme.surfaceContainerHighest,
      drawer: const DynamicDrawer(),
      body: SafeArea(
        child:
            gestantesState.isLoading
                ? const Center(child: CircularProgressIndicator())
                : gestantesState.error != null
                ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      gestantesState.error!,
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
                      gestantesState.items == null ||
                              (gestantesState.items is List &&
                                  (gestantesState.items as List).isEmpty)
                          ? ListView(
                            children: [
                              const SizedBox(height: 150),
                              Center(
                                child: Text(
                                  "No hay gestantes registradas",
                                  style: textTheme.bodyMedium?.copyWith(
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ),
                            ],
                          )
                          : ListView.builder(
                            padding: const EdgeInsets.all(16),
                            itemCount: (gestantesState.items as List).length,
                            itemBuilder: (context, index) {
                              final personas = gestantesState.items as List;

                              if (index == 0) {
                                return Container(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      bottom: 12.0,
                                    ),
                                    child: Text(
                                      "Total: ${(personas.length + 1)}",
                                      style: textTheme.titleMedium?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: colorScheme.primary,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                );
                              }

                              final persona = personas[index];
                              return GestanteCard(item: persona, onTap: () {});
                            },
                          ),

                  onRefresh: () async => await gestantesViewModel.getAll(),
                ),
      ),
    );
  }
}

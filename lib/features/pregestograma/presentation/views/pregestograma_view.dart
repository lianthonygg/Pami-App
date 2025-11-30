import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pami_app/core/widgets/dynamic_drawer.dart';
import 'package:pami_app/core/widgets/user_button.dart';
import 'package:pami_app/features/common/presentation/widgets/sticky_header_delegate.dart';
import 'package:pami_app/features/pregestograma/presentation/viewmodels/pregestantes_viewmodel.dart';
import 'package:pami_app/features/pregestograma/presentation/views/widgets/pregestante_card.dart';

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
        actions: [UserButton()],
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
                          : LayoutBuilder(
                            builder: (context, constraints) {
                              return CustomScrollView(
                                physics: AlwaysScrollableScrollPhysics(),
                                slivers: [
                                  SliverPersistentHeader(
                                    pinned: true,
                                    delegate: StickyHeaderDelegate(
                                      child: Container(
                                        color:
                                            Theme.of(
                                              context,
                                            ).scaffoldBackgroundColor,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 16,
                                          vertical: 12,
                                        ),
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          "Total: ${(pregestantesState.items as List).length}",
                                          style: textTheme.titleMedium
                                              ?.copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: colorScheme.primary,
                                                fontSize: 18,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SliverPadding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                    sliver: SliverList(
                                      delegate: SliverChildBuilderDelegate((
                                        context,
                                        index,
                                      ) {
                                        final pregestante =
                                            (pregestantesState.items
                                                as List)[index];
                                        return PregestantesCard(
                                          name: pregestante.nombre,
                                          ci: pregestante.ci,
                                          telefono: pregestante.telefono,
                                          grupo: pregestante.grupoRiesgo,
                                          controlada:
                                              pregestante.isController
                                                  ? "Si"
                                                  : "No",
                                        );
                                      }),
                                    ),
                                  ),
                                ],
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

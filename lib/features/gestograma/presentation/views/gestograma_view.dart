import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pami_app/core/widgets/dynamic_drawer.dart';
import 'package:pami_app/core/widgets/user_button.dart';
import 'package:pami_app/features/common/presentation/widgets/sticky_header_delegate.dart';
import 'package:pami_app/features/gestograma/presentation/viewmodels/gestantes_viewmodel.dart';
import 'package:pami_app/features/gestograma/presentation/views/widgets/gestante_card.dart';
import 'package:pami_app/routing/routes.dart';

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
        title: Text("Gestograma"),
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
                  onRefresh: () async => await gestantesViewModel.getAll(),
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
                          : LayoutBuilder(
                            builder: (context, constraints) {
                              return CustomScrollView(
                                physics: const AlwaysScrollableScrollPhysics(),
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
                                          "Total: ${(gestantesState.items as List).length}",
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
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                    sliver: SliverList(
                                      delegate: SliverChildBuilderDelegate(
                                        (context, index) {
                                          final persona =
                                              (gestantesState.items
                                                  as List)[index];
                                          return GestanteCard(
                                            onTap: () {
                                              context.push(
                                                Routes.detalleGestante
                                                    .replaceFirst(
                                                      ':ci',
                                                      persona.ci,
                                                    ),
                                              );
                                            },
                                            item: persona,
                                          );
                                        },
                                        childCount:
                                            (gestantesState.items as List)
                                                .length,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                ),
      ),
    );
  }
}

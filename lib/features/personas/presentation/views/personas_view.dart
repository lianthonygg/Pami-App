import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pami_app/core/network/connectivity_service.dart';
import 'package:pami_app/core/widgets/dynamic_drawer.dart';
import 'package:pami_app/core/widgets/user_button.dart';
import 'package:pami_app/features/auth/presentation/viewmodels/auth_notifier.dart';
import 'package:pami_app/features/common/data/local/app_database.dart';
import 'package:pami_app/features/common/presentation/widgets/sticky_header_delegate.dart';
import 'package:pami_app/features/personas/presentation/viewmodels/personas_viewmodel.dart';
import 'package:pami_app/features/personas/presentation/views/widgets/persona_card.dart';
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
        actions: [UserButton()],
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
                                          "Total: ${(personasState.items as List).length}",
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
                                      delegate: SliverChildBuilderDelegate(
                                        (context, index) {
                                          final personas =
                                              personasState.items
                                                  as List<PersonasEntity>;

                                          final persona = personas[index];
                                          return PersonaCard(
                                            onTap: () {
                                              context.push(
                                                Routes.detallePersona
                                                    .replaceFirst(
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
                                        childCount:
                                            (personasState.items as List)
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
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final auth = ref.watch(authProvider);

          final isLoggedIn = auth.asData?.value.accessToken != null;
          final ctx = context;
          if (await hasInternet() && isLoggedIn) {
            if (!context.mounted) return;

            if (context.mounted) {
              context.push(Routes.createPersona);
            }
          } else if (!isLoggedIn) {
            if (ctx.mounted) {
              showDialog(
                context: ctx,
                builder:
                    (context) => AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      title: const Text("Autenticación"),
                      content: const Text(
                        "Para realizar esta acción necesita estar autenticado.",
                        style: TextStyle(fontSize: 16),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Aceptar"),
                        ),
                      ],
                    ),
              );
            }
          } else {
            if (ctx.mounted) {
              showDialog(
                context: ctx,
                builder:
                    (context) => AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      title: const Text("Sin conexión"),
                      content: const Text(
                        "Para realizar esta acción necesita estar conectado a internet.",
                        style: TextStyle(fontSize: 16),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Aceptar"),
                        ),
                      ],
                    ),
              );
            }
          }
        },
        child: const Icon(Icons.person_add_alt),
      ),
    );
  }
}

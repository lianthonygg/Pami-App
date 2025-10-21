import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pami_app/core/widgets/dynamic_drawer.dart';
import 'package:pami_app/features/personas/presentation/viewmodels/personas_provider.dart';

final _ciProvider = StateProvider<String>((ref) => '');

class PersonasView extends ConsumerStatefulWidget {
  const PersonasView({super.key});

  @override
  ConsumerState<PersonasView> createState() => _PersonasViewState();
}

class _PersonasViewState extends ConsumerState<PersonasView> {
  late final TextEditingController ciController;

  @override
  void initState() {
    super.initState();
    ciController = TextEditingController(text: ref.read(_ciProvider));
  }

  @override
  void dispose() {
    ciController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final personasState = ref.watch(personasViewModelProvider);
    final personasViewModel = ref.watch(personasViewModelProvider.notifier);

    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      extendBody: true,
      drawer: const DynamicDrawer(),
      backgroundColor: colorScheme.surfaceContainerHighest,
      appBar: AppBar(
        title: const Text("MINSAP App"),
        centerTitle: true,
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Buscar Persona por CI",
                style: textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                "Introduce el número del carnet de identidad para consultar los datos de la persona.",
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),

              // Tarjeta de búsqueda
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: colorScheme.surface,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: colorScheme.shadow.withValues(alpha: 0.06),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    TextField(
                      controller: ciController,
                      decoration: InputDecoration(
                        labelText: "Carnet de Identidad",
                        prefixIcon: Icon(
                          Icons.badge_outlined,
                          color: colorScheme.onSurfaceVariant,
                        ),
                        filled: true,
                        fillColor: colorScheme.surfaceContainerHighest,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide(
                            color: colorScheme.primary,
                            width: 1.5,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(11),
                      ],
                      onChanged:
                          (v) => ref.read(_ciProvider.notifier).state = v,
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton.icon(
                        icon:
                            personasState.isLoading
                                ? const SizedBox(
                                  width: 18,
                                  height: 18,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                )
                                : const Icon(Icons.search),
                        label: Text(
                          personasState.isLoading ? "Buscando..." : "Buscar",
                          style: textTheme.labelLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colorScheme.onPrimary,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colorScheme.primary,
                          foregroundColor: colorScheme.onPrimary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          elevation: 3,
                        ),
                        onPressed:
                            personasState.isLoading
                                ? null
                                : () async {
                                  final ci = ref.read(_ciProvider);
                                  await personasViewModel.getByCi(ci);
                                },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // Resultado
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child:
                    personasState.persona != null
                        ? _PersonaCard(
                          name: personasState.persona!.fullName,
                          ci: personasState.persona!.ci,
                          telefono: personasState.persona!.telefono,
                          grupo: personasState.persona!.grupoDispensarial,
                        )
                        : !personasState.isLoading
                        ? Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Center(
                            child: Text(
                              "No hay resultados",
                              style: textTheme.bodyMedium?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ),
                        )
                        : const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 🌟 Tarjeta elegante para mostrar la persona
class _PersonaCard extends StatelessWidget {
  final String name;
  final String ci;
  final String telefono;
  final String grupo;

  const _PersonaCard({
    required this.name,
    required this.ci,
    required this.telefono,
    required this.grupo,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Card(
      elevation: 4,
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
          onTap: () {},
        ),
      ),
    );
  }
}

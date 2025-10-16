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
  @override
  Widget build(BuildContext context) {
    final personasState = ref.watch(personasViewModelProvider);
    final personasViewModel = ref.watch(personasViewModelProvider.notifier);

    final ciController = TextEditingController(text: ref.read(_ciProvider));

    const primaryRed = Color(0xFFE53935);

    return Scaffold(
      extendBody: true,
      drawer: const DynamicDrawer(),
      backgroundColor: const Color(0xFFF8FAFB),
      appBar: AppBar(
        title: const Text("MINSAP App"),
        centerTitle: true,
        backgroundColor: primaryRed,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 🧭 Encabezado
              Text(
                "Buscar Persona por CI",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                "Introduce el número del carnet de identidad para consultar los datos de la persona.",
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),

              // 🧾 Tarjeta de búsqueda
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.06 * 255),
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
                        prefixIcon: const Icon(
                          Icons.badge_outlined,
                          color: Colors.grey,
                        ),
                        filled: true,
                        fillColor: const Color(0xFFF9FBFC),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: const BorderSide(color: primaryRed),
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
                                    color: Colors.white,
                                  ),
                                )
                                : const Icon(Icons.search, color: Colors.white),
                        label: Text(
                          personasState.isLoading ? "Buscando..." : "Buscar",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryRed,
                          foregroundColor: Colors.white,
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

              // 💬 Resultado
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
                        ? const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Center(
                            child: Text(
                              "No hay resultados",
                              style: TextStyle(color: Colors.grey),
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
    const primaryRed = Color(0xFFE53935);

    return Card(
      elevation: 4,
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: ListTile(
          leading: CircleAvatar(
            radius: 24,
            backgroundColor: primaryRed,
            child: const Icon(Icons.person, color: Colors.white),
          ),
          title: Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.black87,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("CI: $ci", style: const TextStyle(color: Colors.black54)),
              Text(
                "Teléfono: $telefono",
                style: const TextStyle(color: Colors.black54),
              ),
              Text(
                "Grupo: $grupo",
                style: const TextStyle(color: Colors.black54),
              ),
            ],
          ),
          trailing: const Icon(Icons.arrow_forward_ios, size: 18),
          onTap: () {},
        ),
      ),
    );
  }
}

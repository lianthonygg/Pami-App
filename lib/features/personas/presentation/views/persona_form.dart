import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pami_app/features/personas/data/model/create_persona_model.dart';
import 'package:pami_app/features/personas/presentation/providers/persona_form_provider.dart';
import 'package:pami_app/features/personas/presentation/providers/personas_provider.dart';
import 'package:pami_app/features/personas/presentation/viewmodels/personas_viewmodel.dart';

final _fullNameProvider = StateProvider<String>((ref) => '');
final _ciProvider = StateProvider<String>((ref) => '');
final _sexoProvider = StateProvider<String>((ref) => '');
final _razaProvider = StateProvider<String>((ref) => '');
final _direccionCIProvider = StateProvider<String>((ref) => '');
final _direccionViveProvider = StateProvider<String>((ref) => '');
final _phoneProvider = StateProvider<String>((ref) => '');
final _antPpProvider = StateProvider<String>((ref) => '');
final _nivelEscolarProvider = StateProvider<String>((ref) => '');
final _profesionProvider = StateProvider<String>((ref) => '');
final _grupoDispensarialProvider = StateProvider<String>((ref) => '');
final _observacionesProvider = StateProvider<String>((ref) => '');

class PersonaForm extends ConsumerStatefulWidget {
  const PersonaForm({super.key});

  @override
  ConsumerState<PersonaForm> createState() => _PersonaFormState();
}

class _PersonaFormState extends ConsumerState<PersonaForm> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final personasState = ref.watch(personasViewModelProvider);
    final personasViewModel = ref.watch(personasViewModelProvider.notifier);
    final circState = ref.watch(circunscripcionProvider);
    final cdrState = ref.watch(cdrProvider);

    ref.listen<PersonasState>(personasViewModelProvider, (previous, next) {
      if (previous?.isLoading == true &&
          next.isLoading == false &&
          next.error == null) {
        // Submit completado correctamente
        formKey.currentState?.reset(); // Resetea el formulario

        // Resetear todos los providers
        ref.read(_fullNameProvider.notifier).state = '';
        ref.read(_ciProvider.notifier).state = '';
        ref.read(_sexoProvider.notifier).state = '';
        ref.read(_razaProvider.notifier).state = '';
        ref.read(_direccionCIProvider.notifier).state = '';
        ref.read(_direccionViveProvider.notifier).state = '';
        ref.read(_phoneProvider.notifier).state = '';
        ref.read(_antPpProvider.notifier).state = '';
        ref.read(_nivelEscolarProvider.notifier).state = '';
        ref.read(_profesionProvider.notifier).state = '';
        ref.read(_grupoDispensarialProvider.notifier).state = '';
        ref.read(_observacionesProvider.notifier).state = '';

        // Volver a la pantalla anterior
        context.pop();
      }
    });

    ref.listenManual(
      circunscripcionProvider,
      (previous, next) {},
      fireImmediately: false,
    );

    if (circState.items.isEmpty && !circState.isLoading) {
      Future.microtask(() {
        ref.read(circunscripcionProvider.notifier).load();
      });
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: const Text('Agregar Persona'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: "Nombre Completo"),
                initialValue: ref.read(_fullNameProvider),
                keyboardType: TextInputType.name,
                textCapitalization: TextCapitalization.words,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Campo Requerido";
                  }
                  if (!RegExp(r'^[a-zA-ZáéíóúÁÉÍÓÚüÜñÑ\s]+$').hasMatch(value)) {
                    return 'Solo se permiten letras y espacios';
                  }
                  return null;
                },
                onChanged:
                    (v) =>
                        ref.read(_fullNameProvider.notifier).state = v.trim(),
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(labelText: "Carnet de Identidad"),
                initialValue: ref.read(_ciProvider),
                keyboardType: TextInputType.number,
                maxLength: 11,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo requerido';
                  }
                  if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                    return 'Solo se permiten números';
                  }
                  if (value.length != 11) {
                    return 'Debe tener exactamente 11 dígitos';
                  }
                  return null;
                },
                onChanged:
                    (v) => ref.read(_ciProvider.notifier).state = v.trim(),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: "Sexo"),
                value:
                    ref.watch(_sexoProvider).isEmpty
                        ? null
                        : ref.watch(_sexoProvider),
                items: const [
                  DropdownMenuItem(value: "M", child: Text("Masculino")),
                  DropdownMenuItem(value: "F", child: Text("Femenino")),
                ],
                onChanged:
                    (v) => ref.read(_sexoProvider.notifier).state = v ?? '',
                validator:
                    (v) => v == null || v.isEmpty ? 'Campo requerido' : null,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: "Raza"),
                value:
                    ref.watch(_razaProvider).isEmpty
                        ? null
                        : ref.watch(_razaProvider),
                items: const [
                  DropdownMenuItem(value: 'B', child: Text("Blanca")),
                  DropdownMenuItem(value: 'M', child: Text("Mestiza")),
                  DropdownMenuItem(value: 'N', child: Text("Negra")),
                ],
                onChanged:
                    (v) => ref.read(_razaProvider.notifier).state = v ?? '',
                validator:
                    (v) => v == null || v.isEmpty ? 'Campo requerido' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Dirección del Carnet de Identidad",
                ),
                initialValue: ref.read(_direccionCIProvider),
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Campo Requerido";
                  }
                  return null;
                },
                onChanged:
                    (v) =>
                        ref.read(_direccionCIProvider.notifier).state =
                            v.trim(),
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(labelText: "Dirección en que Vive"),
                initialValue: ref.read(_direccionViveProvider),
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Campo Requerido";
                  }
                  return null;
                },
                onChanged:
                    (v) =>
                        ref.read(_direccionViveProvider.notifier).state =
                            v.trim(),
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(labelText: "Teléfono"),
                initialValue: ref.read(_phoneProvider),
                keyboardType: TextInputType.phone,
                maxLength: 8,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo requerido';
                  }
                  if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                    return 'Solo se permiten números';
                  }
                  if (value.length != 8) {
                    return 'Debe tener exactamente 8 dígitos';
                  }
                  return null;
                },
                onChanged:
                    (v) => ref.read(_phoneProvider.notifier).state = v.trim(),
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Antecedentes Patológicos Personales",
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                ),
                initialValue: ref.read(_antPpProvider),
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.newline,
                minLines: 3,
                maxLines: null,
                onChanged:
                    (v) => ref.read(_antPpProvider.notifier).state = v.trim(),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Nivel escolar'),
                value:
                    ref.watch(_nivelEscolarProvider).isEmpty
                        ? null
                        : ref.watch(_nivelEscolarProvider),
                items: const [
                  DropdownMenuItem(value: 'Primario', child: Text('Primario')),
                  DropdownMenuItem(
                    value: 'Secundario',
                    child: Text('Secundario'),
                  ),
                  DropdownMenuItem(
                    value: 'Preuniversitario',
                    child: Text('Preuniversitario'),
                  ),
                  DropdownMenuItem(
                    value: 'Universitario',
                    child: Text('Universitario'),
                  ),
                ],
                onChanged:
                    (v) =>
                        ref.read(_nivelEscolarProvider.notifier).state =
                            v ?? '',
                validator:
                    (v) => v == null || v.isEmpty ? 'Campo requerido' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(labelText: "Profesión"),
                initialValue: ref.read(_profesionProvider),
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Campo Requerido";
                  }
                  return null;
                },
                onChanged:
                    (v) =>
                        ref.read(_profesionProvider.notifier).state = v.trim(),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Grupo Dispensarial',
                ),
                value:
                    ref.watch(_grupoDispensarialProvider).isEmpty
                        ? null
                        : ref.watch(_grupoDispensarialProvider),
                items: const [
                  DropdownMenuItem(value: 'Grupo 1', child: Text('Grupo 1')),
                  DropdownMenuItem(value: 'Grupo 2', child: Text('Grupo 2')),
                  DropdownMenuItem(value: 'Grupo 3', child: Text('Grupo 3')),
                  DropdownMenuItem(value: 'Grupo 4', child: Text('Grupo 4')),
                ],
                onChanged:
                    (v) =>
                        ref.read(_grupoDispensarialProvider.notifier).state =
                            v ?? '',
                validator:
                    (v) => v == null || v.isEmpty ? 'Campo requerido' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Observaciones",
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                ),
                initialValue: ref.read(_observacionesProvider),
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.newline,
                minLines: 3,
                maxLines: null,
                onChanged:
                    (v) =>
                        ref.read(_observacionesProvider.notifier).state =
                            v.trim(),
              ),
              const SizedBox(height: 16),

              DropdownButtonFormField<String>(
                value: circState.selected?.id,
                decoration: const InputDecoration(labelText: "Circunscripción"),
                items:
                    circState.items
                        .map(
                          (c) => DropdownMenuItem(
                            value: c.id,
                            child: Text(c.nombre),
                          ),
                        )
                        .toList(),
                onChanged: (id) {
                  if (id != null) {
                    final selected = circState.items.firstWhere(
                      (c) => c.id == id,
                    );
                    ref.read(circunscripcionProvider.notifier).select(selected);
                    // cargar los CDR dependientes
                    ref.read(cdrProvider.notifier).load(id);
                  }
                },
                validator: (value) => value == null ? "Campo Requerido" : null,
              ),

              const SizedBox(height: 16),

              // --- CDR (dependiente de circunscripción) ---
              DropdownButtonFormField<String>(
                value: cdrState.selected?.id,
                decoration: const InputDecoration(labelText: "CDR"),
                items:
                    cdrState.items
                        .map(
                          (c) => DropdownMenuItem(
                            value: c.id,
                            child: Text(c.nombre),
                          ),
                        )
                        .toList(),
                onChanged: (id) {
                  if (id != null) {
                    final selected = cdrState.items.firstWhere(
                      (c) => c.id == id,
                    );
                    ref.read(cdrProvider.notifier).select(selected);
                  }
                },
                validator: (value) => value == null ? "Campo Requerido" : null,
              ),

              const SizedBox(height: 32),
              ElevatedButton.icon(
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
                        : const Icon(Icons.save),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    final cdrSeleccionado = ref.read(cdrProvider).selected;

                    if (cdrSeleccionado == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Debe seleccionar un CDR'),
                        ),
                      );
                      return;
                    }
                    final data = CreatePersonaRequest(
                      fullName: ref.read(_fullNameProvider),
                      ci: ref.read(_ciProvider),
                      sexo: ref.read(_sexoProvider),
                      raza: ref.read(_razaProvider),
                      direccionDelCI: ref.read(_direccionCIProvider),
                      direccionEnQueVive: ref.read(_direccionViveProvider),
                      telefono: ref.read(_phoneProvider),
                      antPP: ref.read(_antPpProvider),
                      nivelEscolar: ref.read(_nivelEscolarProvider),
                      profesion: ref.read(_profesionProvider),
                      grupoDispensarial: ref.read(_grupoDispensarialProvider),
                      observaciones: ref.read(_observacionesProvider),
                      cdrId: cdrSeleccionado.id,
                    );
                    debugPrint('Datos del formulario: $data');
                    personasViewModel.createPerson(data);
                  }
                },
                label:
                    personasState.isLoading
                        ? const Text('Guardando...')
                        : const Text('Guardar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

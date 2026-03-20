import 'package:flutter/material.dart';

class SemanasDiasField extends StatefulWidget {
  final void Function(int sem, int dias) onChanged;

  const SemanasDiasField({super.key, required this.onChanged});

  @override
  State<SemanasDiasField> createState() => _SemanasDiasFieldState();
}

class _SemanasDiasFieldState extends State<SemanasDiasField> {
  final semanasCtrl = TextEditingController();
  final diasCtrl = TextEditingController();

  void _notifyChanges() {
    final sem = int.tryParse(semanasCtrl.text) ?? 0;
    final dias = int.tryParse(diasCtrl.text) ?? 0;

    widget.onChanged(sem, dias); // << aquí llamas tu provider o tu función
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Campo Semanas
        Expanded(
          child: TextField(
            controller: semanasCtrl,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: "Semanas"),
            onChanged: (_) => _notifyChanges(),
          ),
        ),
        const SizedBox(width: 12),

        // Campo Días
        Expanded(
          child: TextField(
            controller: diasCtrl,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: "Días"),
            onChanged: (_) => _notifyChanges(),
          ),
        ),

        const SizedBox(width: 8),
        const Text("sem"),
      ],
    );
  }
}

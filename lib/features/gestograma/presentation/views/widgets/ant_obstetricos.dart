import 'package:flutter/material.dart';

class ObstetricosFields extends StatefulWidget {
  final void Function({
    required int gestaciones,
    required int partos,
    required int abortos,
    required int cesareas,
  })
  onChanged;

  const ObstetricosFields({super.key, required this.onChanged});

  @override
  State<ObstetricosFields> createState() => _ObstetricosFieldsState();
}

class _ObstetricosFieldsState extends State<ObstetricosFields> {
  final gestacionesCtrl = TextEditingController();
  final partosCtrl = TextEditingController();
  final abortosCtrl = TextEditingController();
  final cesareasCtrl = TextEditingController();

  void notifyParent() {
    widget.onChanged(
      gestaciones: int.tryParse(gestacionesCtrl.text) ?? 0,
      partos: int.tryParse(partosCtrl.text) ?? 0,
      abortos: int.tryParse(abortosCtrl.text) ?? 0,
      cesareas: int.tryParse(cesareasCtrl.text) ?? 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildNumberField("Gestaciones", gestacionesCtrl),
        _buildNumberField("Partos", partosCtrl),
        _buildNumberField("Abortos", abortosCtrl),
        _buildNumberField("Cesáreas", cesareasCtrl),
      ],
    );
  }

  Widget _buildNumberField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        onChanged: (_) => notifyParent(),
      ),
    );
  }

  @override
  void dispose() {
    gestacionesCtrl.dispose();
    partosCtrl.dispose();
    abortosCtrl.dispose();
    cesareasCtrl.dispose();
    super.dispose();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DropdownFormFieldCustom<T> extends ConsumerWidget {
  final String label;
  final IconData icon;
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final void Function(T?)? onChanged;
  final String? Function(T?)? validator;

  const DropdownFormFieldCustom({
    super.key,
    required this.label,
    required this.icon,
    required this.items,
    this.value,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DropdownButtonFormField<T>(
      decoration: InputDecoration(labelText: label, prefixIcon: Icon(icon)),
      value: value,
      items: items,
      onChanged: onChanged,
      validator: validator,
    );
  }
}

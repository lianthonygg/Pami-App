import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TextFormFieldCustom extends ConsumerWidget {
  final String label;
  final IconData icon;
  final String? initialValue;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final bool multiline;
  final int? maxLength;
  final TextCapitalization capitalization;

  const TextFormFieldCustom({
    super.key,
    required this.label,
    required this.icon,
    this.initialValue,
    this.validator,
    this.onChanged,
    this.keyboardType,
    this.multiline = false,
    this.maxLength,
    this.capitalization = TextCapitalization.none,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFormField(
      decoration: InputDecoration(labelText: label, prefixIcon: Icon(icon)),
      initialValue: initialValue,
      keyboardType: keyboardType,
      textCapitalization: capitalization,
      textInputAction:
          multiline ? TextInputAction.newline : TextInputAction.next,
      minLines: multiline ? 3 : 1,
      maxLines: multiline ? null : 1,
      maxLength: maxLength,
      validator: validator,
      onChanged: onChanged,
    );
  }
}

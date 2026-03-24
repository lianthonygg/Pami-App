import 'package:flutter/material.dart';

class QuickActions extends StatelessWidget {
  final ColorScheme colorScheme;
  const QuickActions({required super.key, required this.colorScheme});

  @override
  Widget build(BuildContext context) {
    final actions = [
      (
        icon: Icons.person_add_outlined,
        label: "Nuevo\npaciente",
        color: const Color(0xFF1565C0),
      ),
      (
        icon: Icons.search_outlined,
        label: "Buscar\npaciente",
        color: const Color(0xFF00695C),
      ),
      (
        icon: Icons.sync_outlined,
        label: "Sincronizar\ndatos",
        color: const Color(0xFFE65100),
      ),
      (
        icon: Icons.bar_chart_outlined,
        label: "Ver\nreportes",
        color: const Color(0xFF6A1B9A),
      ),
    ];

    return Row(
      children:
          actions
              .map(
                (a) => Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        decoration: BoxDecoration(
                          color: colorScheme.surface,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: colorScheme.outlineVariant,
                            width: 0.5,
                          ),
                        ),
                        child: Column(
                          children: [
                            Icon(a.icon, color: a.color, size: 24),
                            const SizedBox(height: 6),
                            Text(
                              a.label,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 11,
                                color: colorScheme.onSurfaceVariant,
                                height: 1.3,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
    );
  }
}

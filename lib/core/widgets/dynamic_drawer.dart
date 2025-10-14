import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pami_app/routing/routes.dart';
//import 'package:pami_app/routing/routes.dart';

class DynamicDrawer extends ConsumerWidget {
  const DynamicDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPath = GoRouterState.of(context).uri.toString();
    final grouped = <String, List<Map<String, dynamic>>>{};
    final ungrouped = <Map<String, dynamic>>[];

    for (final route in accesibleRoutes) {
      final section = route['section'];
      if (section == null) {
        ungrouped.add(route);
      } else {
        grouped.putIfAbsent(section, () => []).add(route);
      }
    }

    final sectionOrder = <String>[];
    for (final route in accesibleRoutes) {
      final section = route['section'];
      if (section != null && !sectionOrder.contains(section)) {
        sectionOrder.add(section);
      }
    }

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Li Anthony"),
            accountEmail: Text("lianthony@minsap.cu"),
          ),
          for (final route in accesibleRoutes)
            if (route['section'] == null)
              _DrawerItem(
                route: route,
                currentPath: currentPath,
                context: context,
              ),
          for (final section in sectionOrder) ...[
            const Divider(thickness: 1, height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              child: Text(
                section,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  fontSize: 13,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            for (final item in grouped[section]!)
              _DrawerItem(
                route: item,
                currentPath: currentPath,
                context: context,
              ),
          ],
          const Divider(thickness: 1, height: 32),
        ],
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final Map<String, dynamic> route;
  final String currentPath;
  final BuildContext context;

  const _DrawerItem({
    required this.route,
    required this.currentPath,
    required this.context,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = currentPath == route['path'];

    return ListTile(
      leading: Icon(
        route['icon'],
        color: isSelected ? Theme.of(context).colorScheme.primary : null,
      ),
      title: Text(
        route['title'],
        style: TextStyle(
          color: isSelected ? Theme.of(context).colorScheme.primary : null,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      selected: isSelected,
      selectedTileColor: Theme.of(context).colorScheme.primary.withAlpha(25),
      onTap: () {
        Navigator.pop(context);
        if (!isSelected) context.go(route['path']);
      },
    );
  }
}

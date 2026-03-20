import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pami_app/core/network/connectivity_service.dart';
import 'package:pami_app/core/services/auth_service.dart';
import 'package:pami_app/routing/routes.dart';
import 'package:workmanager/workmanager.dart';
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
          ManualSyncTile(),
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

class ManualSyncTile extends StatefulWidget {
  const ManualSyncTile({super.key});

  @override
  State<ManualSyncTile> createState() => _ManualSyncTileState();
}

class _ManualSyncTileState extends State<ManualSyncTile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isSyncing = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _startSync() async {
    final loggedIn = await AuthService.isLoggedIn();
    final ctx = context;
    //if (loggedIn) {
    if (!mounted) return;
    setState(() {
      _isSyncing = true;
      _controller.repeat();
    });

    await Workmanager().registerOneOffTask(
      "manual_sync",
      "syncBaseTables",
      //constraints: Constraints(networkType: NetworkType.connected),
    );

    if (mounted) {
      setState(() {
        _isSyncing = false;
        _controller.stop();
      });
    }
    // } else if (!loggedIn) {
    //   if (ctx.mounted) {
    //     showDialog(
    //       context: ctx,
    //       builder:
    //           (context) => AlertDialog(
    //             shape: RoundedRectangleBorder(
    //               borderRadius: BorderRadius.circular(16),
    //             ),
    //             title: const Text("Autenticación"),
    //             content: const Text(
    //               "Para realizar esta acción necesita estar autenticado.",
    //               style: TextStyle(fontSize: 16),
    //             ),
    //             actions: [
    //               TextButton(
    //                 onPressed: () => Navigator.pop(context),
    //                 child: const Text("Aceptar"),
    //               ),
    //             ],
    //           ),
    //     );
    //   }
    // } else {
    //   if (ctx.mounted) {
    //     showDialog(
    //       context: ctx,
    //       builder:
    //           (context) => AlertDialog(
    //             shape: RoundedRectangleBorder(
    //               borderRadius: BorderRadius.circular(16),
    //             ),
    //             title: const Text("Sin conexión"),
    //             content: const Text(
    //               "Para realizar esta acción necesita estar conectado a internet.",
    //               style: TextStyle(fontSize: 16),
    //             ),
    //             actions: [
    //               TextButton(
    //                 onPressed: () => Navigator.pop(context),
    //                 child: const Text("Aceptar"),
    //               ),
    //             ],
    //           ),
    //     );
    //   }
    // }
  }

  @override
  Widget build(BuildContext context) {
    final colorSheme = Theme.of(context).colorScheme;
    return ListTile(
      leading: RotationTransition(
        turns: _controller,
        child: Icon(Icons.sync, color: _isSyncing ? colorSheme.primary : null),
      ),
      title: const Text('Sincronización Manual'),
      onTap: _isSyncing ? null : _startSync,
    );
  }
}

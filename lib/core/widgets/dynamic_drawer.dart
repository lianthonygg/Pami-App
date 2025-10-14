import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pami_app/routing/routes.dart';
//import 'package:pami_app/routing/routes.dart';

class DynamicDrawer extends ConsumerWidget {
  const DynamicDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Li Anthony"),
            accountEmail: Text("lianthony@minsap.cu"),
          ),
          for (final route in accesibleRoutes)
            ListTile(
              leading: Icon(route['icon']),
              title: Text(route['title']),
              onTap: () {
                Navigator.pop(context);
                context.go(route['path']);
              },
            ),
        ],
      ),
    );
  }
}

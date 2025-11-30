import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pami_app/features/auth/presentation/viewmodels/auth_notifier.dart';
import 'package:pami_app/routing/routes.dart';

class UserButton extends StatelessWidget {
  const UserButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final auth = ref.watch(authProvider);

        final isLoggedIn = auth.asData?.value.accessToken != null;

        return IconButton(
          icon: const Icon(Icons.person),
          onPressed:
              auth.isLoading
                  ? null
                  : () async {
                    final result = await showMenu<String>(
                      context: context,
                      position: const RelativeRect.fromLTRB(1000, 80, 16, 0),
                      items: <PopupMenuEntry<String>>[
                        if (!isLoggedIn)
                          PopupMenuItem<String>(
                            value: 'login',
                            child: const Text('Iniciar sesión'),
                            onTap: () {
                              if (!context.mounted) return;
                              context.push(Routes.login);
                            },
                          ),
                        if (isLoggedIn) ...[
                          const PopupMenuItem<String>(
                            enabled: false,
                            value: 'user',
                            child: Text('Usuario autenticado'),
                          ),
                          const PopupMenuDivider(),
                          PopupMenuItem<String>(
                            value: 'logout',
                            child: Text('Cerrar sesión'),
                            onTap: () {
                              ref.read(authProvider.notifier).logout();
                            },
                          ),
                        ],
                      ],
                    );

                    if (result == Routes.login && context.mounted) {}
                  },
        );
      },
    );
  }
}

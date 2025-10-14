import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:pami_app/features/auth/presentation/viewmodels/auth_providers.dart';
import 'package:pami_app/routing/routes.dart';
import 'package:go_router/go_router.dart';

class LoginView extends ConsumerWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authViewModelProvider);
    final authViewModel = ref.watch(authViewModelProvider.notifier);

    ref.listen(authViewModelProvider, (previous, next) {
      if (previous?.isLoading == true && next.isLoading == false) {
        if (next.error != null) {
          MotionToast.error(
            title: const Text("Error"),
            description: Text(authState.error!),
            animationType: AnimationType.slideInFromBottom,
          ).show(context);
        } else if (next.user?.accessToken != null) {
          MotionToast.success(
            title: const Text("Éxito"),
            description: const Text("Inicio de sesión exitoso 🎉"),
          ).show(context);

          Future.delayed(const Duration(milliseconds: 500), () {
            if (context.mounted) {
              context.go(Routes.home);
            }
          });
        }
      }
    });

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Card(
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.lock_outline,
                    size: 64,
                    color: Colors.blueAccent,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Inicia Sesión",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person_outline),
                      label: Text("Nombre de Usuario"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(RegExp(r'\s')),
                    ],
                    onChanged:
                        (v) => ref.read(_nicknameProvider.notifier).state = v,
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_outline),
                      label: Text("Contraseña"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(RegExp(r'\s')),
                    ],
                    onChanged:
                        (v) => ref.read(_passwordProvider.notifier).state = v,
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 3,
                      ),
                      onPressed:
                          authState.isLoading
                              ? null
                              : () async {
                                final nickname = ref.read(_nicknameProvider);
                                final password = ref.read(_passwordProvider);
                                await authViewModel.login(nickname, password);
                              },
                      child:
                          authState.isLoading
                              ? const SizedBox(
                                width: 22,
                                height: 22,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                              : const Text(
                                'Iniciar sesión',
                                style: TextStyle(fontSize: 16),
                              ),
                    ),
                  ),
                  // if (authState.error != null)
                  //   Padding(
                  //     padding: const EdgeInsets.only(top: 12),
                  //     child: Text(
                  //       authState.error!,
                  //       style: const TextStyle(color: Colors.red),
                  //     ),
                  //   ),
                  // if (authState.user?.accessToken != null)
                  //   MotionToast.success(
                  //     title: const Text("Éxito"),
                  //     description: const Text("Inicio de sesión exitoso 🎉"),
                  //     animationType: AnimationType.slideInFromBottom,
                  //     position: MotionToastPosition.bottom,
                  //   ).show(context);
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

final _nicknameProvider = StateProvider<String>((ref) => '');
final _passwordProvider = StateProvider<String>((ref) => '');

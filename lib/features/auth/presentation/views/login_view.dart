import 'dart:ui';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pami_app/core/theme/theme.dart';
import 'package:go_router/go_router.dart';
import 'package:pami_app/features/auth/presentation/viewmodels/auth_viewmodel.dart';
import 'package:pami_app/routing/routes.dart';

class LoginView extends ConsumerWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authViewModelProvider);
    final authViewModel = ref.watch(authViewModelProvider.notifier);

    ref.listen(authViewModelProvider, (previous, next) {
      if (previous?.isLoading == true && next.isLoading == false) {
        if (next.user?.accessToken != null && next.error == null) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (context.mounted) {
              context.go(Routes.home);
            }
          });
        }
      }
    });

    // Set status bar to transparent with appropriate icon brightness
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness:
            Theme.of(context).brightness == Brightness.dark
                ? Brightness.light
                : Brightness.dark,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );

    // Ensure edge-to-edge rendering
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          gradient:
              Theme.of(context).brightness == Brightness.dark
                  ? AppTheme.darkBackgroundGradient
                  : AppTheme.lightBackgroundGradient,
        ),

        child: SafeArea(
          bottom: false,
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 16.0,
              ),
              child: FadeInUp(
                duration: const Duration(milliseconds: 600),
                child: _buildLoginCard(context, authState, authViewModel),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginCard(
    BuildContext context,
    AuthState authState,
    AuthViewModel authViewModel,
  ) {
    final defaultShadowColor =
        Theme.of(context).elevatedButtonTheme.style?.shadowColor
            ?.resolve(<WidgetState>{})
            ?.withValues(alpha: 0.1) ??
        Colors.black.withValues(alpha: 0.1);

    final borderColor =
        (Theme.of(context).cardTheme.shape as RoundedRectangleBorder?)
            ?.side
            .color ??
        Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.3);

    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardTheme.color,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: defaultShadowColor,
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
            border: Border.all(color: borderColor),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
              child: Container(
                padding: const EdgeInsets.all(32.0),
                constraints: const BoxConstraints(maxWidth: 400),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.asset(
                        'assets/logo.png',
                        height: 100,
                        errorBuilder:
                            (context, error, stackTrace) => Text(
                              'PAMI App',
                              style: Theme.of(
                                context,
                              ).textTheme.headlineMedium?.copyWith(
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      "Inicia Sesión",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 16),
                    FadeIn(
                      duration: const Duration(milliseconds: 300),
                      child:
                          authState.error == null
                              ? const SizedBox.shrink()
                              : ShakeX(
                                duration: const Duration(milliseconds: 600),
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  margin: const EdgeInsets.only(bottom: 16),
                                  decoration: BoxDecoration(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.error.withValues(alpha: 0.2),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color:
                                          Theme.of(context).colorScheme.error,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.error_outline,
                                        color: Colors.redAccent,
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          authState.error ?? "Error Inesperado",
                                          style: Theme.of(
                                            context,
                                          ).textTheme.bodyMedium?.copyWith(
                                            color:
                                                Theme.of(
                                                  context,
                                                ).colorScheme.error,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.person_outline,
                          color:
                              Theme.of(
                                context,
                              ).inputDecorationTheme.labelStyle?.color,
                        ),
                        labelText: "Nombre de Usuario",
                        border: Theme.of(context).inputDecorationTheme.border,
                        focusedBorder:
                            Theme.of(
                              context,
                            ).inputDecorationTheme.focusedBorder,
                        filled: true,
                        fillColor:
                            Theme.of(context).inputDecorationTheme.fillColor,
                        labelStyle:
                            Theme.of(context).inputDecorationTheme.labelStyle,
                      ),
                      style: Theme.of(context).textTheme.bodyMedium,
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(RegExp(r'\s')),
                      ],
                      onChanged: (v) {
                        ref.read(loginFormProvider.notifier).setNickname(v);
                      },
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color:
                              Theme.of(
                                context,
                              ).inputDecorationTheme.labelStyle?.color,
                        ),
                        labelText: "Contraseña",
                        border: Theme.of(context).inputDecorationTheme.border,
                        focusedBorder:
                            Theme.of(
                              context,
                            ).inputDecorationTheme.focusedBorder,
                        filled: true,
                        fillColor:
                            Theme.of(context).inputDecorationTheme.fillColor,
                        labelStyle:
                            Theme.of(context).inputDecorationTheme.labelStyle,
                      ),
                      style: Theme.of(context).textTheme.bodyMedium,
                      obscureText: true,
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(RegExp(r'\s')),
                      ],
                      onChanged: (v) {
                        ref.read(loginFormProvider.notifier).setPassword(v);
                      },
                    ),
                    const SizedBox(height: 24),
                    ZoomIn(
                      duration: const Duration(milliseconds: 400),
                      child: SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          style: Theme.of(context).elevatedButtonTheme.style,
                          onPressed:
                              authState.isLoading
                                  ? null
                                  : () async {
                                    final form = ref.read(loginFormProvider);
                                    await authViewModel.login(
                                      form.nickname,
                                      form.password,
                                    );
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
                                  : Text(
                                    'Iniciar sesión',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyMedium?.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color:
                                          Theme.of(
                                            context,
                                          ).colorScheme.onPrimary,
                                    ),
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

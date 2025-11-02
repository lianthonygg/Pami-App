import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pami_app/features/auth/presentation/viewmodels/auth_notifier.dart';
import 'package:pami_app/features/auth/presentation/views/login_view.dart';
import 'package:pami_app/features/gestograma/presentation/views/gestograma_view.dart';
import 'package:pami_app/features/home/presentation/views/home_view.dart';
import 'package:pami_app/features/personas/presentation/views/persona_detalle.dart';
import 'package:pami_app/features/personas/presentation/views/persona_form.dart';
import 'package:pami_app/features/personas/presentation/views/personas_view.dart';
import 'package:pami_app/features/posgestograma/presentation/views/posgestograma_view.dart';
import 'package:pami_app/features/pregestograma/presentation/views/pregestograma_view.dart';
import 'package:pami_app/routing/routes.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

GoRouter router() => GoRouter(
  initialLocation: Routes.login,
  navigatorKey: navigatorKey,
  redirect: (BuildContext context, GoRouterState state) async {
    final ref = ProviderScope.containerOf(context);

    var authState = ref.read(authNotifierProvider);

    if (authState.isLoading) {
      final completer = Completer<String?>();

      late final ProviderSubscription<AuthNotifierState> subscription;
      subscription = ref.listen(authNotifierProvider, (prev, next) {
        if (!next.isLoading) {
          final redirectPath = _getRedirectPath(state, next.isLoggedIn);
          completer.complete(redirectPath);
          subscription.close();
        }
      });

      return completer.future;
    }

    return _getRedirectPath(state, authState.isLoggedIn);
  },
  routes: [
    GoRoute(
      path: Routes.home,
      builder: (context, state) {
        return HomeView();
      },
    ),
    GoRoute(
      path: Routes.personas,
      builder: (context, state) {
        return PersonasView();
      },
    ),
    GoRoute(
      path: Routes.detallePersona,
      builder: (context, state) {
        final ci = state.pathParameters['ci']!;
        return PersonaDetalle(ci: ci);
      },
    ),
    GoRoute(
      path: Routes.createPersona,
      builder: (context, state) {
        return PersonaForm();
      },
    ),
    GoRoute(
      path: Routes.login,
      builder: (context, state) {
        return LoginView();
      },
    ),
    GoRoute(
      path: Routes.pregestograma,
      builder: (context, state) {
        return PregestogramaView();
      },
    ),
    GoRoute(
      path: Routes.gestograma,
      builder: (context, state) {
        return GestogramaView();
      },
    ),
    GoRoute(
      path: Routes.posgestograma,
      builder: (context, state) {
        return PosgestogramaView();
      },
    ),
  ],
);

String? _getRedirectPath(GoRouterState state, bool isLoggedIn) {
  final isGoingToLogin = state.matchedLocation == Routes.login;

  if (isGoingToLogin && isLoggedIn) {
    return Routes.home;
  } else if (!isGoingToLogin && !isLoggedIn) {
    return Routes.login;
  }

  return null;
}

import 'package:go_router/go_router.dart';
import 'package:pami_app/features/auth/presentation/views/login_view.dart';
import 'package:pami_app/features/gestograma/presentation/views/gestograma_view.dart';
import 'package:pami_app/features/home/presentation/views/home_view.dart';
import 'package:pami_app/features/personas/presentation/views/personas_view.dart';
import 'package:pami_app/features/posgestograma/presentation/views/posgestograma_view.dart';
import 'package:pami_app/features/pregestograma/presentation/views/pregestograma_view.dart';
import 'package:pami_app/routing/routes.dart';

GoRouter router() => GoRouter(
  initialLocation: Routes.login,
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

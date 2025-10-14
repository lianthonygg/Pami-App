import 'package:flutter/material.dart';

abstract final class Routes {
  static const home = "/";
  static const personas = "/personas";
  static const login = "/login";
}

final availableRoutes = {
  "home": {"title": "Home", "icon": Icons.home, "route": Routes.home},
  "users": {
    "title": "Personas",
    "icon": Icons.people,
    "route": Routes.personas,
  },
};
final List<Map<String, dynamic>> accesibleRoutes = [
  {'title': 'Inicio', 'icon': Icons.home, 'path': Routes.home},
  {'title': 'Personas', 'icon': Icons.person, 'path': Routes.personas},
];

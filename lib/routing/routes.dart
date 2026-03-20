import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

abstract final class Routes {
  static const home = "/";
  static const personas = "/personas";
  static const detallePersona = "/personas/detalle/:ci";
  static const createPersona = "/personas/create";
  static const pregestograma = "/pregestograma";
  static const gestograma = "/gestograma";
  static const detalleGestante = "/gestograma/detalle/:ci";
  static const createGestante = "/gestograma/create/:id";
  static const posgestograma = "/posgestograma";
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
  {
    'title': 'Pregestograma',
    'icon': LucideIcons.heartPulse,
    'path': Routes.pregestograma,
    'section': "PAMI",
  },
  {
    'title': 'Gestograma',
    'icon': LucideIcons.baby,
    'path': Routes.gestograma,
    'section': "PAMI",
  },
  {
    'title': 'Posgestograma',
    'icon': LucideIcons.stethoscope,
    'path': Routes.posgestograma,
    'section': "PAMI",
  },
  {'title': 'Pacientes', 'icon': Icons.person, 'path': Routes.personas},
];

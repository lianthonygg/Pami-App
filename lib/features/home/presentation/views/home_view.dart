import 'package:flutter/material.dart';
import 'package:pami_app/core/widgets/dynamic_drawer.dart';
import 'package:pami_app/core/widgets/user_button.dart';
import 'package:pami_app/features/home/presentation/views/widgets/header_banner.dart';
import 'package:pami_app/features/home/presentation/views/widgets/quick_actions.dart';
import 'package:pami_app/features/home/presentation/views/widgets/stat_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: colorScheme.surfaceContainerHighest,
      appBar: AppBar(
        title: Text("MINSAP App"),
        centerTitle: true,
        backgroundColor: colorScheme.primary,
        actions: [UserButton()],
      ),
      drawer: const DynamicDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header con degradado
            HeaderBanner(key: key, colorScheme: colorScheme),
            const SizedBox(height: 24),

            // Estadísticas
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Resumen del área",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 12),
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 1.5,
                    children: [
                      StatCard(
                        key: key,
                        label: "Pacientes",
                        value: "248",
                        icon: Icons.people_alt_outlined,
                        color: Color(0xFF1565C0),
                      ),
                      StatCard(
                        key: key,
                        label: "Gestantes",
                        value: "34",
                        icon: Icons.pregnant_woman_outlined,
                        color: Color(0xFF6A1B9A),
                      ),
                      StatCard(
                        key: key,
                        label: "Puérperas",
                        value: "12",
                        icon: Icons.child_care_outlined,
                        color: Color(0xFF00695C),
                      ),
                      StatCard(
                        key: key,
                        label: "Pendientes sync",
                        value: "5",
                        icon: Icons.sync_outlined,
                        color: Color(0xFFE65100),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Acciones rápidas
                  Text(
                    "Acciones rápidas",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 12),
                  QuickActions(key: key, colorScheme: colorScheme),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

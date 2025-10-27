import 'package:flutter/material.dart';
import 'package:pami_app/core/widgets/dynamic_drawer.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text("MINSAP App"),
        centerTitle: true,
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        elevation: 0,
      ),
      backgroundColor: colorScheme.surfaceContainerHigh,
      drawer: const DynamicDrawer(),
      body: Center(child: Text("HOME VIEW")),
    );
  }
}

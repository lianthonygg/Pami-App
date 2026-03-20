import 'package:flutter/material.dart';
import 'package:pami_app/core/widgets/dynamic_drawer.dart';
import 'package:pami_app/core/widgets/user_button.dart';

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
      body: Center(child: Text("HOME VIEW")),
    );
  }
}

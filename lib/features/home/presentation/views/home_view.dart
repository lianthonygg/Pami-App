import 'package:flutter/material.dart';
import 'package:pami_app/core/widgets/dynamic_drawer.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("MINSAP App")),
      drawer: const DynamicDrawer(),
      body: Center(child: Text("HOME VIEW")),
    );
  }
}

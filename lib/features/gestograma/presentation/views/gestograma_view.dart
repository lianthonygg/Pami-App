import 'package:flutter/material.dart';
import 'package:pami_app/core/widgets/dynamic_drawer.dart';

class GestogramaView extends StatelessWidget {
  const GestogramaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("MINSAP App")),
      drawer: const DynamicDrawer(),
      body: Center(child: Text("GESTOGRAMA VIEW")),
    );
  }
}

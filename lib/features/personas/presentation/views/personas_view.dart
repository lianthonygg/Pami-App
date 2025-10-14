import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pami_app/core/widgets/dynamic_drawer.dart';
//import 'package:pami_app/features/personas/presentation/viewmodels/personas_viewmodel.dart';

class PersonasView extends ConsumerWidget {
  const PersonasView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final state = ref.watch(personasViewModelProvider);

    return Scaffold(
      appBar: AppBar(title: Text("MINSAP App")),
      drawer: const DynamicDrawer(),
      body: Center(child: Text("PERSONS VIEW")),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pami_app/core/widgets/dynamic_drawer.dart';
import 'package:pami_app/core/widgets/user_button.dart';

class AdolescentesView extends ConsumerWidget {
  const AdolescentesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final puerperasState = ref.watch(puerperaViewModelProvider);
    // final puerperasViewModel = ref.read(puerperaViewModelProvider.notifier);
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   if (puerperasState.items == null) {
    //     puerperasViewModel.getAll();
    //   }
    // });

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text("Adolescentes"),
        centerTitle: true,
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        elevation: 0,
        actions: [UserButton()],
      ),
      backgroundColor: colorScheme.surfaceContainerHighest,
      drawer: const DynamicDrawer(),
      body: SafeArea(
        child:
        // puerperasState.isLoading
        //     ? const Center(child: CircularProgressIndicator())
        //     : puerperasState.error != null
        //     ? Center(
        //       child: Padding(
        //         padding: const EdgeInsets.all(16.0),
        //         child: Text(
        //           puerperasState.error!,
        //           style: textTheme.bodyMedium?.copyWith(
        //             color: colorScheme.error,
        //             fontWeight: FontWeight.bold,
        //           ),
        //           textAlign: TextAlign.center,
        //         ),
        //       ),
        //     )
        //     : RefreshIndicator(
        //       onRefresh: () async => await puerperasViewModel.getAll(),
        //       child:
        //           puerperasState.items == null ||
        //                   (puerperasState.items is List &&
        //                       (puerperasState.items as List).isEmpty)
        //               ?
        ListView(
          children: [
            const SizedBox(height: 150),
            Center(
              child: Text(
                "No hay adolescentes registrados",
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ],
        ),
        // : LayoutBuilder(
        //   builder: (context, constraints) {
        //     return CustomScrollView(
        //       physics: const AlwaysScrollableScrollPhysics(),
        //       slivers: [
        //         SliverPersistentHeader(
        //           pinned: true,
        //           delegate: StickyHeaderDelegate(
        //             child: Container(
        //               color:
        //                   Theme.of(
        //                     context,
        //                   ).scaffoldBackgroundColor,
        //               padding: const EdgeInsets.symmetric(
        //                 horizontal: 16,
        //                 vertical: 12,
        //               ),
        //               alignment: Alignment.centerRight,
        //               child: Text(
        //                 "Total: ${(puerperasState.items as List).length}",
        //                 style: textTheme.titleMedium
        //                     ?.copyWith(
        //                       fontWeight: FontWeight.bold,
        //                       color: colorScheme.primary,
        //                       fontSize: 18,
        //                     ),
        //               ),
        //             ),
        //           ),
        //         ),

        // SliverPadding(
        //   padding: const EdgeInsets.symmetric(
        //     horizontal: 16,
        //   ),
        //   sliver: SliverList(
        //     delegate: SliverChildBuilderDelegate(
        //       (context, index) {
        //         final persona =
        //             (puerperasState.items
        //                 as List)[index];
        //         return PuerperaCard(
        //           onTap: () {},
        //           item: persona,
        //         );
        //       },
        //       childCount:
        //           (puerperasState.items as List)
        //               .length,
        //     ),
        //   ),
        // ),
        //       ],
        //     );
        //   },
        // ),
        // ),
      ),
    );
  }
}

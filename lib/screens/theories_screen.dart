import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../providers/providers.dart';
import '../screens/theory_screen.dart';
import '../widgets/grid_moves_widget.dart';
import '../widgets/theory_card_widget.dart';

class TheoriesScreen extends HookConsumerWidget {
  const TheoriesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theories = ref.watch(theoryListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('ポケモン'),
        actions: [
          IconButton(
            onPressed: () {
              final newTheory = ref.read(theoryListProvider.notifier).create();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TheoryScreen(theoryId: newTheory.id),
                ),
              );
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: ReorderableListView.builder(
        itemCount: theories.length,
        itemBuilder: (context, index) => TheoryCardWidget(
          key: Key(theories[index].id),
          theory: theories[index],
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TheoryScreen(theoryId: theories[index].id),
            ),
          ),
          onDelete: () =>
              ref.read(theoryListProvider.notifier).delete(theories[index]),
          children: [
            const Divider(),
            GridMovesWidget(moves: theories[index].moves),
          ],
        ),
        onReorder: (oldIndex, newIndex) =>
            ref.read(theoryListProvider.notifier).reorder(oldIndex, newIndex),
      ),
    );
  }
}

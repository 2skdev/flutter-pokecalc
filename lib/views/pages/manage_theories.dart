import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/theory.dart';
import '../../providers/providers.dart';
import '../widgets/space.dart';
import '../widgets/theory_card.dart';
import 'theory_view.dart';

class ManageTheoriesPage extends HookConsumerWidget {
  const ManageTheoriesPage({super.key});

  Widget movesRow(BuildContext context, Theory theory, int start) {
    final rows = <Widget>[];

    for (var index = start; index < start + 2; index++) {
      if (theory.moves[index] != null) {
        rows.add(
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(4.0),
              color: Theme.of(context).backgroundColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      theory.moves[index]!.type.icon,
                      width: 20,
                    ),
                    const Space(),
                    Text(theory.moves[index]!.string),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    }

    return Row(
      children: rows,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theories = ref.watch(theoriesNotifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('ポケモン'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          final tmp = ref.read(theoriesNotifier.notifier).create();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TheoryViewPage(theoryKey: tmp.key!),
            ),
          );
        },
      ),
      body: ReorderableListView.builder(
        itemCount: theories.length,
        itemBuilder: (context, index) => TheoryCard(
          key: Key(theories[index].key!),
          theory: theories[index],
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  TheoryViewPage(theoryKey: theories[index].key!),
            ),
          ),
          onDelete: () =>
              ref.read(theoriesNotifier.notifier).delete(theories[index]),
          children: [
            const Divider(),
            movesRow(context, theories[index], 0),
            movesRow(context, theories[index], 2),
          ],
        ),
        onReorder: (oldIndex, newIndex) =>
            ref.read(theoriesNotifier.notifier).reorder(oldIndex, newIndex),
      ),
    );
  }
}

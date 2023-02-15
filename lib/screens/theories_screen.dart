import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/theory_model.dart';
import '../../providers/providers.dart';
import '../constants/dimens.dart';
import '../screens/theory_screen.dart';
import '../widgets/space_widget.dart';
import '../widgets/theory_card_widget.dart';

class TheoriesScreen extends HookConsumerWidget {
  const TheoriesScreen({super.key});

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
                      width: Dimens.kSmallIconSize,
                    ),
                    const SpaceWidget(),
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
    final theories = ref.watch(theoryListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('ポケモン'),
        actions: [
          IconButton(
            onPressed: () {
              final tmp = ref.read(theoryListProvider.notifier).create();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TheoryScreen(theoryKey: tmp.key!),
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
          key: Key(theories[index].key!),
          theory: theories[index],
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  TheoryScreen(theoryKey: theories[index].key!),
            ),
          ),
          onDelete: () =>
              ref.read(theoryListProvider.notifier).delete(theories[index]),
          children: [
            const Divider(),
            movesRow(context, theories[index], 0),
            movesRow(context, theories[index], 2),
          ],
        ),
        onReorder: (oldIndex, newIndex) =>
            ref.read(theoryListProvider.notifier).reorder(oldIndex, newIndex),
      ),
    );
  }
}

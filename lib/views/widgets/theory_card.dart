import 'package:flutter/material.dart';

import '../../extensions/theory.dart';
import '../../models/theory.dart';
import 'space.dart';
import 'stats_text_with_buff.dart';
import 'tiles.dart';

class TheoryCard extends StatelessWidget {
  const TheoryCard({
    super.key,
    required this.theory,
    this.children,
    this.onDelete,
    this.onTap,
    this.terastal = true,
  });

  final Theory theory;
  final List<Widget>? children;
  final Function()? onDelete;
  final Function()? onTap;
  final bool terastal;

  @override
  Widget build(BuildContext context) {
    Widget typeIcon;

    if (terastal) {
      typeIcon = Image.asset(
        theory.teratype.teraicon,
        width: 32,
      );
    } else {
      typeIcon = Row(
        children: theory.types
            .map(
              (e) => Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: Image.asset(
                  e.icon,
                  width: 18,
                ),
              ),
            )
            .toList(),
      );
    }

    Widget child = InkWell(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Stack(
                    children: [
                      Image.asset(theory.pokemon.icon, width: 96),
                      Positioned(
                        top: 8,
                        left: 8,
                        child: typeIcon,
                      )
                    ],
                  ),
                  const Space(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        theory.pokemon.string,
                        style: const TextStyle(fontSize: 16),
                      ),
                      StatsTextWithBuff(
                        stats: theory.actual,
                        nature: theory.nature,
                      ),
                      Text(theory.ability.string),
                      ItemTile(item: theory.item),
                    ],
                  ),
                ],
              ),
              if (children != null) ...children!
            ],
          ),
        ),
      ),
    );

    if (onDelete != null) {
      child = Dismissible(
        key: super.key!,
        direction: onDelete != null
            ? DismissDirection.endToStart
            : DismissDirection.none,
        onDismissed: (direction) => onDelete?.call(),
        confirmDismiss: (direction) async {
          return showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('削除しますか？'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: Text(
                    'キャンセル',
                    style: Theme.of(context).textTheme.button,
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: const Text(
                    'はい',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
          );
        },
        background: Container(
          color: Colors.red,
          alignment: AlignmentDirectional.centerEnd,
          padding: const EdgeInsets.only(right: 32),
          child: const Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
        child: child,
      );
    }

    return child;
  }
}

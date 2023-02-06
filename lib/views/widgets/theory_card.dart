import 'package:flutter/material.dart';
import 'package:pokecalc/views/widgets/space.dart';

import '../../models/theory.dart';

class TheoryCard extends StatelessWidget {
  const TheoryCard({
    super.key,
    required this.theory,
    this.children,
    this.onDelete,
    this.onTap,
  });

  final Theory theory;
  final List<Widget>? children;
  final Function()? onDelete;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
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
                        child: Image.asset(
                          theory.teratype.teraicon,
                          width: 32,
                        ),
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
                      Text(
                        theory.effort.toString(),
                        style: const TextStyle(color: Colors.grey),
                      ),
                      Row(
                        children: [
                          Text(theory.nature.string),
                          const Space(),
                          Text(theory.ability.string),
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset(theory.item.icon, width: 20),
                          Text(theory.item.string),
                        ],
                      ),
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
                  child: const Text(
                    'キャンセル',
                    style: TextStyle(color: Colors.black),
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

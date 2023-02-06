import 'package:flutter/material.dart';

import '../../constants/size.dart';
import '../../enums/enums.dart';
import '../../models/stats.dart';
import 'space.dart';

class NatureTile extends StatelessWidget {
  const NatureTile({super.key, required this.nature});

  final Natures nature;

  @override
  Widget build(BuildContext context) {
    final map = nature.buff.toArray().asMap();
    final children = <Widget>[];

    // buff
    map.forEach((i, value) {
      if (value > 0) {
        children.add(
          Chip(
            label: Text(Stats.strings[i]),
            backgroundColor: Colors.red,
          ),
        );
        children.add(
          const Space(),
        );
      }
    });

    // debuff
    map.forEach((i, value) {
      if (value < 0) {
        children.add(
          Chip(
            label: Text(Stats.strings[i]),
            backgroundColor: Colors.blue,
          ),
        );
      }
    });

    return Row(
      children: [
        SizedBox(
          width: 100,
          child: Text(nature.string),
        ),
        ...children,
      ],
    );
  }
}

class ItemTile extends StatelessWidget {
  const ItemTile({super.key, required this.item});

  final Items item;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          item.icon,
          width: kSmallIconSize,
        ),
        const Space(),
        Text(item.string),
      ],
    );
  }
}

class MoveTile extends StatelessWidget {
  const MoveTile({super.key, required this.move});

  final Moves move;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              move.type.icon,
              width: kSmallIconSize,
            ),
            const Space(),
            Text(move.string),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              move.category.icon,
              width: 20,
            ),
            const Space(),
            Text(
              move.infoString,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          ],
        )
      ],
    );
  }
}

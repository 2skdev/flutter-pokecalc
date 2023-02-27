import 'package:flutter/material.dart';

import '../../constants/dimens.dart';
import '../../enums/enums.dart';
import '../../models/stats_model.dart';
import 'space_widget.dart';
import 'type_chip_widget.dart';

class NatureTileWidget extends StatelessWidget {
  const NatureTileWidget({super.key, required this.nature});

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
            label: Text(
              Stats.strings[i],
              style: const TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.red,
          ),
        );
        children.add(
          const SpaceWidget(),
        );
      }
    });

    // debuff
    map.forEach((i, value) {
      if (value < 0) {
        children.add(
          Chip(
            label: Text(
              Stats.strings[i],
              style: const TextStyle(color: Colors.white),
            ),
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

class ItemTileWidget extends StatelessWidget {
  const ItemTileWidget({super.key, required this.item});

  final Items item;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          item.icon,
          width: Dimens.kSmallIconSize,
        ),
        const SpaceWidget(),
        Text(item.string),
      ],
    );
  }
}

class MoveTileWidget extends StatelessWidget {
  const MoveTileWidget({super.key, required this.move});

  final Moves move;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TypeChipWidget(
              type: move.type,
              text: move.string,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              move.category.icon,
              width: Dimens.kSmallIconSize,
            ),
            const SpaceWidget(),
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

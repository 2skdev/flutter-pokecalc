import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../constants/dimens.dart';
import '../enums/enums.dart';
import 'space_widget.dart';

class GridMovesWidget extends StatelessWidget {
  const GridMovesWidget({
    super.key,
    required this.moves,
  });

  final List<Moves?> moves;

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];

    moves.forEachIndexed((index, move) {
      List<Widget>? moveLabel;

      if (move != null) {
        moveLabel = [
          Image.asset(move.type.icon, width: Dimens.kSmallIconSize),
          const SpaceWidget(),
          Text(move.string),
        ];
      } else {
        moveLabel = [
          SizedBox(
            height: Dimens.kSmallIconSize,
            child: Text(
              '技${index + 1}',
              style: Theme.of(context).textTheme.caption,
            ),
          ),
        ];
      }

      children.add(
        Expanded(
          child: Container(
            color: Theme.of(context).backgroundColor,
            margin: const EdgeInsets.all(4.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: moveLabel,
              ),
            ),
          ),
        ),
      );
    });

    return Column(
      children: [
        Row(
          children: children.getRange(0, 2).toList(),
        ),
        Row(
          children: children.getRange(2, 4).toList(),
        ),
      ],
    );
  }
}
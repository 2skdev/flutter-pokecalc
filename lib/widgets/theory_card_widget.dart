import 'package:flutter/material.dart';

import '../../extensions/theory.dart';
import '../../models/theory_model.dart';
import 'delete_dismiss_widget.dart';
import 'space_widget.dart';
import 'stats_text_widget.dart';
import 'tile_widget.dart';

class TheoryCardWidget extends StatelessWidget {
  const TheoryCardWidget({
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
                  const SpaceWidget(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        theory.pokemon.string,
                        style: const TextStyle(fontSize: 16),
                      ),
                      StatsTextWidget(
                        stats: theory.actual,
                        nature: theory.nature,
                      ),
                      Text(theory.ability.string),
                      ItemTileWidget(item: theory.item),
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
      child = DeleteDismissWidget(
        key: super.key!,
        onDelete: onDelete,
        child: child,
      );
    }

    return child;
  }
}

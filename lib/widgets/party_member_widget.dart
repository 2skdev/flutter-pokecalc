import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../constants/dimens.dart';
import '../models/theory_model.dart';

class PartyMemberWidget extends StatelessWidget {
  const PartyMemberWidget({
    super.key,
    this.theory,
    this.onTap,
  });

  final Theory? theory;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    Widget child;

    if (theory != null) {
      child = Image.asset(
        theory!.pokemon.icon,
        width: Dimens.kLargeIconSize,
      );
    } else {
      child = DottedBorder(
        color: Theme.of(context).dividerColor,
        child: const SizedBox(
          // strokeの分、widthとheightを引く(-4)
          width: Dimens.kLargeIconSize - 4,
          height: Dimens.kLargeIconSize - 4,
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: onTap,
        child: child,
      ),
    );
  }
}

class PartyGridWidget extends StatelessWidget {
  const PartyGridWidget({
    super.key,
    required this.member,
    this.onTap,
  });

  final List<Theory?> member;
  final Function(int index)? onTap;

  @override
  Widget build(BuildContext context) {
    final children = <PartyMemberWidget>[];

    for (var i = 0; i < 6; i++) {
      children.add(
        PartyMemberWidget(
          theory: member[i],
          onTap: () => onTap?.call(i),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: children.getRange(0, 3).toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: children.getRange(3, 6).toList(),
          ),
        ],
      ),
    );
  }
}

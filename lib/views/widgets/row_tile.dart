import 'package:flutter/material.dart';

import '../../constants/size.dart';

class RowTile extends StatelessWidget {
  const RowTile({super.key, this.leading, this.child, this.onTap});

  final Widget? leading;
  final Widget? child;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];

    if (leading != null) {
      children.add(
        SizedBox(
          width: kMinLeadingWidth,
          child: leading,
        ),
      );
    }

    if (child != null) {
      children.add(
        DefaultTextStyle.merge(
          style: const TextStyle(fontSize: 16),
          child: child!,
        ),
      );
    }

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: children,
        ),
      ),
    );
  }
}

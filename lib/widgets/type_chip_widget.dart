import 'package:flutter/material.dart';

import '../../enums/enums.dart';
import 'space_widget.dart';
import 'type_icon_widget.dart';

class TypeChipWidget extends StatelessWidget {
  const TypeChipWidget({
    super.key,
    required this.type,
    this.terastal = false,
    this.text,
  });

  final Types type;
  final bool terastal;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TypeIconWidget(
          type: type,
          terastal: terastal,
        ),
        const SpaceWidget(),
        Text(text ?? type.string),
      ],
    );
  }
}

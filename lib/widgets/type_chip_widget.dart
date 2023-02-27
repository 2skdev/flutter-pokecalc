import 'package:flutter/material.dart';

import '../../enums/enums.dart';
import '../constants/dimens.dart';
import 'space_widget.dart';

class TypeChipWidget extends StatelessWidget {
  const TypeChipWidget({super.key, required this.type});

  final Types type;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(type.icon, width: Dimens.kSmallIconSize),
        const SpaceWidget(),
        Text(type.string)
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../constants/dimens.dart';
import '../enums/enums.dart';

class TypeIconWidget extends StatelessWidget {
  const TypeIconWidget({
    super.key,
    required this.type,
    this.terastal = false,
    this.size = Dimens.kSmallIconSize,
  });

  final Types type;
  final bool terastal;
  final double size;

  @override
  Widget build(BuildContext context) {
    if (terastal) {
      return Stack(
        alignment: AlignmentDirectional.center,
        children: [
          ColorFiltered(
            colorFilter: ColorFilter.mode(
              type.color,
              BlendMode.modulate,
            ),
            child: Image.asset(
              'assets/type/terastal.png',
              width: size * 1.3,
            ),
          ),
          Image.asset(type.icon, width: size * 0.9),
        ],
      );
    } else {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: type.color,
        ),
        width: size,
        height: size,
        child: Image.asset(type.icon, width: size),
      );
    }
  }
}

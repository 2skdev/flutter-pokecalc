import 'package:flutter/material.dart';

import '../../enums/enums.dart';
import '../constants/dimens.dart';
import 'space_widget.dart';

class TypeChipWidget extends StatelessWidget {
  const TypeChipWidget({super.key, required this.type});

  final Types type;

  @override
  Widget build(BuildContext context) {
    var padding = 0.0;
    if (type.string.length <= 2) {
      padding = 20;
    } else if (type.string.length == 3) {
      padding = 10;
    }

    return Container(
      decoration: BoxDecoration(
        color: type.color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SpaceWidget(),
          Image.asset(type.icon, width: Dimens.kSmallIconSize),
          SizedBox(
            width: 90,
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(right: padding),
                child: Text(
                  type.string,
                  style: TextStyle(
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Colors.black.withAlpha(200),
                        offset: Offset.zero,
                        blurRadius: 20.0,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

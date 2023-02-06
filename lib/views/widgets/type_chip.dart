import 'package:flutter/material.dart';

import '../../enums/enums.dart';
import 'space.dart';

class TypeChip extends StatelessWidget {
  const TypeChip({super.key, required this.type});

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
          const Space(
            width: 6,
          ),
          Image.asset(
            type.icon,
            width: 16,
          ),
          SizedBox(
            width: 80,
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(right: padding),
                child: Text(
                  type.string,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../enums/enums.dart';
import '../../models/stats_model.dart';

class StatsTextWidget extends StatelessWidget {
  const StatsTextWidget({
    super.key,
    required this.stats,
    required this.nature,
  });

  final Stats stats;
  final Natures nature;

  @override
  Widget build(BuildContext context) {
    List<TextSpan> spans = [];

    for (var i = 0; i < 6; i++) {
      Color color = Colors.grey;

      if (nature.buff[i] > 0) {
        color = Colors.red;
      } else if (nature.buff[i] < 0) {
        color = Colors.blue;
      }

      spans.add(
        TextSpan(
          text: stats[i].toString(),
          style: TextStyle(color: color),
        ),
      );

      if (i < 5) {
        spans.add(
          const TextSpan(
            text: '-',
            style: TextStyle(color: Colors.grey),
          ),
        );
      }
    }

    return RichText(
      text: TextSpan(children: spans),
    );
  }
}

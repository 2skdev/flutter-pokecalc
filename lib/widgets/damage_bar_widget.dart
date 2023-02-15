import 'package:flutter/material.dart';

class DamageBarWidget extends StatelessWidget {
  const DamageBarWidget({
    super.key,
    required this.damageMin,
    required this.damageMax,
  });

  final double damageMin;
  final double damageMax;

  double get remainMinHp => (1 - damageMax).clamp(0, 1);
  double get remainMaxHp => (1 - damageMin).clamp(0, 1);

  @override
  Widget build(BuildContext context) {
    final color = remainMaxHp <= 0.25
        ? Colors.red
        : remainMaxHp <= 0.5
            ? Colors.yellow
            : Colors.green;

    return Stack(
      children: [
        LinearProgressIndicator(
          value: remainMaxHp,
          backgroundColor: Colors.grey[400],
          color: color[300],
        ),
        LinearProgressIndicator(
          value: remainMinHp,
          backgroundColor: Colors.transparent,
          color: color[700],
        ),
      ],
    );
  }
}

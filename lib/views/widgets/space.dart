import 'package:flutter/material.dart';

class Space extends StatelessWidget {
  const Space({super.key, this.width = 6});

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width);
  }
}

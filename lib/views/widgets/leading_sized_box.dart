import 'package:flutter/material.dart';

class LeadingSizedBox extends StatelessWidget {
  const LeadingSizedBox({
    super.key,
    this.width,
    this.height = double.infinity,
    this.child,
    this.horizontalAlign = CrossAxisAlignment.start,
    this.vertialAlign = MainAxisAlignment.center,
  });

  final double? width;
  final double? height;
  final Widget? child;
  final CrossAxisAlignment horizontalAlign;
  final MainAxisAlignment vertialAlign;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: width,
      child: Column(
        mainAxisAlignment: vertialAlign,
        crossAxisAlignment: horizontalAlign,
        children: [
          if (child != null) child!,
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AlignListTileLeadingWidget extends StatelessWidget {
  const AlignListTileLeadingWidget({
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

class AlignListTileWidget extends StatelessWidget {
  const AlignListTileWidget({
    super.key,
    this.leading,
    this.title,
    this.minLeadingWidth,
    this.onTap,
  });

  final Widget? leading;

  final Widget? title;

  final double? minLeadingWidth;

  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:
          leading != null ? AlignListTileLeadingWidget(child: leading) : null,
      minLeadingWidth: minLeadingWidth,
      title: title,
      onTap: onTap,
    );
  }
}

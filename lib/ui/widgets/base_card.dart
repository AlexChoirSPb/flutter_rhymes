import 'package:flutter/material.dart';

class BaseCard extends StatelessWidget {
  const BaseCard(
      {super.key, required this.child, this.width, this.margin, this.padding});

  final Widget child;
  final double? width;
  final EdgeInsets? margin;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
        width: width ?? double.infinity,
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
            color: theme.cardColor, borderRadius: BorderRadius.circular(8)),
        child: child);
  }
}

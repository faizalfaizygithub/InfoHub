import 'package:flutter/material.dart';

class RefractedDialogBox extends StatelessWidget {
  const RefractedDialogBox({
    super.key,
    this.heading,
    this.subTitleText,
    this.trailingWidgets,
    this.titlePadding,
    this.subTitlePadding,
    this.trailingPadding,
    this.color,
    this.backgroundColor,
  });

  final Widget? heading;
  final Widget? subTitleText;
  final List<Widget>? trailingWidgets;
  final EdgeInsetsGeometry? titlePadding;
  final EdgeInsetsGeometry? subTitlePadding;
  final EdgeInsetsGeometry? trailingPadding;
  final Color? color;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: color ?? const Color(0xFF000000))),
      iconPadding: titlePadding,
      titlePadding: subTitlePadding,
      actionsPadding: trailingPadding,
      icon: Center(child: heading),
      title: subTitleText,
      actions: trailingWidgets,
    );
  }
}

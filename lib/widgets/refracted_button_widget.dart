import 'package:flutter/material.dart';

class RefractedButtonWidget extends StatelessWidget {
  const RefractedButtonWidget({
    super.key,
    this.color,
    this.onPressed,
    this.child,
    this.radius,
    this.borderColor,
  });

  final Color? color;
  final Function()? onPressed;
  final Widget? child;
  final double? radius;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
          side: BorderSide(
            color: borderColor ?? Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(radius ?? 10)),
      color: color,
      onPressed: onPressed,
      child: child,
    );
  }
}

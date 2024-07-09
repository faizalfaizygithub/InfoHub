import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HeadingText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight weight;
  final TextAlign alignment;
  final Color? color;

  const HeadingText(
      {super.key,
      required this.text,
      this.fontSize,
      this.color,
      this.weight = FontWeight.w600,
      this.alignment = TextAlign.start});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: alignment,
      style: GoogleFonts.montserrat(
          textStyle: TextStyle(
        fontSize: fontSize ?? 22.sp,
        fontWeight: weight,
        color: color,
      )),
    );
  }
}

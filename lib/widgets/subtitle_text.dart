import 'package:byb/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../config/app_theme.dart';

class SubtitleText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight weight;
  final int maxLines;
  final double height;
  final TextAlign textAlign;
  final Color? color;

  const SubtitleText(
      {super.key,
      required this.text,
      this.fontSize,
      this.weight = FontWeight.w700,
      this.maxLines = 1,
      this.height = 1.5,
      this.textAlign = TextAlign.left,
      this.color});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    return Text(
      text,
      maxLines: maxLines,
      textAlign: textAlign,
      style: GoogleFonts.montserrat(
          textStyle: TextStyle(
              height: height,
              fontSize: fontSize ?? 14.sp,
              fontWeight: weight,
              overflow: TextOverflow.ellipsis,
              color: provider.getCurrentTheme()
                  ? subtitleColor
                  : color ?? Colors.black)),
    );
  }
}

import 'dart:ui';

import 'package:byb/widgets/subtitle_text.dart';
import 'package:byb/widgets/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../config/app_theme.dart';
import '../providers/theme_provider.dart';

class SkipButton extends StatelessWidget {
  final Function()? onTap;
  final double? width;
  final double? height;
  final String label;
  final String svgPath;
  final bool isRefer;

  const SkipButton(
      {super.key,
      this.onTap,
      this.width,
      this.height,
      this.label = 'Skip',
      this.svgPath = 'woman',
      this.isRefer = false});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
              child: Container(
                height: height,
                width: width,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
                child: const Center(
                  child: Text(''),
                ),
              ),
            ),
          ),
          Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
                color: const Color(0x20FFFFFF),
                border: Border.all(
                    width: 0.5,
                    color: isRefer
                        ? primaryColor
                        : themeProvider.getCurrentTheme()
                            ? const Color(0x66FFFFFF)
                            : buttonBorderColor),
                borderRadius: BorderRadius.circular(40)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (label != 'Skip')
                  SvgIcon(
                    path: svgPath,
                    color: Colors.amber,
                  ),
                if (label != 'Skip')
                  const SizedBox(
                    width: 10,
                  ),
                SubtitleText(
                  text: label,
                  weight: FontWeight.w600,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//
//
//
//country select back issue
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../config/app_theme.dart';
import '../../../providers/theme_provider.dart';
import '../../../widgets/subtitle_text.dart';
import '../../../widgets/svg_icon.dart';

class DestinationItem extends StatelessWidget {
  final bool isSelected;
  final String label;
  final String svgPath;
  final Function()? onTap;
  final bool isCenter;

  const DestinationItem(
      {super.key,
      required this.isSelected,
      required this.label,
      required this.svgPath,
      this.onTap,
      this.isCenter = false});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
              radius: 20,
              backgroundColor: isSelected
                  ? primaryColor
                  : isCenter
                      ? Colors.white
                      : themeProvider.getCurrentTheme()
                          ? darkDialogBG
                          : const Color(0xffE8E8ED),
              child: SvgIcon(
                path: svgPath,
                color: isCenter ? null : Colors.grey,
                isAlwaysWhite: isSelected,
              )),
          SubtitleText(
            text: label,
            fontSize: 10.sp,
          )
        ],
      ),
    );
  }
}

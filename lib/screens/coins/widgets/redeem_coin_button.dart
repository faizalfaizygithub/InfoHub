import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../config/app_theme.dart';
import '../../../providers/theme_provider.dart';
import '../../../widgets/subtitle_text.dart';
import '../../../widgets/svg_icon.dart';

class RedeemCoinButton extends StatelessWidget {
  final Function()? onTap;
  final String label;

  const RedeemCoinButton(
      {super.key, this.onTap, this.label = 'Buy Coins Now !'});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40.h,
        width: 160.h,
        decoration: BoxDecoration(
            color: themeProvider.getCurrentTheme()
                ? primaryColorTrans
                : Colors.white,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: primaryColor, width: 0.5)),
        child: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: SubtitleText(
                text: label,
                weight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
            const CircleAvatar(
              radius: 15,
              child: SvgIcon(path: 'forward'),
            ),
            const SizedBox(
              width: 5,
            )
          ],
        ),
      ),
    );
  }
}

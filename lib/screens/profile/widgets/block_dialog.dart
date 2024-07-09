import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../config/app_theme.dart';
import '../../../providers/theme_provider.dart';
import '../../../widgets/heading_text.dart';
import '../../../widgets/subtitle_text.dart';
import '../../../widgets/svg_icon.dart';

class BlockDialog extends StatelessWidget {
  const BlockDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.sp)),
      backgroundColor:
          themeProvider.getCurrentTheme() ? darkCardColor : Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 30, 35, 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SvgIcon(
                  path: 'profile-block',
                  color: Colors.red,
                  fixedColor: Colors.red,
                  height: 22,
                  width: 22,
                ),
                SizedBox(
                  width: 10,
                ),
                HeadingText(
                  text: 'Block User',
                  fontSize: 14,
                  weight: FontWeight.w500,
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: SubtitleText(
                textAlign: TextAlign.center,
                maxLines: 3,
                text:
                    'Are you sure you want to block this user for violating our guidelines?'),
          ),
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const HeadingText(
              text: 'Block User',
              fontSize: 14,
              weight: FontWeight.w500,
            ),
          ),
          Divider(
            height: 30,
            endIndent: 40,
            indent: 40,
            thickness: 0.1,
            color: darkDividerColor,
          ),
          GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const SubtitleText(text: 'Cancel')),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}

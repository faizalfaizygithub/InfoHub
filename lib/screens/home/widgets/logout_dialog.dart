import 'package:byb/screens/auth/login.dart';
import 'package:byb/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../../../config/app_theme.dart';
import '../../../providers/theme_provider.dart';
import '../../../widgets/heading_text.dart';
import '../../../widgets/subtitle_text.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({
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
              children: [
                Icon(
                  Iconsax.logout,
                  size: 20,
                  color: primaryColor,
                ),
                const SizedBox(
                  width: 10,
                ),
                const HeadingText(
                  text: 'Logout',
                  fontSize: 14,
                  weight: FontWeight.w500,
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: SubtitleText(
                textAlign: TextAlign.center,
                maxLines: 3,
                text: 'Are you sure you want to logout from the app ?'),
          ),
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              pushAndRemoveUntil(context, const LoginScreen());
            },
            child: const HeadingText(
              text: 'Logout Now',
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

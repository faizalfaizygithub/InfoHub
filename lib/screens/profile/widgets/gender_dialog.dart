import 'package:byb/providers/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../../../config/app_theme.dart';
import '../../../providers/theme_provider.dart';
import '../../../widgets/heading_text.dart';
import '../../../widgets/subtitle_text.dart';

class GenderDialog extends StatefulWidget {
  const GenderDialog({
    super.key,
  });

  @override
  State<GenderDialog> createState() => _GenderDialogState();
}

class _GenderDialogState extends State<GenderDialog> {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    var profileProvider = Provider.of<ProfileProvider>(context);
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.sp)),
      backgroundColor:
          themeProvider.getCurrentTheme() ? darkCardColor : Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);

              setState(() {
                profileProvider.switchGender('Male');
              });
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 30, 35, 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Iconsax.man,
                    size: 20,
                    color: primaryColor,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const HeadingText(
                    text: 'Male',
                    fontSize: 14,
                    weight: FontWeight.w500,
                  ),
                ],
              ),
            ),
          ),
          Divider(
            // height: 30,
            endIndent: 40,
            indent: 40,
            thickness: 0.1,
            color: darkDividerColor,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              setState(() {
                profileProvider.switchGender('Female');
              });
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 35, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Iconsax.woman,
                    size: 20,
                    color: primaryColor,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const HeadingText(
                    text: 'Female',
                    fontSize: 14,
                    weight: FontWeight.w500,
                  ),
                ],
              ),
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
            height: 20,
          )
        ],
      ),
    );
  }
}

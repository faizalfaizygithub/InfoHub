import 'package:byb/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../config/app_theme.dart';
import '../providers/auth_provider.dart';
import 'heading_text.dart';

class CountryCodePicker extends StatelessWidget {
  const CountryCodePicker(
      {super.key, this.isContactUsPage = false, this.disableBorder = false});
  final bool disableBorder;
  final bool isContactUsPage;

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context);
    var themeProvider = Provider.of<ThemeProvider>(context);
    return GestureDetector(
      onTap: () {
        authProvider.openCountryPickerDialog();
      },
      child: !isContactUsPage
          ? Container(
              height: 58.sp,
              width: 80.sp,
              decoration: disableBorder
                  ? const BoxDecoration()
                  : BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          width: 0.4.sp,
                          color: themeProvider.getCurrentTheme()
                              ? subtitleColor
                              : Colors.black),
                    ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: HeadingText(
                      text: authProvider.countryCode,
                      weight: FontWeight.w600,
                      fontSize: 16.sp,
                    ),
                  ),
                  const Icon(Icons.arrow_drop_down)
                ],
              ),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: HeadingText(
                    text: authProvider.countryCode,
                    weight: FontWeight.w600,
                    fontSize: 16.sp,
                  ),
                ),
                const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.grey,
                )
              ],
            ),
    );
  }
}

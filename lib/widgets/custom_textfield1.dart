import 'package:byb/widgets/subtitle_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';
import 'country_picker.dart';
import 'svg_icon.dart';

class CustomTextfield1 extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController? controller;
  final String? iconPath;
  final TextInputType? keyboardType;
  final bool isVerified;
  final bool enabled;
  final Function()? onTap;
  final int maxLines;
  final bool isPhone;

  const CustomTextfield1(
      {super.key,
      required this.label,
      required this.hintText,
      this.controller,
      this.iconPath,
      this.keyboardType,
      this.enabled = true,
      this.onTap,
      this.isVerified = false,
      this.maxLines = 1,
      this.isPhone =false
      });

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SubtitleText(text: label),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Row(
                  children: [
                    if (iconPath != null)
                      CircleAvatar(
                        radius: 15.sp,
                        backgroundColor: provider.getCurrentTheme()
                            ? const Color(0xFF252525)
                            : const Color(0xffE8E8ED),
                        child: SvgIcon(
                          path: iconPath ?? "",
                          color: Colors.red,
                        ),
                      ),
                    if (iconPath != null)
                       SizedBox(
                        width: isPhone?0:18,
                      ),
                      if(isPhone)
                      const CountryCodePicker(disableBorder: true),
                    Expanded(
                      child: GestureDetector(
                        onTap: onTap,
                        child: TextField(
                          controller: controller,
                          keyboardType: keyboardType,
                          enabled: enabled,
                          decoration: InputDecoration(
                            hintText: hintText,
                            border: InputBorder.none,
                          ),
                          maxLines: maxLines,
                        ),
                      ),
                    ),
                    if (isVerified)
                      const SvgIcon(
                        path: 'verify',
                      ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  height: 0.5,
                  color: provider.getCurrentTheme()
                      ? const Color(0x3EFFFFFF)
                      : const Color(0xffd6d6d6),
                )
              ],
            )
          ],
        )
      ],
    );
  }
}

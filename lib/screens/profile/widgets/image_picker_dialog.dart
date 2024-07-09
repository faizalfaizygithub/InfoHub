import 'package:byb/providers/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../config/app_theme.dart';
import '../../../providers/theme_provider.dart';
import '../../../widgets/heading_text.dart';
import '../../../widgets/subtitle_text.dart';

class ImagePickerDialog extends StatelessWidget {
  const ImagePickerDialog({
    super.key,
  });

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
              profileProvider.pickProfilePicture(ImageSource.camera);
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 30, 35, 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Iconsax.camera,
                    size: 20,
                    color: primaryColor,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const HeadingText(
                    text: 'Camera',
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
              profileProvider.pickProfilePicture(ImageSource.gallery);
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 35, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Iconsax.gallery,
                    size: 20,
                    color: primaryColor,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const HeadingText(
                    text: 'Gallery',
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

import 'dart:io';

import 'package:byb/providers/registration_provider.dart';
import 'package:byb/providers/theme_provider.dart';
import 'package:byb/screens/registration/pick_cat.dart';
import 'package:byb/services/navigation_service.dart';
import 'package:byb/widgets/heading_text.dart';
import 'package:byb/widgets/subtitle_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../widgets/continue_button.dart';
import '../../widgets/custom_textfield1.dart';
import '../../widgets/skip_button.dart';
import '../../widgets/svg_icon.dart';

class PickPhoto extends StatefulWidget {
  const PickPhoto({super.key});

  @override
  State<PickPhoto> createState() => _PickPhotoState();
}

class _PickPhotoState extends State<PickPhoto> {
  @override
  Widget build(BuildContext context) {
    double w = ScreenUtil().screenWidth;
    var themeProvider = Provider.of<ThemeProvider>(context);
    var registrationProvider = Provider.of<RegistrationProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          SvgIcon(
            path: 'pattern',
            width: w,
          ),
          SafeArea(
              child: Padding(
            padding: EdgeInsets.all(20.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HeadingText(
                      text: 'Add your\nprofile photo',
                      weight: FontWeight.bold,
                    ),
                    SkipButton(
                      onTap: () {
                        push(context, const PickCategories());
                      },
                      width: 75.sp,
                      height: 25.sp,
                    )
                  ],
                ),
                SubtitleText(maxLines: 3, text: pickPhoto),
                Expanded(
                    child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            registrationProvider.openImagePicker();
                          },
                          child: Container(
                            height: 230.h,
                            width: 230.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: themeProvider.getCurrentTheme()
                                  ? const Color(0xFF1f1f1f)
                                  : const Color(0xffEFEFEF),
                            ),
                            child: registrationProvider.pickedFile != null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(200),
                                    child: Image.file(
                                      File(
                                        registrationProvider.pickedFile!.path,
                                      ),
                                      height: 230.h,
                                      width: 230.h,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : const Center(
                                    child: SvgIcon(
                                      path: 'gallery-add',
                                      color: Colors.grey,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      CustomTextfield1(
                        label: 'Add Bio',
                        hintText: 'Add Bio',
                        controller: registrationProvider.bioController,
                      )
                    ],
                  ),
                ))
              ],
            ),
          )),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ContinueButton(
        isValidated: true,
        label: 'Save Profile',
        onTap: () {
          push(context, const PickCategories());
        },
      ),
    );
  }

  String pickPhoto =
      "Personalize your Frijo profile and make it uniquely yours by adding a photo! Stand out and enhance your presence.";
}

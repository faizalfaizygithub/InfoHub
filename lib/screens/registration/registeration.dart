import 'package:byb/providers/auth_provider.dart';
import 'package:byb/providers/registration_provider.dart';
import 'package:byb/screens/registration/pick_photo.dart';
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

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  @override
  Widget build(BuildContext context) {
    double w = ScreenUtil().screenWidth;
    var registrationProvider = Provider.of<RegistrationProvider>(context);
    var authProvider = Provider.of<AuthProvider>(context);
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
                      text: 'Enter your\npersonal details',
                      weight: FontWeight.bold,
                    ),
                    SkipButton(
                      onTap: () {
                        push(context, const PickPhoto());
                      },
                      width: 75.sp,
                      height: 25.sp,
                    )
                  ],
                ),
                SubtitleText(
                  maxLines: 2,
                  text: personalDt,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        CustomTextfield1(
                          controller: registrationProvider.nameController,
                          label: 'Full Name',
                          hintText: 'Enter Full Name',
                          iconPath: 'profile',
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        CustomTextfield1(
                          controller: authProvider.mobileController,
                          label: 'Mobile Number',
                          hintText: 'Enter Mobile Number',
                          iconPath: 'mobile',
                          isVerified: true,
                          enabled: false,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        CustomTextfield1(
                          controller: registrationProvider.emailController,
                          label: 'Email ID',
                          hintText: 'Enter Email ID',
                          iconPath: 'sms',
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        CustomTextfield1(
                          controller: registrationProvider.dobController,
                          label: 'D.O.B',
                          hintText: 'Date of Birth',
                          iconPath: 'menu-board',
                          enabled: false,
                          onTap: () {
                            registrationProvider.openDatePicker();
                          },
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        const SubtitleText(text: 'Gender'),
                        const SizedBox(
                          height: 10,
                        ),
                        const Row(
                          children: [
                            Expanded(
                              child: SkipButton(
                                height: 40,
                                label: 'Male',
                                svgPath: 'man',
                              ),
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            Expanded(
                              child: SkipButton(
                                height: 40,
                                label: 'Female',
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 100.h,
                )
              ],
            ),
          )),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ContinueButton(
        isValidated: true,
        onTap: () {
          push(context, const PickPhoto());
        },
      ),
    );
  }

  String personalDt =
      "Share a bit about yourself and create a personalized experience by entering your personal details on Frijo!";
}

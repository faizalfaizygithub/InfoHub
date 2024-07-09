import 'package:byb/providers/auth_provider.dart';
import 'package:byb/screens/auth/otp_verify.dart';
import 'package:byb/services/navigation_service.dart';
import 'package:byb/widgets/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../widgets/continue_button.dart';
import '../../widgets/country_picker.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/heading_text.dart';
import '../../widgets/subtitle_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    double w = ScreenUtil().screenWidth;
    var authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  height: 80,
                ),
                const HeadingText(
                  text: 'Enter Your\nMobile Number',
                  weight: FontWeight.bold,
                ),
                const SizedBox(
                  height: 15,
                ),
                const SubtitleText(
                  maxLines: 3,
                  text:
                      'Get started on Frijo by registering with your mobile number. Join thousands of learners accessing high-quality resources to boost their skills!',
                ),
                SizedBox(
                  height: 35.sp,
                ),
                Row(
                  children: [
                    const CountryCodePicker(),
                    SizedBox(
                      width: 10.sp,
                    ),
                    Expanded(
                      child: CustomTextField(
                        controller: authProvider.mobileController,
                        hint: 'Enter Mobile Number',
                        onChanged: (v) {
                          authProvider.refresh();
                        },
                        type: TextInputType.phone,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 30.sp,
                ),
                Row(
                  children: [
                    Checkbox(
                      value: authProvider.isChecked,
                      onChanged: (value) {
                        authProvider.toggleCheck(value);
                      },
                    ),
                    Flexible(
                      child: Text(
                        'By entering you agree to our Terms & Privacy Policy .',
                        style: TextStyle(
                            fontSize: 10.sp,
                            color: Colors.grey,
                            fontWeight: FontWeight.w700),
                      ),
                    )
                  ],
                )
              ],
            ),
          ))
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ContinueButton(
        isValidated: authProvider.mobileController.text.isEmpty ? false : true,
        onTap: () {
          if (authProvider.mobileController.text.isNotEmpty) {
            pushAndRemoveUntil(context, const OtpVerify());
          } else {
            showSnackBar(context, 'Enter a valid mobile number !');
          }
        },
      ),
    );
  }
}

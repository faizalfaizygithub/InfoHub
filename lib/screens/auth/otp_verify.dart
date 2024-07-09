import 'package:byb/config/app_theme.dart';
import 'package:byb/providers/auth_provider.dart';
import 'package:byb/providers/theme_provider.dart';
import 'package:byb/screens/auth/login.dart';
import 'package:byb/screens/registration/registeration.dart';
import 'package:byb/services/navigation_service.dart';
import 'package:byb/widgets/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import '../../widgets/continue_button.dart';
import '../../widgets/heading_text.dart';
import '../../widgets/subtitle_text.dart';

class OtpVerify extends StatefulWidget {
  const OtpVerify({super.key});

  @override
  State<OtpVerify> createState() => _OtpVerifyState();
}

class _OtpVerifyState extends State<OtpVerify> {
  var authProvider = AuthProvider();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      authProvider.otpTimer();
    });
    super.initState();
  }

  bool isEnable = false;
  final FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    double w = ScreenUtil().screenWidth;
    authProvider = Provider.of<AuthProvider>(context);
    var themeProvider = Provider.of<ThemeProvider>(context);
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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  const HeadingText(
                    text: 'Confirm Your\nMobile Number',
                    weight: FontWeight.bold,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SubtitleText(
                    maxLines: 2,
                    text: verifyOtp,
                  ),
                  SizedBox(
                    height: 35.sp,
                  ),
                  SizedBox(
                    width: 190.w,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: authProvider.mobileController,
                            textInputAction: TextInputAction.done,
                            style: const TextStyle(fontSize: 20),
                            decoration: const InputDecoration(),
                            enabled: isEnable,
                            focusNode: focusNode,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            pushAndRemoveUntil(context, const LoginScreen());
                          },
                          child: SvgIcon(
                            path: 'edit',
                            height: 20.sp,
                            color: Colors.amber,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 35.sp,
                  ),
                  PinCodeTextField(
                    autoDisposeControllers: false,
                    controller: authProvider.otpController,
                    appContext: context,
                    length: 6,
                    onChanged: (value) {},
                    keyboardType: TextInputType.number,
                    onCompleted: (value) {
                      authProvider.refresh();
                    },
                    pinTheme: PinTheme(
                      borderWidth: 1,
                      activeColor: !themeProvider.getCurrentTheme()
                          ? primaryColor
                          : Colors.white,
                      inactiveColor: const Color(0xA99E9E9E),
                      activeFillColor: !themeProvider.getCurrentTheme()
                          ? primaryColor
                          : Colors.white,
                      selectedColor: !themeProvider.getCurrentTheme()
                          ? primaryColor
                          : Colors.white,
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AnimatedOpacity(
                          duration: const Duration(milliseconds: 250),
                          opacity: authProvider.isResend ? 0 : 1,
                          child: Text(
                            authProvider.resendTimeFormatted,
                            style: const TextStyle(fontWeight: FontWeight.w700),
                          )),
                      AnimatedOpacity(
                        duration: const Duration(milliseconds: 250),
                        opacity: authProvider.isResend ? 1 : 0,
                        child: OutlinedButton(
                            onPressed: () {},
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Resend OTP',
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.refresh,
                                  size: 18.sp,
                                )
                              ],
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ))
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ContinueButton(
        isValidated: authProvider.otpController.text.length == 6 ? true : false,
        onTap: () {
          if (authProvider.otpController.text.length == 6) {
            pushAndRemoveUntil(context, const Registration());
          } else {
            showSnackBar(context, 'Please enter OTP !');
          }
        },
      ),
    );
  }

  String verifyOtp =
      "Enter the OTP received on your phone to confirm your mobile number and start exploring the Frijo app!";
}

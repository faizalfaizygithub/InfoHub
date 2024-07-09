import 'dart:developer';

import 'package:byb/screens/careers/careers.dart';
import 'package:byb/screens/help_center/help_chat.dart';
import 'package:byb/screens/home/widgets/refracted_premium_screen.dart';
import 'package:byb/screens/home/widgets/refracted_refer_and_earncoins_widget.dart';
import 'package:byb/screens/registration/pick_cat.dart';
import 'package:byb/screens/settings/about.dart';
import 'package:byb/screens/settings/blocked_users.dart';
import 'package:byb/screens/settings/contact_us.dart';
import 'package:byb/screens/settings/privacy_policy.dart';
import 'package:byb/screens/settings/terms_and_conditions.dart';
import 'package:byb/services/navigation_service.dart';
import 'package:byb/widgets/heading_text.dart';
import 'package:byb/widgets/refracted_button_widget.dart';
import 'package:byb/widgets/subtitle_text.dart';
import 'package:byb/widgets/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../config/app_theme.dart';
import '../../../providers/theme_provider.dart';

class CustomDriver extends StatefulWidget {
  const CustomDriver({
    super.key,
  });

  @override
  State<CustomDriver> createState() => _CustomDriverState();
}

class _CustomDriverState extends State<CustomDriver> {
  var themeProvider = ThemeProvider();
  bool isDark = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      themeProvider.setTheme().then((value) {
        themeProvider.switchTheme(value);
        setState(() {
          isDark = value;
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of<ThemeProvider>(context);
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      child: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 40, 18, 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const HeadingText(text: 'Settings'),
                  Container(
                    height: 34.h,
                    width: 34.w,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: darkBG,
                        border:
                            Border.all(color: isDark ? Colors.grey : darkBG)),
                    child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          setState(() {
                            isDark = !isDark;
                          });
                          themeProvider.switchTheme(isDark);
                        },
                        icon: isDark
                            ? const Icon(
                                Icons.light_mode,
                                color: Colors.amber,
                                size: 20,
                              )
                            : Icon(
                                Icons.dark_mode,
                                color: Colors.blue[100],
                                size: 20,
                              )),
                  ),
                ],
              ),
            ),
            DrawerItem(
              svgPath: 'menu',
              label: 'Categories',
              fixedColor: const Color(0xff50bc50),
              onTap: () {
                push(
                    context,
                    const PickCategories(
                      from: 'other',
                    ));
              },
            ),
            DrawerItem(
              svgPath: 'premium_icon',
              label: 'Frijo Premium',
              fixedColor: const Color(0xffF59E1C),
              onTap: () {
                push(context, const RefractedPremiumScreen());
              },
            ),

            DrawerItem(
              fixedColor: const Color(0xff369afe),
              svgPath: 'careers',
              label: 'Careers',
              onTap: () {
                push(context, const Careers());
              },
            ),

            DrawerItem(
              fixedColor: const Color(0xff1eefb1),
              svgPath: 'share_1',
              label: 'Refer and Earn Coins',
              onTap: () {
                push(context, const RefractedReferAndEarnCoinsWidget());
              },
            ),

            DrawerItem(
              fixedColor: const Color(0xffff007f),
              svgPath: 'call',
              label: 'Contact Us',
              onTap: () {
                log('message');
                push(context, const ContactUs());
              },
            ),
            DrawerItem(
              fixedColor: const Color(0xffff6f61),
              svgPath: '24-support',
              label: 'Help Center',
              onTap: () {
                log('message');
                push(context, const HelpChat());
              },
            ),
            DrawerItem(
              fixedColor: Colors.amberAccent,
              svgPath: 'blocked',
              label: 'Blocked Users',
              blockedUsersCountWidget: const Text(
                "[${5}]",
                style: TextStyle(color: Colors.grey),
              ),
              onTap: () {
                log('message');
                push(context, const BlockedUsers());
              },
            ),
            DrawerItem(
              fixedColor: Colors.lightGreenAccent,
              svgPath: 'privacy',
              label: 'Privacy Policy',
              onTap: () {
                log('message');
                push(context, const PrivacyPolicy());
              },
            ),
            DrawerItem(
              fixedColor: Colors.lightBlueAccent,
              svgPath: 'document-text',
              label: 'Terms and Conditions',
              onTap: () {
                log('message');
                push(context, const TermsAndConditions());
              },
            ),
            DrawerItem(
              fixedColor: Colors.pink,
              svgPath: 'info-circle',
              label: 'About Frijo Tech',
              onTap: () {
                log('message');
                push(context, const AboutUs());
              },
            ),
            DrawerItem(
              fixedColor: Colors.red,
              svgPath: 'trash',
              label: 'Delete Account',
              onTap: () {},
            ),
            // DrawerItem(
            //   svgPath: 'login',
            //   label: 'Log Out',
            //   onTap: () {
            //     log('message');
            //     Navigator.pop(context);

            //     showDialog(
            //       context: context,
            //       builder: (context) => const LogoutDialog(),
            //     );
            //   },
            // ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 20, 20, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RefractedButtonWidget(
                    borderColor: primaryColor50,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SubtitleText(text: "Log Out"),
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: SvgIcon(
                            path: 'login',
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Container(
                  //     decoration: BoxDecoration(
                  //         shape: BoxShape.circle,
                  //         border: Border.all(color: Colors.grey)),
                  //     child: Padding(
                  //       padding: const EdgeInsets.all(8.0),
                  //       child: SvgIcon(
                  //         path: "trash",
                  //         color: primaryColor50,
                  //       ),
                  //     ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final String svgPath;
  final String label;
  final Function()? onTap;
  final Color? fixedColor;
  final Widget? blockedUsersCountWidget;

  const DrawerItem(
      {super.key,
      required this.svgPath,
      required this.label,
      this.onTap,
      this.fixedColor,
      this.blockedUsersCountWidget});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: SizedBox(
            height: 60,
            child: Row(
              children: [
                SizedBox(
                  width: 25.w,
                ),
                SvgIcon(
                  path: svgPath,
                  color: Colors.grey,
                  fixedColor: fixedColor,
                  width: 18.sp,
                  height: 18.sp,
                ),
                SizedBox(
                  width: 18.w,
                ),
                HeadingText(
                  text: label,
                  weight: FontWeight.w600,
                  fontSize: 15.sp,
                ),
                if (blockedUsersCountWidget != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: blockedUsersCountWidget!,
                  ),
                const Expanded(child: SizedBox()),
                const SvgIcon(
                  path: 'arrow-forward',
                  color: Colors.grey,
                  height: 10,
                  width: 10,
                ),
                const SizedBox(
                  width: 32,
                )
              ],
            ),
          ),
        ),
        const Divider(
          endIndent: 17,
          indent: 17,
          thickness: 0.1,
          height: 1,
        ),
      ],
    );
  }
}

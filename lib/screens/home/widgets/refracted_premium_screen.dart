import 'package:byb/config/app_theme.dart';
import 'package:byb/screens/home/widgets/refracted_bullet_list_widget.dart';
import 'package:byb/widgets/heading_text.dart';
import 'package:byb/widgets/refracted_appbar.dart';
import 'package:byb/widgets/refracted_button_widget.dart';
import 'package:byb/widgets/subtitle_text.dart';
import 'package:byb/widgets/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RefractedPremiumScreen extends StatelessWidget {
  const RefractedPremiumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: refractedAppBar('Frijo Premium'),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xff3A1212).withOpacity(.09),
                      border: Border.all(color: msgButtonColor)),
                  child: Stack(
                    children: [
                      Image.asset(
                          'assets/images/refer_container_backgroung_image.png'),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Column(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(top: 5.0),
                                  child: HeadingText(
                                    text: "Upgrade to FRIJO premium Now!",
                                    fontSize: 16,
                                    weight: FontWeight.w700,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 5.0),
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: SvgIcon(
                                      path: "premium_card",
                                      height: 200,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const RefractedBulletListWidget(
                            content:
                                'Premium users need to use only 20 ‘Frijo Coins’ for voice call/video call instead of 40 ‘Frijo coins’',
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: RefractedBulletListWidget(
                                content:
                                    "Premium users will be awarded +50 ‘Frijo coins’ extra after uploading video with 20 ‘Frijo coins’"),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 30.0),
                            child: Divider(
                              color: msgButtonColor,
                              thickness: 1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                HeadingText(
                                  text: "Get premium plan for just:",
                                  fontSize: 15,
                                  weight: FontWeight.w700,
                                ),
                                HeadingText(
                                  text: "\$90.00/- ",
                                  fontSize: 18,
                                  weight: FontWeight.bold,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: RefractedButtonWidget(
                  radius: 20,
                  color: const Color(0xff7D0F0A),
                  onPressed: () {},
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: SubtitleText(
                      text: "Buy premium",
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

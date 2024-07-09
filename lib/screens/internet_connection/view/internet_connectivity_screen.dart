import 'package:byb/widgets/heading_text.dart';
import 'package:byb/widgets/refracted_button_widget.dart';
import 'package:byb/widgets/subtitle_text.dart';
import 'package:byb/widgets/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InternetConnectivityScreen extends StatelessWidget {
  const InternetConnectivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SvgIcon(path: "internet_connectivity"),
              Padding(
                padding: EdgeInsets.only(top: 20.h, bottom: 10.h),
                child: const HeadingText(text: "Whoops!"),
              ),
              const SubtitleText(text: "Slow or no internet connections,"),
              const SubtitleText(text: "Please check your internet settings"),
              Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: RefractedButtonWidget(
                  radius: 20,
                  color: const Color(0xff7D0F0A),
                  onPressed: () {},
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: SubtitleText(
                      text: "Try again",
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

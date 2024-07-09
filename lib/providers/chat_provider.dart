import 'package:byb/config/app_theme.dart';
import 'package:byb/widgets/heading_text.dart';
import 'package:byb/widgets/refracted_button_widget.dart';
import 'package:byb/widgets/refracted_dialogbox.dart';
import 'package:byb/widgets/subtitle_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatProvider extends ChangeNotifier {
  TextEditingController sendMessageController = TextEditingController();
  List messages = [
    {
      "message":
          'I am getting error "cmdline-tools component is missing" after installing Flutter and Android Studio... I added the Android SDK. How can I solve them?',
      "type": true,
      "time": "11:30 AM",
    },
    {
      "message":
          "Android toolchain - I develop for Android devices (Android SDK version 30.0.3)",
      "type": true,
      "time": "11:31 AM"
    },
    {
      "message":
          "The solution for me was opening Android Studio and going to SDK Manager, switch to the SDK Tools tab and check Android SDK Command-line Tools (latest).",
      "type": false,
      "time": "11:51 AM"
    },
    {
      "message":
          "Don't forget to add to your PATH the tools and platform-tools folder that are inside your SDK.",
      "type": false,
      "time": "11:51 AM"
    },
  ];

  showTrailEndDialog(context) async {
    await showDialog(
      context: context,
      builder: (context) {
        return RefractedDialogBox(
          trailingPadding: const EdgeInsets.fromLTRB(24, 0, 24, 20),
          titlePadding: const EdgeInsets.fromLTRB(24, 25, 24, 15),
          heading: const HeadingText(
            text: "Your free trial ended!",
          ),
          subTitleText: const SubtitleText(
            text:
                "Do you wish to continue the call?\n1 Frijo Coin will be charged for each 1 minute.",
            maxLines: 4,
            weight: FontWeight.w500,
            textAlign: TextAlign.center,
          ),
          trailingWidgets: [
            RefractedButtonWidget(
              color: callGreen,
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SubtitleText(
                      text: "Continue with Frijo Coins",
                      color: Colors.white,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5.0, top: 5),
                        child: Image.asset(
                          'assets/images/coin.png',
                          height: 20,
                          width: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: primaryColor,
                onPressed: () {},
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Center(
                      child: SubtitleText(
                    text: "End Call",
                    color: Colors.white,
                  )),
                ),
              ),
            )
          ],
        );
      },
    );
  }

  sendMessage(String message) {
    messages.add(
      {
        "message": message,
        "type": true,
        "time": DateFormat('hh:mm a').format(
          DateTime.now(),
        ),
      },
    );
    sendMessageController.clear();
    notifyListeners();
  }
}

import 'dart:developer';
import 'dart:ui';

import 'package:byb/screens/home/widgets/refracted_bullet_list_widget.dart';
import 'package:byb/widgets/heading_text.dart';
import 'package:byb/widgets/refracted_appbar.dart';
import 'package:byb/widgets/refracted_button_widget.dart';
import 'package:byb/widgets/subtitle_text.dart';
import 'package:byb/widgets/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';

class RefractedReferAndEarnCoinsWidget extends StatelessWidget {
  const RefractedReferAndEarnCoinsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    //var provider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: refractedAppBar("Refer and Earn Coins"),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: const Color(0xff868585).withOpacity(.1))),
              child: Stack(
                children: [
                  Image.asset(
                      "assets/images/refer_container_backgroung_image.png"),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Image.asset(
                        'assets/images/coins_background_image_1.png'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            HeadingText(text: "Gather "),
                            HeadingText(
                              text: "FRIJO COINS ",
                              color: Color(0xffB71B30),
                            ),
                            HeadingText(
                              text: "by",
                            )
                          ],
                        ),
                        const HeadingText(text: "referring to a friend!"),
                        const Padding(
                          padding: EdgeInsets.only(top: 15.0),
                          child: SubtitleText(text: "Your Referral Code:"),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.h),
                          child: SizedBox(
                            width: double.infinity,
                            child: RefractedButtonWidget(
                              radius: 20,
                              color: const Color(0xff2F1514),
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SubtitleText(
                                    text: "FRIJOREFUID005A",
                                    color: Colors.white,
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.content_copy_rounded,
                                        color: Colors.grey,
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.only(top: 20.h),
                            child: RefractedButtonWidget(
                              radius: 20,
                              color: const Color(0xff7D0F0A),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 5, sigmaY: 5),
                                      child: Dialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              const Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: 8.0),
                                                child: HeadingText(
                                                  text: "Share and Earn Via:",
                                                  fontSize: 18,
                                                ),
                                              ),
                                              GridView.builder(
                                                shrinkWrap: true,
                                                gridDelegate:
                                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 4),
                                                itemBuilder: (context, index) {
                                                  List<String>
                                                      shareMediaumsLogos = [
                                                    "assets/images/whatsapp.png",
                                                    "assets/images/telegram.png",
                                                    "assets/images/facebook.png",
                                                    "assets/images/linkdl.png",
                                                    "assets/images/instagram.png",
                                                    "assets/images/twitter.png",
                                                    "assets/images/thread.png",
                                                    "assets/images/messege.png"
                                                  ];
                                                  return Image.asset(
                                                      shareMediaumsLogos[
                                                          index]);
                                                },
                                                itemCount: 8,
                                              ),
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: const SubtitleText(
                                                      text: 'Cancel'))
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                                // log("message");
                                // _onShare(context, "n", "joj");
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  SvgIcon(path: "share_1"),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: SubtitleText(
                                      text: "Share to a friend",
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 30.0.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              HeadingText(
                                text: "How does it works?",
                                fontSize: 19,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 15.0),
                                child: RefractedBulletListWidget(
                                    content:
                                        "Invite your friends to register on Frijo by sharing the referral Code."),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 15.0),
                                child: RefractedBulletListWidget(
                                    content:
                                        "When your friend registers on Frijo, both of you will earn 100 Frijocoins."),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onShare(BuildContext context, text, link) async {
    final box = context.findRenderObject() as RenderBox?;

    // subject is optional but it will be used
    // only when sharing content over email

    try {
      await Share.share(text,
          subject: link,
          sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
    } catch (e) {
      log(e.toString());
    }
  }
}

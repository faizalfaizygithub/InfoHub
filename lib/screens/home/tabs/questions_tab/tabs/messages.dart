import 'package:byb/config/app_theme.dart';
import 'package:byb/screens/webRTC/chat/chat_list.dart';
import 'package:byb/services/navigation_service.dart';
import 'package:byb/widgets/subtitle_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../widgets/heading_text.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 12,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            push(context, const ChatList());
          },
          child: ListTile(
            leading: SizedBox(
              height: 56.sp,
              width: 56.sp,
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      height: 54.sp,
                      width: 54.sp,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(colors: [
                            Colors.transparent,
                            primaryColor,
                            Colors.transparent,
                          ])),
                    ),
                  ),
                  Center(
                    child: RotatedBox(
                      quarterTurns: 1,
                      child: Container(
                        height: 54.sp,
                        width: 54.sp,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(colors: [
                              Colors.transparent,
                              primaryColor,
                              Colors.transparent,
                            ])),
                      ),
                    ),
                  ),
                  Center(
                    child: CircleAvatar(
                      radius: 26,
                      backgroundColor: darkBG,
                      child: const CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 24,
                        backgroundImage:
                            AssetImage('assets/images/dummy/dp.png'),
                      ),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.all(6.0),
                      child: CircleAvatar(
                        radius: 4,
                      ),
                    ),
                  )
                ],
              ),
            ),
            title: const HeadingText(
              text: 'Anagha Krishna',
              weight: FontWeight.w500,
              fontSize: 13,
            ),
            subtitle: const SubtitleText(
              text: 'Lorem ipsum dolor sit amerit consectetur. . .',
              fontSize: 10,
            ),
            trailing: Column(
              children: const [
                SubtitleText(
                  text: '10m',
                  fontSize: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:byb/config/app_theme.dart';
import 'package:byb/providers/chat_provider.dart';
import 'package:byb/widgets/heading_text.dart';
import 'package:byb/widgets/subtitle_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../widgets/back_button.dart';
import '../../../widgets/svg_icon.dart';

class CallScreen extends StatefulWidget {
  const CallScreen({super.key});

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ChatProvider>(context, listen: false)
          .showTrailEndDialog(context);
    });
    Timer.periodic(const Duration(seconds: 5), (timer) {});

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 40.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: darkDialogBG,
              child: const SvgIcon(path: 'volume-high'),
            ),
            GestureDetector(
              onTap: () => Provider.of<ChatProvider>(context, listen: false)
                  .showTrailEndDialog(context),
              child: CircleAvatar(
                radius: 25,
                backgroundColor: darkDialogBG,
                child: const SvgIcon(path: 'mic'),
              ),
            ),
            CircleAvatar(
              radius: 25,
              backgroundColor: darkDialogBG,
              child: const SvgIcon(path: 'video_fill'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const CircleAvatar(
                radius: 25,
                child: SvgIcon(path: 'call_end'),
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/images/dummy/caller.png',
            fit: BoxFit.cover,
            width: ScreenUtil().screenWidth,
            colorBlendMode: BlendMode.hue,
            color: Colors.white,
          ),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    end: Alignment.topCenter,
                    begin: Alignment.bottomCenter,
                    colors: [darkBG, darkBG80])),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(18.0),
                  child: SubtitleText(text: 'Ringing...'),
                ),
              ),
              SizedBox(
                  height: 178.sp,
                  width: 178.sp,
                  child: const CallHighlighter()),
              const Padding(
                padding: EdgeInsets.fromLTRB(10, 18, 10, 10),
                child: HeadingText(
                  text: 'Anamika Das',
                  fontSize: 20,
                ),
              ),
              const HeadingText(
                text: '00:00',
                fontSize: 18,
                weight: FontWeight.w500,
              )
            ],
          ),
          SafeArea(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomBackButton(),
                    const HeadingText(
                      text: 'Voice Call',
                      fontSize: 18,
                      weight: FontWeight.w500,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const SvgIcon(
                        path: 'more-v',
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CallHighlighter extends StatefulWidget {
  const CallHighlighter({
    super.key,
  });

  @override
  State<CallHighlighter> createState() => _CallHighlighterState();
}

class _CallHighlighterState extends State<CallHighlighter>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 5000),
      vsync: this,
    );
    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        RotationTransition(
          turns: _controller,
          child: Stack(
            children: [
              Center(
                child: Container(
                  height: 178.sp,
                  width: 178.sp,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(colors: [
                        Colors.transparent,
                        callGreen,
                        Colors.transparent,
                      ])),
                ),
              ),
              Center(
                child: RotatedBox(
                  quarterTurns: 1,
                  child: Container(
                    height: 178.sp,
                    width: 178.sp,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(colors: [
                          Colors.transparent,
                          callGreen,
                          Colors.transparent,
                        ])),
                  ),
                ),
              ),
              Center(
                child: Container(
                  height: 170.sp,
                  width: 170.sp,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: darkBG),
                ),
              ),
            ],
          ),
        ),
        Center(
          child: Container(
            height: 160.sp,
            width: 160.sp,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage(
                      'assets/images/dummy/caller.png',
                    ),
                    fit: BoxFit.cover)),
          ),
        ),
      ],
    );
  }
}

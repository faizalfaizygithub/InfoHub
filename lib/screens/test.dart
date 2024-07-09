import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  bool isLiked = false;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onDoubleTap: () {
          isLiked = !isLiked;
          setState(() {});
          if (isLiked) {
            controller.reverse();
          } else {
            controller.forward();
          }
        },
        child: Container(
          color: Colors.transparent,
          child: Center(
            child: Visibility(
              visible: !isLiked,
              child: LottieBuilder.asset('assets/images/dummy/like.json',
                  controller: controller, repeat: false),
            ),
          ),
        ),
      ),
    );
  }
}

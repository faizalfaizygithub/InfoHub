import 'package:byb/screens/frijo_details/frijo_details.dart';
import 'package:byb/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/heading_text.dart';

class SliderItem extends StatelessWidget {
  final int index;

  const SliderItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(4, 10, 4, 0),
      height: 113.h,
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
          image: const DecorationImage(
              image: AssetImage('assets/images/dummy/slider1.png'),
              fit: BoxFit.cover)),
      child: Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
            onTap: () {
              push(context, FrijoDetails());
            },
            child: Container(
              height: 25.h,
              width: 100.w,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(25)),
              child: const Center(
                child: HeadingText(
                  text: 'Explore',
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContinueButton extends StatelessWidget {
  final bool isValidated;
  final String label;
  final Function()? onTap;

  const ContinueButton(
      {super.key,
      this.isValidated = false,
      this.label = 'Continue',
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
        child: Container(
          height: 40,
          decoration: BoxDecoration(
              //color: const Color(0x20FFFFFF),
              borderRadius: BorderRadius.circular(40)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (isValidated)
                Text(
                  label,
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w700),
                ),
              if (isValidated)
                SizedBox(
                  width: 15.sp,
                ),
              FloatingActionButton.small(
                onPressed: onTap,
                child: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

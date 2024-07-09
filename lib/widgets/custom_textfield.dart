import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';

class CustomTextField extends StatelessWidget {
  final String? hint;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final TextInputType? type;

  const CustomTextField(
      {super.key, this.hint = '', this.controller, this.onChanged, this.type});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    return Container(
      height: 58.sp,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
            width: 0.4.sp,
            color: provider.getCurrentTheme() ? Colors.white : Colors.black),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15.0),
          child: TextField(
            onChanged: onChanged,
            controller: controller,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            keyboardType: type,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hint ?? "",
                hintStyle:  TextStyle(fontSize: 16,color: provider.getCurrentTheme() ? Colors.white : Colors.black)),
          ),
        ),
      ),
    );
  }
}

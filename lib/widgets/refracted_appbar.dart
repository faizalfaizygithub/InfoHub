import 'package:byb/widgets/back_button.dart';
import 'package:byb/widgets/heading_text.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget refractedAppBar(String appBarText) {
  return AppBar(
    toolbarHeight: 110,
    leading: const CustomBackButton(),
    titleSpacing: 10,
    title: HeadingText(
      text: appBarText,
      fontSize: 16,
    ),
  );
}

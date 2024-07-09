import 'package:byb/widgets/heading_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../config/app_theme.dart';
import '../../../providers/theme_provider.dart';
import '../../../widgets/svg_icon.dart';

class TagChip extends StatelessWidget {
  final String label;
  final String? svgPath;
  final Function()? onTap;
  final bool isExplore;
  final bool isSelected;
  final bool isAddFeed;
  final double height;
  final bool isClicked;
  final double radius;
  final Color backGroundColor;

  const TagChip(
      {super.key,
      required this.label,
      this.svgPath,
      this.onTap,
      this.isExplore = false,
      this.isSelected = false,
      this.isAddFeed = false,
      this.height = 26,
      this.isClicked = false,
      this.radius = 25,
      this.backGroundColor = Colors.transparent});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: themeProvider.getCurrentTheme()
            ? Colors.grey[200]
            : Colors.grey[300],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            width: 10,
          ),
          if (isExplore)
            const SvgIcon(
              path: 'explore',
              color: Colors.grey,
            ),
          if (isExplore)
            const SizedBox(
              width: 10,
            ),
          HeadingText(
            text: label,
            fontSize: 12,
            weight: FontWeight.w500,
            color: darkCardColor,
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}

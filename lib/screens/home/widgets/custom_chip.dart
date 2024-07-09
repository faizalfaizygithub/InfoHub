import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../config/app_theme.dart';
import '../../../providers/theme_provider.dart';
import '../../../widgets/svg_icon.dart';

class CustomChip extends StatelessWidget {
  final String label;
  final String? svgPath;
  final Function()? onTap;
  final bool isExplore;
  final bool isSelected;
  final bool isAddFeed;
  final double height;
  final bool isClicked;

  const CustomChip(
      {super.key,
      required this.label,
      this.svgPath,
      this.onTap,
      this.isExplore = false,
      this.isSelected = false,
      this.isAddFeed = false,
      this.height = 26,
      this.isClicked = false});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: isClicked
            ? grey50
            : (label == 'Save' || label == 'Unblock')
                ? primaryColorTrans
                : isExplore
                    ? primaryColorTrans
                    : Colors.transparent,
        border: Border.all(
            color: isExplore
                ? primaryColor
                : isAddFeed
                    ? primaryColor
                    : themeProvider.getCurrentTheme()
                        ? lightDialogBG
                        : darkDialogBG,
            width: 0.5),
        borderRadius: BorderRadius.circular(25),
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
          Padding(
            padding: label == 'Save'
                ? const EdgeInsets.fromLTRB(10, 0, 10, 0)
                : EdgeInsets.zero,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/theme_provider.dart';
import '../../../widgets/svg_icon.dart';

class FeedVideoPicker extends StatelessWidget {
  final Function()? onTap;

  const FeedVideoPicker({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    //double w = ScreenUtil().screenWidth;
    var themeProvider = Provider.of<ThemeProvider>(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(17),
        child: DottedBorder(
          color: Colors.grey,
          dashPattern: const [10],
          radius: const Radius.circular(10),
          borderType: BorderType.RRect,
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: themeProvider.getCurrentTheme()
                    ? const Color(0xFF1f1f1f)
                    : const Color(0xffEFEFEF),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SvgIcon(
                    path: 'gallery-add new',
                    color: Colors.grey,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      8,
                      15,
                      8,
                      8,
                    ),
                    child: Text('Select a video from Gallery'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

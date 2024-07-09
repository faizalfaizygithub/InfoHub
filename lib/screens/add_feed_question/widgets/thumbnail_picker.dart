import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../providers/theme_provider.dart';
import '../../../widgets/svg_icon.dart';

class ThumbnailPicker extends StatelessWidget {
  final Function()? onTap;

  const ThumbnailPicker({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    // double w = ScreenUtil().screenWidth;
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(17),
      child: GestureDetector(
        onTap: onTap,
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: DottedBorder(
            color: Colors.grey,
            dashPattern: const [10],
            radius: const Radius.circular(10),
            borderType: BorderType.RRect,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: themeProvider.getCurrentTheme()
                    ? const Color(0xFF1f1f1f)
                    : const Color(0xffEFEFEF),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgIcon(
                    path: 'gallery new',
                    color: Colors.grey,
                    height: 30.h,
                    width: 30.w,
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(
                      8,
                      15,
                      8,
                      8,
                    ),
                    child: Text(
                      'Add a Thumbnail ( 16 : 9 )',
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
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

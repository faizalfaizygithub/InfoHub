import 'dart:io';
import 'dart:ui';

import 'package:byb/widgets/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/theme_provider.dart';

class ThumbnailPreview extends StatelessWidget {
  final Function()? onTap;
  final Function()? onDelete;
  final String file;

  const ThumbnailPreview(
      {super.key, this.onTap, required this.file, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    //   double w = ScreenUtil().screenWidth;
    var themeProvider = Provider.of<ThemeProvider>(context);
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.all(17),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Container(
            // height: 100.h,
            // width: 100.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: themeProvider.getCurrentTheme()
                  ? const Color(0xFF1f1f1f)
                  : const Color(0xffEFEFEF),
            ),
            child: Stack(
              children: [
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: themeProvider.getCurrentTheme()
                          ? const Color(0xFF1f1f1f)
                          : const Color(0xffEFEFEF),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.file(
                          File(file),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: ClipRRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                        child: InkWell(
                          onTap: onDelete,
                          child: const CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.white30,
                            child: SvgIcon(
                              path: 'close',
                              height: 30,
                              width: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

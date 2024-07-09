import 'dart:io';
import 'dart:ui';

import 'package:byb/widgets/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../../../providers/theme_provider.dart';

class FeedVideoPreview extends StatefulWidget {
  final Function()? onTap;
  final Function()? onDelete;
  final XFile file;

  const FeedVideoPreview(
      {super.key, this.onTap, required this.file, required this.onDelete});

  @override
  State<FeedVideoPreview> createState() => _FeedVideoPreviewState();
}

class _FeedVideoPreviewState extends State<FeedVideoPreview> {
  late VideoPlayerController controller;

  @override
  void initState() {
    controller = VideoPlayerController.file(File(widget.file.path));
    controller.initialize().then((value) {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // double w = ScreenUtil().screenWidth;
    var themeProvider = Provider.of<ThemeProvider>(context);
    return GestureDetector(
      onTap: widget.onTap,
      child: Card(
        margin: const EdgeInsets.all(17),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Container(
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
                    height: controller.value.size.height / 2,
                    width: controller.value.size.width / 2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: themeProvider.getCurrentTheme()
                          ? const Color(0xFF1f1f1f)
                          : const Color(0xffEFEFEF),
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: VideoPlayer(controller)),
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
                          onTap: widget.onDelete,
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

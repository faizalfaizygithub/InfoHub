import 'dart:developer';
import 'dart:io';
import 'package:byb/screens/home/widgets/potrait_controlls.dart';

import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class PreviewVideo extends StatefulWidget {
  final String url;
  final VideoPlayerController videoPlayerController;

  const PreviewVideo(
      {super.key, required this.url, required this.videoPlayerController});

  @override
  State<PreviewVideo> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<PreviewVideo> {
  // VideoPlayerController? videoPlayerController;

  FlickManager? flickManager;
  bool isLiked = false;

  @override
  void initState() {
    log('The url is ${widget.url}');
    // videoPlayerController = VideoPlayerController.network(widget.url);
    // videoPlayerController?.initialize().then((value) {
    //   setState(() {});
    // });

    widget.videoPlayerController.initialize().then((value) {
      // flickManager = FlickManager(
      //     autoPlay: false, videoPlayerController: widget.videoPlayerController);
    });

    // videoPlayerController?.initialize().then((value) {
    //   setState(() {
    //     chewieController = ChewieController(
    //         autoInitialize: true,
    //         autoPlay: true,
    //         videoPlayerController: videoPlayerController!,
    //         aspectRatio: videoPlayerController!.value.aspectRatio);
    //   });
    // });

    super.initState();
  }

  @override
  void dispose() {
    // videoPlayerController!.dispose();
    // if (chewieController != null) {
    //   chewieController!.dispose();
    // }

    if (flickManager != null) {
      flickManager!.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //var themeProvider = Provider.of<ThemeProvider>(context);
    return VisibilityDetector(
      key: ObjectKey(flickManager),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.9) {
          flickManager?.flickControlManager?.play();
        } else {
          flickManager?.flickControlManager?.pause();
        }
      },
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: const [
                  // const Spacer(),
                  // const Center(child: Text("Preview"),),
                  Spacer(),
                ],
              ),
              SizedBox(
                height: 220.h,
                width: ScreenUtil().screenWidth,
                child: flickManager == null
                    ? Stack(
                        children: [
                          Image.file(
                            File(widget.url),
                            width: ScreenUtil().screenWidth,
                            fit: BoxFit.cover,
                          ),
                          Center(
                            child: InkWell(
                              onTap: () {
                                flickManager = FlickManager(
                                    autoPlay: true,
                                    videoPlayerController:
                                        widget.videoPlayerController);
                                setState(() {});
                              },
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.white, width: 2),
                                  color: Colors.white24,
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Image.asset(
                                    "assets/images/logo_white.png",
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    : Stack(
                        children: [
                          FlickVideoPlayer(
                            flickManager: flickManager!,
                            flickVideoWithControls:
                                const FlickVideoWithControls(
                              videoFit: BoxFit.contain,
                              controls: CustomPotraitControll(),
                            ),
                          ),
                          //              InkWell(
                          //   onTap: (){
                          //     Navigator.pop(context);
                          //   },
                          //   child: Padding(
                          //     padding: const EdgeInsets.all(10.0),
                          //     child: Align(
                          //         alignment: Alignment.topRight,
                          //         child: CircleAvatar(
                          //           radius: 10,

                          //           backgroundColor: lightBG,

                          //           child: const SvgIcon(
                          //             path: 'close',
                          //             height: 20,
                          //             width: 20,
                          //           ),
                          //         )),
                          //   ),
                          // ),
                        ],
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

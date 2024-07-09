import 'dart:developer';

import 'package:byb/providers/theme_provider.dart';
import 'package:byb/screens/home/widgets/potrait_controlls.dart';
import 'package:byb/screens/profile/profile.dart';
import 'package:byb/services/navigation_service.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:like_button/like_button.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../widgets/heading_text.dart';
import '../../../widgets/subtitle_text.dart';
import '../../../widgets/svg_icon.dart';

class VideoWidget extends StatefulWidget {
  final String url;
  final VideoPlayerController videoPlayerController;

  const VideoWidget(
      {super.key, required this.url, required this.videoPlayerController});

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
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

    widget.videoPlayerController.initialize().then((value) {});

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
    var themeProvider = Provider.of<ThemeProvider>(context);
    return VisibilityDetector(
      key: ObjectKey(flickManager),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.9) {
          flickManager?.flickControlManager?.play();
        } else {
          flickManager?.flickControlManager?.pause();
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    push(context, const Profile());
                  },
                  child: const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/dummy/dp.png'),
                  ),
                ),
                InkWell(
                  onTap: () {
                    push(context, const Profile());
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HeadingText(
                          text: 'Anagha Krishna',
                          fontSize: 13,
                        ),
                        SubtitleText(
                          text: '5 Days Ago',
                          fontSize: 11,
                          weight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ),
                ),
                const Expanded(child: SizedBox()),
                GestureDetector(
                  onTap: () {
                    push(context, const Profile());
                    //  push(context, const InternetConnectivityScreen());
                  },
                  child: Container(
                    width: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: themeProvider.getCurrentTheme()
                            ? Colors.white.withOpacity(.1)
                            : Colors.transparent.withOpacity(.06)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const SvgIcon(
                            color: Colors.black,
                            path: "profile-add",
                            height: 20,
                            width: 20,
                          ),
                          SubtitleText(
                            text: "Follow",
                            fontSize: 12.sp,
                          ),
                          const SizedBox(
                            width: 5,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Stack(
          //   alignment: Alignment.center,
          //   children: [
          //     SizedBox(
          //       height: .25.sh,
          //       width: double.infinity,
          //       child: Image.network(
          //         widget.url,
          //         fit: BoxFit.cover,
          //       ),
          //     ),
          //     Center(
          //       child: CircleAvatar(
          //         radius: 28,
          //         backgroundColor: Colors.white70,
          //         child: Padding(
          //           padding: const EdgeInsets.only(top: 3),
          //           child: Image.asset(
          //             "assets/images/logo3.png",
          //             height: 30,
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),

          // if (chewieController != null) Chewie(controller: chewieController!),
          SizedBox(
            height: 220.h,
            width: ScreenUtil().screenWidth,
            child: flickManager == null
                ? Stack(
                    children: [
                      Image.network(
                        widget.url,
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
                              border: Border.all(color: Colors.white, width: 2),
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
                : FlickVideoPlayer(
                    flickManager: flickManager!,
                    flickVideoWithControls: const FlickVideoWithControls(
                      videoFit: BoxFit.contain,
                      controls: CustomPotraitControll(),
                    ),
                  ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Center(
              child: SubtitleText(
                text:
                    'Lorem ipsum dolor sit amet consectetur. Leo ac lorem faucli bus facilisis tellus. At vitae dis commodo nunc sollicitudin elementum suspendisse',
                maxLines: 2,
              ),
            ),
          ),
          Divider(
            height: 0,
            thickness: 2,
            color: themeProvider.getCurrentTheme()
                ? Colors.white.withOpacity(.1)
                : Colors.transparent.withOpacity(.06),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(17, 4, 17, 4),
            child: Row(
              children: [
                SvgIcon(path: 'like'),
                SizedBox(
                  width: 5,
                ),
                Text('10,455')
              ],
            ),
          ),
          const Divider(
            indent: 20,
            endIndent: 20,
            height: 1,
            thickness: 0.2,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(17, 4, 17, 4),
            child: SizedBox(
              height: 26,
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LikeButton(
                          size: 20,
                          likeBuilder: (isLike) {
                            return isLike
                                ? const SvgIcon(path: 'like')
                                : const SvgIcon(
                                    path: 'like-outline',
                                    color: Colors.grey,
                                  );
                          },
                          isLiked: !isLiked,
                          onTap: (isLike) async {
                            setState(() {
                              isLiked = isLike;
                            });
                            return !isLiked;
                          },
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        // const SubtitleText(text: 'Like')
                      ],
                    ),
                  ),
                  const VerticalDivider(
                    indent: 10,
                    endIndent: 10,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LikeButton(
                          size: 20,
                          likeBuilder: (isLike) {
                            return isLike
                                ? const SvgIcon(
                                    path: 'dislike',
                                  )
                                : const SvgIcon(
                                    path: 'dislike-outline',
                                    color: Colors.grey,
                                  );
                          },
                          // isLiked: !isLiked,
                          // onTap: (isLike) async {
                          //   setState(() {
                          //     isLiked = isLike;
                          //   });
                          //   return !isLiked;
                          // },
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        // const SubtitleText(text: 'Dislike')
                      ],
                    ),
                  ),
                  const VerticalDivider(
                    indent: 10,
                    endIndent: 10,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LikeButton(
                          size: 20,
                          likeBuilder: (isLiked) => isLiked
                              ? SvgIcon(
                                  path: 'bookmark_fill',
                                  color: !themeProvider.getCurrentTheme()
                                      ? Colors.white
                                      : Colors.black,
                                )
                              : const SvgIcon(
                                  path: 'bookmark',
                                  color: Colors.grey,
                                ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        // const Expanded(child: SubtitleText(text: 'Bookmark'))
                      ],
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        //share video
                        // showDialog(
                        //   context: context,
                        //   builder: (context) {
                        //     return BackdropFilter(
                        //       filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                        //       child: Dialog(
                        //         shape: RoundedRectangleBorder(
                        //             borderRadius: BorderRadius.circular(15)),
                        //         child: Padding(
                        //           padding: const EdgeInsets.all(15.0),
                        //           child: Column(
                        //             mainAxisSize: MainAxisSize.min,
                        //             children: [
                        //               const Padding(
                        //                 padding: EdgeInsets.only(bottom: 8.0),
                        //                 child: HeadingText(
                        //                   text: "Share Video to :",
                        //                   fontSize: 18,
                        //                 ),
                        //               ),
                        //               GridView.builder(
                        //                 shrinkWrap: true,
                        //                 gridDelegate:
                        //                     const SliverGridDelegateWithFixedCrossAxisCount(
                        //                         crossAxisCount: 3),
                        //                 itemBuilder: (context, index) {
                        //                   List<String> shareMediaumsLogos = [
                        //                     "assets/images/whatsapp.png",
                        //                    // "assets/images/telegram.png",
                        //                     "assets/images/facebook.png",
                        //                    // "assets/images/linkdl.png",
                        //                     "assets/images/instagram.png",
                        //                    // "assets/images/twitter.png",
                        //                     // "assets/images/thread.png",
                        //                     // "assets/images/messege.png"
                        //                   ];
                        //                   return Image.asset(
                        //                       shareMediaumsLogos[index]);
                        //                 },
                        //                 itemCount: 6,
                        //               ),
                        //               TextButton(
                        //                   onPressed: () {
                        //                     Navigator.pop(context);
                        //                   },
                        //                   child: SubtitleText(text: 'Cancel'))
                        //             ],
                        //           ),
                        //         ),
                        //       ),
                        //     );
                        //   },
                        // );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgIcon(
                            path: 'share',
                            color: themeProvider.getCurrentTheme()
                                ? Colors.white
                                : Colors.black,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          // const Expanded(child: SubtitleText(text: 'Bookmark'))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: themeProvider.getCurrentTheme()
                ? const Color(0xff101010)
                : Colors.grey.withOpacity(0.2),
            height: 5,
          )
        ],
      ),
    );
  }
}

// FlickVideoWithControls(controls: FlickAutoHideChild(
//           showIfVideoNotInitialized: false,
//           autoHide: true,
//           child: Container(
//             child: Center(child: flickManager?.flickVideoManager?.isPlaying==true?InkWell(
//               onTap: (){
//                 flickManager?.flickControlManager?.pause();
//                 setState(() {
             
//                 });
//               },
//               child: Icon(Icons.pause)):InkWell(
//                 onTap: (){
//                   flickManager?.flickControlManager?.play();
//                   setState(() {
                    
//                   });
//                 },
//                 child: SvgIcon(path: "logo2",height: 20,)),),
//           ),
//         ),)

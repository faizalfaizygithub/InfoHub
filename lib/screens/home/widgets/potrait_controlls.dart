import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';

class CustomPotraitControll extends StatelessWidget {
  const CustomPotraitControll({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: FlickShowControlsAction(
            child: FlickSeekVideoAction(
              child: Center(
                child: FlickVideoBuffer(
                  child: FlickAutoHideChild(
                    showIfVideoNotInitialized: false,
                    child: FlickPlayToggle(
                      playChild: Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: Image.asset(
                          "assets/images/logo_white.png",
                          height: 25,
                          width: 25,
                        ),
                      ),
                      size: 30,
                      color: Colors.black,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 2),
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: FlickAutoHideChild(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FlickVideoProgressBar(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const FlickPlayToggle(
                        size: 20,
                      ),
                      const SizedBox(
                        width: 20 / 2,
                      ),
                      const FlickSoundToggle(
                        size: 20,
                      ),
                      const SizedBox(
                        width: 20 / 2,
                      ),
                      const Row(
                        children: <Widget>[
                          FlickCurrentPosition(
                            fontSize: 12,
                          ),
                          FlickAutoHideChild(
                            child: Text(
                              ' / ',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                          FlickTotalDuration(
                            fontSize: 12,
                          ),
                        ],
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      const FlickSubtitleToggle(
                        size: 12,
                      ),
                      const SizedBox(
                        width: 20 / 2,
                      ),
                      const FlickFullScreenToggle(
                        size: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

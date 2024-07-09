import 'package:byb/providers/feeds_provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../widgets/custom_chip.dart';
import '../widgets/slider_item.dart';
import '../widgets/video_widget.dart';

class HomeTab extends StatefulWidget {
  final GlobalKey<ScaffoldState> sKey;

  const HomeTab({super.key, required this.sKey});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final ScrollController scrollController = ScrollController();
  int centerIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var feedsProvider = Provider.of<FeedsProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: 113.h,
                width: ScreenUtil().screenWidth,
                child: CarouselSlider.builder(
                    itemCount: 3,
                    itemBuilder: (context, index, realIndex) => SliderItem(
                          index: index,
                        ),
                    options: CarouselOptions(
                        viewportFraction: 0.9.w, autoPlay: true)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 10),
                child: SizedBox(
                  height: 32,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: feedsProvider.categories.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (index != 0) {
                              feedsProvider.switchCategory(index);
                              feedsProvider.sortFeeds(index);
                            }
                          },
                          child: CustomChip(
                            label: feedsProvider.categories[index],
                            isExplore: index == 0,
                            isClicked: index != 0 &&
                                index == feedsProvider.selectedCat,
                          ),
                        ),
                        if (index == 0)
                          const VerticalDivider(
                            color: Colors.grey,
                            width: 25,
                          )
                        else
                          const SizedBox(
                            width: 10,
                          ),
                      ],
                    ),
                    // children: const [
                    //   CustomChip(
                    //     label: 'Explore',
                    //     isExplore: true,
                    //   ),
                    //   VerticalDivider(
                    //     color: Colors.grey,
                    //     width: 25,
                    //   ),
                    //   CustomChip(
                    //     label: 'All Categories',
                    //     isClicked: feedsProvider.selectedCat==index?,
                    //   ),
                    //   SizedBox(
                    //     width: 10,
                    //   ),
                    //   CustomChip(
                    //     label: 'Physics',
                    //   ),
                    //   SizedBox(
                    //     width: 10,
                    //   ),
                    //   CustomChip(label: 'Chemistry'),
                    //   SizedBox(
                    //     width: 10,
                    //   ),
                    //   CustomChip(label: 'Mathematics'),
                    //   SizedBox(
                    //     width: 10,
                    //   ),
                    // ],
                  ),
                ),
              ),
              ListView.builder(
                controller: scrollController,
                padding: const EdgeInsets.only(top: 10.0),
                itemCount: feedsProvider.sortedFeeds.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => Padding(
                  padding: index + 1 == feedsProvider.sortedFeeds.length
                      ? EdgeInsets.only(bottom: 85.sp)
                      : EdgeInsets.zero,
                  child: VideoWidget(
                    url: feedsProvider.sortedFeeds[index]['thumbnail'],
                    videoPlayerController:
                        //  feedsProvider.sortedFeeds[index]
                        //                 ['link']
                        //             .toString() ==
                        //         ("assets/images/From.S02E10.1080p.10bit.WEBRip.6CH.x265.HEVC-PSA.mkv")
                        //     ? VideoPlayerController.asset(
                        //         feedsProvider.sortedFeeds[index]['link'])
                        //     :
                        VideoPlayerController.network(
                            feedsProvider.sortedFeeds[index]['link']),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:byb/providers/search_provider.dart';
import 'package:byb/screens/home/widgets/custom_chip.dart';
import 'package:byb/screens/profile/tabs/videos.dart';
import 'package:byb/screens/registration/pick_cat.dart';
import 'package:byb/widgets/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../../../services/navigation_service.dart';
import '../../../widgets/heading_text.dart';
import '../../../widgets/subtitle_text.dart';
import '../../profile/profile.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  var searchProvider = SearchProvider();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      searchProvider.getThumbnails();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    searchProvider = Provider.of<SearchProvider>(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 85.h,
        title: const HeadingText(
          text: 'Search',
          fontSize: 20,
        ),
        actions: [
          GestureDetector(
            onTap: () {
              push(context, const Profile());
            },
            child: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/dummy/dp.png'),
              radius: 23,
            ),
          ),
          const SizedBox(
            width: 17,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(17.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SearchTextField(),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 32,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: searchProvider.categories.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(right: 6.0),
                    child: CustomChip(
                        label: searchProvider.categories[index]['title']),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const HeadingText(
                    text: 'Recent Search',
                    weight: FontWeight.w500,
                    fontSize: 14,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SubtitleText(text: 'See All'),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Iconsax.arrow_circle_right,
                          size: 15,
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                height: 90,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: searchProvider.recentProfiles.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(right: 6.0),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: SizedBox(
                        width: 50,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundImage: AssetImage(
                                  'assets/images/dummy/${searchProvider.recentProfiles[index]['image']}.png'),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            SubtitleText(
                              text: searchProvider.recentProfiles[index]
                                  ['name'],
                              height: 1,
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              weight: FontWeight.w600,
                              fontSize: 13,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: searchProvider.recentSearchText.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Row(
                    children: [
                      SubtitleText(
                        text: "# ${searchProvider.recentSearchText[index]}",
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const SvgIcon(
                        path: 'arrow_corner',
                        height: 14,
                        width: 14,
                      )
                    ],
                  ),
                ),
              ),
              const Row(
                children: [
                  HeadingText(
                    text: 'Recommended Videos',
                    fontSize: 14,
                    weight: FontWeight.w500,
                  ),
                  Expanded(
                      child: Divider(
                    indent: 10,
                    thickness: 0.4,
                  ))
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                      childAspectRatio: 0.85),
                  itemCount: searchProvider.recommendedVideos.length,
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Stack(
                        children: [
                          Image.network(
                            searchProvider.recommendedVideos[index],
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          const Center(
                            child: PlayButtonCustom(),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  end: Alignment.topCenter,
                                  begin: Alignment.bottomCenter,
                                  colors: [
                                    Color.fromARGB(179, 0, 0, 0),
                                    Colors.transparent,
                                    Colors.transparent
                                  ]),
                            ),
                          ),
                          const Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: SubtitleText(
                                  text:
                                      "In Math's geometry, students learn about shapes, angles, and measurements",
                                  maxLines: 2,
                                ),
                              ))
                        ],
                      ),
                    );
                  }),
              const SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}

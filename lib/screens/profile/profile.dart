import 'dart:developer';

import 'package:byb/config/app_theme.dart';
import 'package:byb/providers/profile_provider.dart';
import 'package:byb/providers/theme_provider.dart';
import 'package:byb/screens/home/widgets/custom_chip.dart';
import 'package:byb/screens/profile/edit_profile.dart';
import 'package:byb/screens/profile/tabs/questions.dart';
import 'package:byb/screens/profile/tabs/saved.dart';
import 'package:byb/screens/profile/tabs/videos.dart';
import 'package:byb/services/navigation_service.dart';
import 'package:byb/widgets/heading_text.dart';
import 'package:byb/widgets/subtitle_text.dart';
import 'package:byb/widgets/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  final bool isMyProfile;

  const Profile({super.key, this.isMyProfile = false});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  ScrollController scrollController = ScrollController();
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double w = ScreenUtil().screenWidth;
    double h = ScreenUtil().screenHeight;
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      // floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: Stack(
        children: [
          SizedBox(
            height: h / 2,
            child: Stack(
              children: [
                Opacity(
                  opacity: 0.20,
                  child: SvgIcon(
                    path: 'profile_dec',
                    width: w,
                    color: Colors.grey,
                  ),
                ),
                if (!widget.isMyProfile)
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 60.h, 15, 0),
                      child: CustomMenuButton(
                        themeProvider: themeProvider,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          SafeArea(
            child: SizedBox(
              height: h / 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: SizedBox(
                      height: 126.h,
                      width: 126.h,
                      child: Stack(
                        children: [
                          const Center(child: SvgIcon(path: 'ring')),
                          Center(
                            child: Image.asset('assets/images/dummy/dp.png'),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: HeadingText(
                      text: 'Maria George',
                      fontSize: 20,
                      weight: FontWeight.w500,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: SubtitleText(
                      text:
                          'MBA graduate with a deep interest in AI. Applying AI to drive innovation.',
                      maxLines: 4,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            HeadingText(text: '12'),
                            SubtitleText(text: 'Posts')
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            HeadingText(text: '658'),
                            SubtitleText(text: 'Followers')
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            HeadingText(text: '200'),
                            SubtitleText(text: 'Following')
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      push(context, const EditProfile());
                    },
                    child: const CustomChip(
                      label: 'Edit Profile',
                      height: 32,
                    ),
                  )
                ],
              ),
            ),
          ),
          DraggableScrollableSheet(
            expand: true,
            minChildSize: 0.45,
            maxChildSize: 0.9,
            initialChildSize: 0.45,
            builder: (context, scrollController) => Container(
              height: h * 0.9,
              decoration: BoxDecoration(
                color:
                    themeProvider.getCurrentTheme() ? darkCardColor : lightBG,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              child: ListView(
                controller: scrollController,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.only(top: 15),
                children: [
                  TabBar(
                    controller: tabController,
                    tabs: [
                      TabItem(
                        icon: Icon(
                          Iconsax.video_play,
                          color: themeProvider.getCurrentTheme()
                              ? Colors.white
                              : Colors.black,
                        ),
                        label: 'Videos',
                      ),
                      TabItem(
                        icon: Icon(
                          Iconsax.messages_1,
                          color: themeProvider.getCurrentTheme()
                              ? Colors.white
                              : Colors.black,
                        ),
                        label: 'Questions',
                      ),
                      const TabItem(
                        icon: SvgIcon(
                          path: 'bookmark',
                          color: Colors.grey,
                        ),
                        label: 'Saved',
                      ),
                    ],
                    labelPadding: const EdgeInsets.only(top: 10, bottom: 10),
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorPadding:
                        const EdgeInsets.fromLTRB(20, 43.5, 20, 0),
                    indicator: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8)),
                        color: primaryColor),
                  ),
                  SizedBox(
                    height: (h * 0.9) - kToolbarHeight,
                    child: TabBarView(
                        controller: tabController,
                        children: const [
                          VideosTab(),
                          QuestionsTabProfile(),
                          SavedTab()
                        ]),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomMenuButton extends StatelessWidget {
  final ThemeProvider themeProvider;

  const CustomMenuButton({super.key, required this.themeProvider});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
              border: Border.all(
                  width: 0.5,
                  color: themeProvider.getCurrentTheme()
                      ? Colors.white
                      : Colors.black),
              shape: BoxShape.circle),
          child: Theme(
            data: Theme.of(context).copyWith(
              popupMenuTheme: const PopupMenuThemeData(
                  color: Colors.transparent, elevation: 0),
            ),
            child: PopupMenuButton(
              padding: const EdgeInsets.all(0),
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: CustomPopUpMenu(
                    themeProvider: themeProvider,
                    isUser: false,
                  ),
                ),
              ],
              icon: const Icon(
                Icons.more_horiz,
                size: 20,
              ),
            ),
          )),
    );
  }
}

class CustomPopUpMenu extends StatelessWidget {
  final ThemeProvider themeProvider;
  final bool isUser;

  const CustomPopUpMenu(
      {super.key, required this.themeProvider, this.isUser = true});

  @override
  Widget build(BuildContext context) {
    var profileProvider = Provider.of<ProfileProvider>(context);
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
      decoration: BoxDecoration(
          border: Border.all(
              color: themeProvider.getCurrentTheme()
                  ? Colors.white24
                  : Colors.black12,
              width: 0.5),
          color: themeProvider.getCurrentTheme() ? darkCardColor : Colors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            if (isUser)
              ListTile(
                minLeadingWidth: 0,
                leading: Icon(
                  Iconsax.trash,
                  //size: 20,
                  color: themeProvider.getCurrentTheme()
                      ? Colors.white
                      : Colors.black,
                ),
                title: const SubtitleText(text: 'Delete Account'),
                onTap: () {
                  log('Clicked delete');
                  Navigator.pop(context);

                  profileProvider.confirmDeleteUserAccount();
                },
              ),
            if (!isUser)
              ListTile(
                minLeadingWidth: 0,
                leading: Icon(
                  Iconsax.warning_2,
                  // size: 20,
                  color: themeProvider.getCurrentTheme()
                      ? Colors.white
                      : Colors.black,
                ),
                title: const SubtitleText(text: 'Report User'),
                onTap: () {
                  log('Clicked report');
                  Navigator.pop(context);

                  profileProvider.confirmReportUser();
                },
              ),
            if (!isUser)
              Divider(
                height: 1,
                endIndent: 20,
                indent: 20,
                thickness: 0.2,
                color: darkDividerColor,
              ),
            if (!isUser)
              ListTile(
                minLeadingWidth: 0,
                leading: const SvgIcon(
                  path: 'profile-block',
                  color: Colors.grey,
                  height: 22,
                  width: 22,
                ),
                title: const SubtitleText(text: 'Block User'),
                onTap: () {
                  log('Clicked report');
                  Navigator.pop(context);
                  profileProvider.confirmBlockUser();
                },
              ),
          ],
        ),
      ),
    );
  }
}

class TabItem extends StatelessWidget {
  final String label;
  final Widget icon;

  const TabItem({super.key, required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon,
        const SizedBox(
          width: 10,
        ),
        SubtitleText(text: label),
      ],
    );
  }
}

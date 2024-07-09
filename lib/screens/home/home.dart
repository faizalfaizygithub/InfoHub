import 'dart:developer';

import 'package:byb/providers/home_provider.dart';
import 'package:byb/screens/coins/coins.dart';
import 'package:byb/screens/home/tabs/home_tab.dart';
import 'package:byb/screens/home/tabs/notification_tab.dart';
import 'package:byb/screens/home/tabs/questions_tab/questions_tab.dart';
import 'package:byb/screens/home/tabs/search_tab.dart';
import 'package:byb/screens/profile/profile.dart';
import 'package:byb/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../config/app_theme.dart';
import '../../providers/theme_provider.dart';
import '../../widgets/heading_text.dart';
import '../../widgets/subtitle_text.dart';
import '../../widgets/svg_icon.dart';
import '../help_center/help_chat.dart';
import 'widgets/custom_drawer.dart';
import 'widgets/destination_item.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController pageController = PageController();
  GlobalKey<ScaffoldState> sKey = GlobalKey();
  int page = 0;

  var themeProvider = ThemeProvider();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      themeProvider.setTheme().then((value) {
        themeProvider.switchTheme(value);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var homeProvider = Provider.of<HomeProvider>(context);
    themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      key: sKey,
      drawer: const CustomDriver(),
      appBar: PreferredSize(
        preferredSize: const Size(0, 51),
        child: SafeArea(
          child: page == 0
              ? Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 5),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                          onTap: () {
                            sKey.currentState!.openDrawer();
                          },
                          child: const SvgIcon(
                            path: 'drawer',
                            color: Colors.grey,
                          )),
                      const SizedBox(
                        width: 25,
                      ),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          HeadingText(
                            text: 'Hello Maria',
                            fontSize: 14.sp,
                          ),
                          SubtitleText(
                            text: 'Welcome back to section',
                            fontSize: 10.sp,
                          )
                        ],
                      )),
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: primaryColorTrans,
                          border: Border.all(color: primaryColor, width: 0.5),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                push(context, const Coins());
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Image.asset('assets/images/coin.png'),
                              ),
                            ),
                            HeadingText(
                              text: '2.2k ',
                              fontSize: 12.sp,
                            ),
                            GestureDetector(
                              onTap: () {
                                push(
                                    context,
                                    const Profile(
                                      isMyProfile: true,
                                    ));
                              },
                              child: Container(
                                height: 40,
                                width: 35,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(35),
                                    image: const DecorationImage(
                                        image: AssetImage(
                                            'assets/images/dummy/dp.png'))),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                )
              : const SizedBox(),
        ),
      ),
      //  floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 100),
        child: FloatingActionButton(
          onPressed: () {
            push(context, const HelpChat());
          },
          child: const Icon(Icons.support_agent),
        ),
      ),
      body: Stack(
        children: [
          PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            onPageChanged: (value) {
              homeProvider.changePage(value);
            },
            children: [
              HomeTab(
                sKey: sKey,
              ),
              const QuestionsTab(),
              Container(),
              const SearchTab(),
              const NotificationTab(),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.fromLTRB(8.w, 0, 8.w, 15.w),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(27),
                child: NavigationBar(
                    height: 82.h,
                    onDestinationSelected: (page) {
                      log('Clicked $page');
                    },
                    selectedIndex: homeProvider.selectedIndex,
                    destinations: [
                      DestinationItem(
                        label: 'Feeds',
                        isSelected: homeProvider.selectedIndex == 0,
                        svgPath: 'home',
                        onTap: () {
                          setState(() {
                            page = 0;
                          });
                          homeProvider.changePage(0);
                          pageController.jumpToPage(0);
                        },
                      ),
                      DestinationItem(
                        label: 'Questions',
                        isSelected: homeProvider.selectedIndex == 1,
                        svgPath: 'messages',
                        onTap: () {
                          setState(() {
                            page = 1;
                          });
                          homeProvider.changePage(1);
                          pageController.jumpToPage(1);
                        },
                      ),
                      DestinationItem(
                        label: '',
                        isSelected: false,
                        svgPath: 'add',
                        onTap: () {
                          // setState(() {
                          //   page = 2;
                          // });
                          homeProvider.addPostSheet();
                        },
                        isCenter: true,
                      ),
                      DestinationItem(
                        label: 'Search',
                        isSelected: homeProvider.selectedIndex == 3,
                        svgPath: 'search',
                        onTap: () {
                          setState(() {
                            page = 3;
                          });
                          homeProvider.changePage(3);
                          pageController.jumpToPage(3);
                        },
                      ),
                      DestinationItem(
                        label: 'Notification',
                        isSelected: homeProvider.selectedIndex == 4,
                        svgPath: 'noti',
                        onTap: () {
                          setState(() {
                            page = 4;
                          });
                          homeProvider.changePage(4);
                          pageController.jumpToPage(4);
                        },
                      ),
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../providers/home_provider.dart';
import 'destination_item.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar(
      {super.key, required this.homeProvider, this.onTap});

  final HomeProvider homeProvider;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                label: 'Home',
                isSelected: homeProvider.selectedIndex == 0,
                svgPath: 'home',
                onTap: () {
                  homeProvider.changePage(0);
                },
              ),
              DestinationItem(
                label: 'Notification',
                isSelected: homeProvider.selectedIndex == 1,
                svgPath: 'noti',
                onTap: () {
                  homeProvider.changePage(1);
                },
              ),
              DestinationItem(
                label: '',
                isSelected: false,
                svgPath: 'add',
                onTap: () {
                  //goto add feeds page
                },
                isCenter: true,
              ),
              DestinationItem(
                label: 'Search',
                isSelected: homeProvider.selectedIndex == 3,
                svgPath: 'search',
                onTap: () {
                  homeProvider.changePage(3);
                },
              ),
              DestinationItem(
                label: 'Questions',
                isSelected: homeProvider.selectedIndex == 4,
                svgPath: 'messages',
                onTap: () {
                  homeProvider.changePage(4);
                },
              ),
            ]),
      ),
    );
  }
}

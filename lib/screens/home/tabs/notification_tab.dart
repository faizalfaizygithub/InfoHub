import 'package:byb/config/app_theme.dart';
import 'package:byb/providers/notification_provider.dart';
import 'package:byb/providers/theme_provider.dart';
import 'package:byb/screens/profile/profile.dart';
import 'package:byb/services/navigation_service.dart';
import 'package:byb/widgets/heading_text.dart';
import 'package:byb/widgets/subtitle_text.dart';
import 'package:byb/widgets/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class NotificationTab extends StatefulWidget {
  const NotificationTab({super.key});

  @override
  State<NotificationTab> createState() => _NotificationTabState();
}

class _NotificationTabState extends State<NotificationTab> {
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    var notificationProvider = Provider.of<NotificationProvider>(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 85.h,
        title: const HeadingText(
          text: 'Notifications',
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
      body: ListView.builder(
          itemCount: notificationProvider.notifications.length,
          itemBuilder: (context, index) => Container(
                color: !notificationProvider.notifications[index]['isRead']
                    ? primaryColorTrans
                    : Colors.transparent,
                child: Container(
                  margin: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: !notificationProvider
                                    .notifications[index]['isRead']
                                ? primaryColor
                                : Colors.transparent,
                            radius: 3,
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          const CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/dummy/dp.png'),
                            radius: 23,
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 14,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                                text: TextSpan(
                                    text: notificationProvider
                                        .notifications[index]['title'],
                                    style: GoogleFonts.montserrat(
                                        color: themeProvider.getCurrentTheme()
                                            ? Colors.white
                                            : Colors.black,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 13),
                                    children: [
                                  TextSpan(
                                    text: notificationProvider
                                        .notifications[index]['subtitle'],
                                    style: GoogleFonts.montserrat(
                                        color: themeProvider.getCurrentTheme()
                                            ? Colors.white
                                            : Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12),
                                  )
                                ])),
                            const SubtitleText(
                              text: '5 Days ago',
                              fontSize: 10,
                            )
                          ],
                        ),
                      ),
                      if (index == 0)
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: const DecorationImage(
                                  image: AssetImage(
                                      'assets/images/dummy/image 5.png'),
                                  fit: BoxFit.cover)),
                        )
                      else
                        FollowButton(
                          icon: Iconsax.profile_tick,
                          isFollowed: index == 2 ? true : false,
                        )
                    ],
                  ),
                ),
              )),
    );
  }
}

class FollowButton extends StatelessWidget {
  final IconData icon;
  final Function()? onTap;
  final bool isFollowed;

  const FollowButton(
      {super.key, required this.icon, this.onTap, this.isFollowed = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32.sp,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: isFollowed
              ? Border.all(color: const Color(0x6AC70000), width: 0.8)
              : null,
          color: isFollowed ? primaryColorTrans : const Color(0x80C70000)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isFollowed
                ? Icon(
                    icon,
                    size: 18,
                  )
                : const SvgIcon(
                    path: 'profile-add',
                    color: Colors.black,
                  ),
            const SizedBox(
              width: 5,
            ),
            SubtitleText(
              text: isFollowed ? 'Following' : 'Follow',
              fontSize: 12.sp,
            )
          ],
        ),
      ),
    );
  }
}

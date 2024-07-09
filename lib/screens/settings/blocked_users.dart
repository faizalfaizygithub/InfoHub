import 'package:byb/screens/home/widgets/custom_chip.dart';
import 'package:byb/widgets/back_button.dart';
import 'package:byb/widgets/heading_text.dart';
import 'package:byb/widgets/subtitle_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BlockedUsers extends StatelessWidget {
  const BlockedUsers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(0, kToolbarHeight + 20),
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: AppBar(
            leading: const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: CustomBackButton(),
            ),
            title: const HeadingText(
              text: 'Blocked Users',
              fontSize: 20,
              weight: FontWeight.w500,
            ),
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: 10,
        itemBuilder: (context, index) => Column(
          children: [
            ListTile(
                leading: const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/dummy/v1.png'),
                ),
                title: SubtitleText(
                  text: 'John Honai',
                  weight: FontWeight.w500,
                  fontSize: 13.sp,
                ),
                trailing: const CustomChip(
                  label: 'Unblock',
                  isSelected: true,
                  isAddFeed: true,
                  height: 32,
                )),
            const Divider(
              height: 20,
              indent: 20,
              endIndent: 20,
            )
          ],
        ),
      ),
    );
  }
}

import 'package:byb/screens/home/widgets/custom_chip.dart';
import 'package:byb/screens/registration/pick_cat.dart';
import 'package:byb/services/navigation_service.dart';
import 'package:byb/widgets/heading_text.dart';
import 'package:byb/widgets/subtitle_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import '../../providers/theme_provider.dart';
import '../../widgets/back_button.dart';
import 'add_feed.dart';

class AddQuestion extends StatefulWidget {
  const AddQuestion({super.key});

  @override
  State<AddQuestion> createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  @override
  Widget build(BuildContext context) {
    //var feedProvider = Provider.of<FeedsProvider>(context);
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: const CustomBackButton(),
        centerTitle: false,
        titleSpacing: 10,
        title: const HeadingText(
          text: 'Add Questions',
          fontSize: 16,
        ),
        actions: const [
          SaveButton(
            label: 'Share',
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(17, 10, 17, 17),
              child: Container(
                height: 183.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: themeProvider.getCurrentTheme()
                      ? const Color(0xFF1f1f1f)
                      : const Color(0xffEFEFEF),
                ),
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(25, 15, 25, 25),
                  child: TextField(
                    maxLines: 4,
                    decoration: InputDecoration(
                        hintText: 'Add Questions :', border: InputBorder.none),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 17.0, right: 17),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const HeadingText(
                    text: 'Choose Categories',
                    fontSize: 13,
                    weight: FontWeight.w500,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                            onTap: () {
                              push(context, const PickCategories(from: ''));
                            },
                            child: const SubtitleText(text: 'View All')),
                        const SizedBox(
                          width: 5,
                        ),
                        const Icon(
                          Iconsax.arrow_circle_right,
                          size: 15,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(17.0),
              child: Wrap(
                alignment: WrapAlignment.start,
                verticalDirection: VerticalDirection.down,
                spacing: 10,
                runSpacing: 10,
                children: const [
                  CustomChip(
                    label: 'Physics',
                    isAddFeed: true,
                  ),
                  CustomChip(
                    label: 'Mathematics',
                    isAddFeed: true,
                  ),
                  CustomChip(
                    label: 'Biology',
                    isAddFeed: true,
                  ),
                  CustomChip(
                    label: 'Artificial Intelligence',
                    isAddFeed: true,
                  ),
                  CustomChip(
                    label: 'Chemistry',
                    isAddFeed: true,
                  ),
                  CustomChip(
                    label: 'Java',
                    isAddFeed: true,
                  ),
                  CustomChip(
                    label: 'Micro Biology',
                    isAddFeed: true,
                  ),
                  CustomChip(
                    label: 'Flutter',
                    isAddFeed: true,
                  ),
                  CustomChip(
                    label: 'IoT',
                    isAddFeed: true,
                  ),
                  CustomChip(
                    label: 'UI / UX',
                    isAddFeed: true,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

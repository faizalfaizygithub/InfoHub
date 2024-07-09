import 'package:byb/config/app_theme.dart';
import 'package:byb/providers/feeds_provider.dart';
import 'package:byb/screens/add_feed_question/widgets/thumbnail_picker.dart';
import 'package:byb/screens/add_feed_question/widgets/thumbnail_preview.dart';
import 'package:byb/screens/home/widgets/custom_chip.dart';
import 'package:byb/screens/registration/pick_cat.dart';
import 'package:byb/screens/registration/pick_photo.dart';
import 'package:byb/services/navigation_service.dart';
import 'package:byb/widgets/heading_text.dart';
import 'package:byb/widgets/subtitle_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../../widgets/back_button.dart';
import 'widgets/feed_video_picker.dart';
import 'widgets/feed_video_preview.dart';

class AddFeed extends StatefulWidget {
  const AddFeed({super.key});

  @override
  State<AddFeed> createState() => _AddFeedState();
}

class _AddFeedState extends State<AddFeed> {
  @override
  Widget build(BuildContext context) {
    var feedProvider = Provider.of<FeedsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: const CustomBackButton(),
        leadingWidth: 25.w,
        title: const HeadingText(
          text: 'Add Feeds',
          fontSize: 18,
        ),
        actions: [
          if (feedProvider.croppedFile != null &&
              feedProvider.choosenVideo != null)
            SaveButton(
              label: 'Preview',
              onTap: () {
                feedProvider.showPreview(context);
              },
            ),
          // InkWell(
          //   borderRadius: BorderRadius.circular(30),
          //   onTap: () {
          //     showModalBottomSheet(
          //         shape: const RoundedRectangleBorder(
          //             side: BorderSide(color: Colors.grey)),
          //         context: context,
          //         builder: (context) => BottomSheet(
          //               onClosing: () {},
          //               builder: (context) => PreviewVideo(
          //                 url: feedProvider.croppedFile!.path,
          //                 videoPlayerController: VideoPlayerController.file(
          //                     File(feedProvider.choosenVideo!.path)),
          //               ),
          //             ));
          //   },
          //   child: Container(
          //     // margin: const EdgeInsets.all(8),

          //     padding: const EdgeInsets.all(8),
          //     decoration: BoxDecoration(
          //         border: Border.all(color: Colors.red),
          //         borderRadius: BorderRadius.circular(20)),
          //     child: const Text("Preview"),
          //   ),
          // ),

          const SaveButton()
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (feedProvider.choosenVideo == null)
              FeedVideoPicker(
                onTap: () {
                  feedProvider.pickVideo();
                },
              )
            else
              FeedVideoPreview(
                file: feedProvider.choosenVideo!,
                onTap: () {
                  feedProvider.pickVideo();
                },
                onDelete: () {
                  feedProvider.deletePickedVideo();
                },
              ),
            const Center(
                child: Text(
              "*Video should be in the ratio of 16 : 9",
              style: TextStyle(color: Colors.grey, fontSize: 13),
            )),
            const SizedBox(
              height: 10,
            ),
            if (feedProvider.croppedFile == null)
              ThumbnailPicker(onTap: () {
                feedProvider.pickThumbnail();
              })
            else
              ThumbnailPreview(
                  file: feedProvider.croppedFile!.path,
                  onTap: () {
                    feedProvider.pickThumbnail();
                  },
                  onDelete: feedProvider.deletePickedThumbnail),
            const Center(
                child: Text(
              "*By adding thumbnails, you can get extra Frijo coins",
              style: TextStyle(color: Colors.grey, fontSize: 13),
            )),
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 17.0),
              child: HeadingText(
                text: 'Add Description',
                fontSize: 13,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(17, 10, 17, 17),
              child: TextField(
                controller: feedProvider.descController,
                maxLines: 4,
                decoration: const InputDecoration(hintText: 'Add Description'),
              ),
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
                    onTap: () {
                      push(context, const PickPhoto());
                    },
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
            const Padding(
              padding: EdgeInsets.all(17.0),
              child: Wrap(
                alignment: WrapAlignment.start,
                verticalDirection: VerticalDirection.down,
                spacing: 10,
                runSpacing: 10,
                children: [
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

class SaveButton extends StatelessWidget {
  final String label;
  final Function()? onTap;

  const SaveButton({super.key, this.label = 'Share Post', this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 33,
        margin: const EdgeInsets.fromLTRB(0, 10, 10, 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: primaryColor, width: 0.5),
            color: primaryColorTrans),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: SubtitleText(
              text: label,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }
}

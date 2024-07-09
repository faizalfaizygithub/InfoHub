import 'package:byb/screens/add_feed_question/add_feed.dart';
import 'package:byb/screens/add_feed_question/add_question.dart';
import 'package:byb/screens/home/widgets/destination_item.dart';
import 'package:byb/services/navigation_service.dart';
import 'package:byb/widgets/heading_text.dart';
import 'package:byb/widgets/subtitle_text.dart';
import 'package:byb/widgets/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomeProvider extends ChangeNotifier {
  int selectedIndex = 0;

  changePage(page) {
    selectedIndex = page;
    notifyListeners();
  }

  addPostSheet() {
    showModalBottomSheet(
      context: navigatorKey.currentState!.context,
      isDismissible: false,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25))),
      builder: (context) => const AddPostSheet(),
    );
  }
}

class AddPostSheet extends StatelessWidget {
  const AddPostSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 30,
        ),
        const HeadingText(
          text: "Share your thoughts & let'\nlearn together !",
          fontSize: 16,
          weight: FontWeight.w500,
          alignment: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.all(17.0),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    push(context, const AddQuestion());
                  },
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: const Column(
                      children: [
                        SizedBox(
                          height: 90,
                          width: 90,
                          child: Stack(
                            children: [
                              Center(
                                child: SvgIcon(
                                  path: 'circle',
                                  height: 60,
                                  width: 60,
                                ),
                              ),
                              Center(
                                  child: SvgIcon(
                                path: 'messages',
                                color: Colors.grey,
                              ))
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: SubtitleText(text: 'Create a Question'),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    push(context, const AddFeed());
                  },
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: const Column(
                      children: [
                        SizedBox(
                          height: 90,
                          width: 90,
                          child: Stack(
                            children: [
                              Center(
                                child: SvgIcon(
                                  path: 'circle',
                                  height: 60,
                                  width: 60,
                                ),
                              ),
                              Center(child: Icon(Iconsax.video_octagon))
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: SubtitleText(text: 'Upload a Video'),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        DestinationItem(
          isSelected: false,
          label: '',
          svgPath: 'close',
          isCenter: true,
          onTap: () {
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}

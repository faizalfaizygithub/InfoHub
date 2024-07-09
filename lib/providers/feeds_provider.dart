import 'dart:developer';
import 'dart:io';

import 'package:byb/config/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

import '../screens/add_feed_question/widgets/preview_video.dart';
import '../widgets/heading_text.dart';
import '../widgets/subtitle_text.dart';

class FeedsProvider extends ChangeNotifier {
  TextEditingController descController = TextEditingController();
  List<Map<String, dynamic>> feeds = [
    {
      "category": "Biology",
      "description": "",
      "thumbnail":
          "https://img.freepik.com/free-photo/detail-rice-plant-sunset-valencia-with-plantation-out-focus-rice-grains-plant-seed_181624-25838.jpg?w=2000&t=st=1690442292~exp=1690442892~hmac=8fb1435aeffdb416000fd6bc27010cc5935aea29d0d7bb2dcc2de9fe36b58252",
      "link":
          "https://s3.ap-south-2.amazonaws.com/noviindus.public/files/rv/mustapha-elkhomsy-6412357-720x720-24fps.mp4",
    },
    {
      "category": "Physics",
      "description": "",
      "thumbnail":
          "https://img.freepik.com/free-photo/full-shot-female-astronaut-wearing-spacesuit_23-2150417571.jpg?t=st=1690442448~exp=1690446048~hmac=bdc3051c092380ee68524c861e2fa765b5b593aa0a1b51358b013989d6b46ce1&w=2000",
      "link":
          "https://s3.ap-south-2.amazonaws.com/noviindus.public/files/rv/554269.mp4",
    },
    {
      "category": "Chemistry",
      "description": "",
      "thumbnail":
          "https://img.freepik.com/free-photo/medium-shot-woman-looking-through-microscope_23-2148926618.jpg?w=1800&t=st=1690442857~exp=1690443457~hmac=93dda00ec4a6090a607a2849dc4dbc944b9eee25f45e233070e116dd43da902e",
      "link":
          "https://s3.ap-south-2.amazonaws.com/noviindus.public/files/rv/artem-podrez-5741026.mp4",
    },
    {
      "category": "Robotics",
      "description": "",
      "thumbnail":
          "https://img.freepik.com/free-photo/futuristic-cyborg-with-robotic-arm-stands-illuminated-factory-working-generated-by-ai_24640-99979.jpg?t=st=1690442954~exp=1690446554~hmac=9670395c9984cfdd6cee645f63c9a6a96e9c92ed396ee4d848aea05f9fb1d395&w=1800",
      "link":
          "https://s3.ap-south-2.amazonaws.com/noviindus.public/files/rv/pavel-danilyuk-8086711-mp4",
    }
  ];

  List<Map<String, dynamic>> sortedFeeds = [
    {
      "category": "Biology",
      "description": "",
      "thumbnail":
          "https://img.freepik.com/premium-photo/dna-helix-molecule-blue-yellow-colors-gene-ukrainian-nation-generative-ai_500695-267.jpg?w=2000",
      "link":
          "https://s3.ap-south-2.amazonaws.com/noviindus.public/files/rv/mustapha-elkhomsy-6412357-720x720-24fps.mp4",
    },
    {
      "category": "Physics",
      "description": "",
      "thumbnail":
          "https://img.freepik.com/premium-photo/black-white-image-atom-with-protona-electrons-spining-around_793337-933.jpg?w=1800",
      "link":
          "https://s3.ap-south-2.amazonaws.com/noviindus.public/files/rv/554269.mp4",
    },
    {
      "category": "Chemistry",
      "description": "",
      "thumbnail":
          "https://img.freepik.com/free-photo/medium-shot-woman-looking-through-microscope_23-2148926618.jpg?w=1800&t=st=1690442857~exp=1690443457~hmac=93dda00ec4a6090a607a2849dc4dbc944b9eee25f45e233070e116dd43da902e",
      "link":
          "https://s3.ap-south-2.amazonaws.com/noviindus.public/files/rv/artem-podrez-5741026.mp4",
    },
    {
      "category": "Robotics",
      "description": "",
      "thumbnail":
          "https://img.freepik.com/free-photo/futuristic-cyborg-with-robotic-arm-stands-illuminated-factory-working-generated-by-ai_24640-99979.jpg?t=st=1690442954~exp=1690446554~hmac=9670395c9984cfdd6cee645f63c9a6a96e9c92ed396ee4d848aea05f9fb1d395&w=1800",
      "link":
          "https://s3.ap-south-2.amazonaws.com/noviindus.public/files/rv/pavel-danilyuk-8086711-mp4",
    }
  ];

  XFile? choosenVideo;
  void pickVideo() async {
    await ImagePicker().pickVideo(source: ImageSource.gallery).then((value) {
      if (value != null) {
        choosenVideo = value;
        notifyListeners();
      }
    });
  }

  void deletePickedVideo() {
    choosenVideo = null;
    notifyListeners();
  }

  int selectedCat = -1;

  List categories = [
    'Explore',
    'Trending',
    'All Categories',
    'Physics',
    'Mathematics',
    'Chemistry',
    'Robotics'
  ];

  switchCategory(index) {
    selectedCat = index;
    notifyListeners();
  }

  sortFeeds(index) {
    if (index == 1) {
      sortedFeeds = feeds;
      notifyListeners();
    } else {
      sortedFeeds = feeds.where((element) {
        log('message ${element['category']}   == ${categories[index]}');
        return element['category'] == categories[index];
      }).toList();

      log('message ${sortedFeeds.toString()}');
      notifyListeners();
    }
  }

  //! thumnail

  XFile? choosenThumnail;
  void pickThumbnail() async {
    await ImagePicker().pickImage(source: ImageSource.gallery).then((value) {
      if (value != null) {
        choosenThumnail = value;
        cropThumbnail(value.path);
        notifyListeners();
      }
    });
  }

  void showPreview(context) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(side: BorderSide(color: Colors.grey)),
      context: context,
      builder: (context) => Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8.0),
                child: HeadingText(
                  text: 'Feed Preview',
                  fontSize: 16,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PreviewVideo(
              url: croppedFile!.path,
              videoPlayerController:
                  VideoPlayerController.file(File(choosenVideo!.path)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
            child: SubtitleText(
              text: descController.text.isEmpty
                  ? "Description"
                  : descController.text,
              maxLines: 200,
            ),
          ),
        ],
      ),
    );
  }

  void deletePickedThumbnail() {
    choosenThumnail = null;
    croppedFile = null;
    notifyListeners();
  }

  //! Crope Thumnail
  CroppedFile? croppedFile;
  cropThumbnail(image) async {
    croppedFile = await ImageCropper().cropImage(
      sourcePath: image,
      //  aspectRatio: const CropAspectRatio(ratioX: 16, ratioY: 9),
      aspectRatio: const CropAspectRatio(ratioX: 16, ratioY: 9),

      // aspectRatioPresets: [
      //   // CropAspectRatioPreset.square,
      //   // CropAspectRatioPreset.ratio3x2,
      //   // CropAspectRatioPreset.original,
      //   // CropAspectRatioPreset.ratio4x3,
      //   CropAspectRatioPreset.ratio16x9
      // ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Frijo Cropper',
            toolbarColor: primaryColor,
            toolbarWidgetColor: Colors.white,
            //        initAspectRatio: CropAspectRatioPreset.,
            lockAspectRatio: true),
        IOSUiSettings(
          title: 'Cropper',
          aspectRatioLockEnabled: true,
        ),
        // WebUiSettings(
        //   context: context,
        // ),
      ],
    );
    notifyListeners();
  }
}

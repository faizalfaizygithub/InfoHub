import 'package:byb/screens/profile/widgets/block_dialog.dart';
import 'package:byb/screens/profile/widgets/gender_dialog.dart';
import 'package:byb/screens/profile/widgets/image_picker_dialog.dart';
import 'package:byb/screens/profile/widgets/report_dialog.dart';
import 'package:byb/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../screens/profile/widgets/delete_dialog.dart';

class ProfileProvider extends ChangeNotifier {
  TextEditingController nameController =
      TextEditingController(text: 'Maria George');
  TextEditingController phoneController =
      TextEditingController(text: '9847050607');
  TextEditingController emailController =
      TextEditingController(text: 'mariageorge@gmail.com');
  TextEditingController dobController =
      TextEditingController(text: '12/03/2022');
  TextEditingController bioController = TextEditingController(
      text:
          'Lorem ipsum dolor sit amet consectetur. Tristique pellentesque vel diam amet enim. Semper interdum sed magna nunc justo diam cursus ipsum pellentesque. At faucibus eget sed aliquam ac elit. Lorem urna accumsan dictum et est feugiat dictum gravida. Ac dictum duis enim netus netus nibh. ');
  TextEditingController genderController =
      TextEditingController(text: 'Female');

  XFile? pickedImage;

  confirmDeleteUserAccount() {
    showDialog(
      context: navigatorKey.currentState!.context,
      builder: (context) => const DeleteDialog(),
    );
  }

  confirmReportUser() {
    showDialog(
      context: navigatorKey.currentState!.context,
      builder: (context) => const ReportDialog(),
    );
  }

  confirmBlockUser() {
    showDialog(
      context: navigatorKey.currentState!.context,
      builder: (context) => const BlockDialog(),
    );
  }

  chooseImageSource() {
    showDialog(
      context: navigatorKey.currentState!.context,
      builder: (context) => const ImagePickerDialog(),
    );
  }

  openDatePicker() {
    showDatePicker(
            context: navigatorKey.currentState!.context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1947),
            lastDate: DateTime.now())
        .then((value) {
      if (value != null) {
        dobController.text = DateFormat('dd/M/y').format(value);
        notifyListeners();
      } else {
        showSnackBar(navigatorKey.currentState!.context, 'Date not picked');
      }
    });
  }

  void pickProfilePicture(ImageSource imageSource) async {
    await ImagePicker().pickImage(source: imageSource).then((value) {
      if (value != null) {
        pickedImage = value;
        notifyListeners();
      }
    });
  }

  void chooseGender() {
    showDialog(
        context: navigatorKey.currentState!.context,
        builder: (context) => const GenderDialog());
  }

  void switchGender(gender) {
    genderController.text = gender;
    notifyListeners();
  }
}

import 'package:byb/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class RegistrationProvider extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  //TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController bioController = TextEditingController();

  XFile? pickedFile;

  List<Map<String, dynamic>> categories = [
    {'name': "Mathematics", 'isSelected': false, 'image': "math"},
    {'name': "Chemistry", 'isSelected': false, 'image': "chem"},
    {'name': "Physics", 'isSelected': false, 'image': "physics"},
    {'name': "Biology", 'isSelected': false, 'image': "bio"},
    {'name': "English", 'isSelected': false, 'image': "eng"},
    {'name': "AI", 'isSelected': false, 'image': "ai"},
    {'name': "Creative Design", 'isSelected': false, 'image': "des"},
    {'name': "Chat.GPT", 'isSelected': false, 'image': "gpt"},
    {'name': "Medical", 'isSelected': false, 'image': "med"},
    {'name': "English", 'isSelected': false, 'image': "eng"},
    {'name': "AI", 'isSelected': false, 'image': "ai"},
    {'name': "Creative Design", 'isSelected': false, 'image': "des"},
    {'name': "Chat.GPT", 'isSelected': false, 'image': "gpt"},
    {'name': "Medical", 'isSelected': false, 'image': "med"},
    {'name': "Medical", 'isSelected': false, 'image': "med"},
    {'name': "English", 'isSelected': false, 'image': "eng"},
    {'name': "AI", 'isSelected': false, 'image': "ai"},
    {'name': "Creative Design", 'isSelected': false, 'image': "des"},
    {'name': "Chat.GPT", 'isSelected': false, 'image': "gpt"},
    {'name': "Medical", 'isSelected': false, 'image': "med"},
  ];

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

  openImagePicker() async {
    // showModalBottomSheet(
    //   context: navigatorKey.currentState!.context,
    //   builder: (context) => Column(
    //     children: [
    //       Row(

    //       )
    //     ],
    //   ),
    // );

    await ImagePicker().pickImage(source: ImageSource.gallery).then((value) {
      if (value != null) {
        pickedFile = value;
        notifyListeners();
      }
    });
  }
}

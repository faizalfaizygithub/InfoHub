import 'dart:io';
import 'dart:ui';
import 'package:byb/config/app_theme.dart';
import 'package:byb/providers/profile_provider.dart';
import 'package:byb/screens/home/widgets/custom_chip.dart';
import 'package:byb/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import '../../widgets/custom_textfield1.dart';
import '../../widgets/heading_text.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    var profileProvider = Provider.of<ProfileProvider>(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 85.h,
        leading: const CustomBackButton(),
        titleSpacing: 10,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const HeadingText(
              text: 'Edit profile',
              fontSize: 16,
            ),
            CustomChip(
              label: 'Save',
              isAddFeed: true,
              isSelected: true,
              height: 33,
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        // actions: const [
        //   SizedBox(
        //     height: 30,
        //     child: CustomChip(
        //       label: 'Save',
        //       isAddFeed: true,
        //       isSelected: true,
        //     ),
        //   ),
        //   SizedBox(
        //     width: 17,
        //   )
        // ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SizedBox(
                  height: 110,
                  width: 110,
                  child: Stack(
                    children: [
                      if (profileProvider.pickedImage != null)
                        Container(
                          height: 110,
                          width: 110,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: FileImage(
                                      File(profileProvider.pickedImage!.path)),
                                  fit: BoxFit.cover),
                              color: Colors.grey,
                              shape: BoxShape.circle),
                        )
                      else
                        Container(
                          height: 110,
                          width: 110,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/dummy/dp.png'),
                                  fit: BoxFit.cover),
                              color: Colors.grey,
                              shape: BoxShape.circle),
                        ),
                      GestureDetector(
                        onTap: () {
                          profileProvider.chooseImageSource();
                        },
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                              child: Container(
                                height: 34,
                                width: 34,
                                decoration: BoxDecoration(
                                    border: Border.all(color: primaryColor),
                                    shape: BoxShape.circle),
                                child: const Center(
                                  child: Icon(
                                    Iconsax.camera,
                                    size: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextfield1(
                controller: profileProvider.nameController,
                label: 'Full Name',
                hintText: 'Enter Full Name',
                iconPath: 'profile',
              ),
              const SizedBox(
                height: 25,
              ),
              CustomTextfield1(
                controller: profileProvider.phoneController,
                label: 'Mobile Number',
                hintText: 'Enter Mobile Number',
                iconPath: 'mobile',
                isVerified: true,
                enabled: true,
              ),
              const SizedBox(
                height: 25,
              ),
              CustomTextfield1(
                controller: profileProvider.emailController,
                label: 'Email ID',
                hintText: 'Enter Email ID',
                iconPath: 'sms',
              ),
              const SizedBox(
                height: 25,
              ),
              CustomTextfield1(
                controller: profileProvider.dobController,
                label: 'D.O.B',
                hintText: 'Date of Birth',
                iconPath: 'menu-board',
                enabled: false,
                onTap: () {
                  profileProvider.openDatePicker();
                },
              ),
              const SizedBox(
                height: 25,
              ),
              CustomTextfield1(
                controller: profileProvider.genderController,
                label: 'Gender',
                hintText: 'Pick Gender',
                iconPath: profileProvider.genderController.text == 'Female'
                    ? 'woman'
                    : 'man',
                enabled: false,
                onTap: () {
                  profileProvider.chooseGender();
                },
              ),
              const SizedBox(
                height: 25,
              ),
              CustomTextfield1(
                label: 'Bio',
                hintText: 'Add Bio',
                controller: profileProvider.bioController,
                maxLines: 6,
              )
            ],
          ),
        ),
      ),
    );
  }
}

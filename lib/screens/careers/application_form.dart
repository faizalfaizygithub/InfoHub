import 'dart:ui';

import 'package:byb/widgets/custom_textfield1.dart';
import 'package:byb/widgets/heading_text.dart';
import 'package:byb/widgets/refracted_button_widget.dart';
import 'package:byb/widgets/subtitle_text.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../config/app_theme.dart';
import '../../providers/theme_provider.dart';

class ApplicationForm extends StatefulWidget {
  const ApplicationForm({super.key});

  @override
  State<ApplicationForm> createState() => _ApplicationFormState();
}

class _ApplicationFormState extends State<ApplicationForm> {
  String dropdownvalue = 'Skill 1';

  var items = [
    'Skill 1',
    'Skill 2',
    'Skill 3',
    'Skill 4',
    'Skill 5',
  ];
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    return SingleChildScrollView(
      child: SizedBox(
        // width: ScreenUtil.defaultSize.width,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const HeadingText(
                text: "Application form:",
                fontSize: 20,
              ),
              const CustomTextfield1(
                label: "",
                hintText: "Your Name",
                iconPath: "profile",
              ),
              const CustomTextfield1(
                label: "",
                hintText: "Your Phone Number",
                isPhone: true,
                iconPath: "mobile",
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomTextfield1(
                label: "",
                hintText: "Your Email Address",
                iconPath: "sms",
              ),
              const SizedBox(
                height: 20,
              ),
              const SubtitleText(
                text: "Upload CV",
                fontSize: 15,
                weight: FontWeight.w400,
              ),
              const SizedBox(
                height: 20,
              ),
              DottedBorder(
                  dashPattern: const [8],
                  color: provider.isDarkMode ? Colors.grey : Colors.black,
                  child: Row(
                    children: [
                       const SizedBox(
                        width: 5,
                      ),
                      MaterialButton(
                        padding: const EdgeInsets.all(5),
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              color: Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(5)),
                        color: Colors.white,
                        onPressed: () {},
                        child: const Text("Choose file"),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text("No file choosen")
                    ],
                  )),
              const SizedBox(
                height: 20,
              ),
              const SubtitleText(
                text: "Your Highest Qualification",
                fontSize: 15,
                weight: FontWeight.w400,
              ),
              const CustomTextfield1(
                label: "",
                hintText: "Your Highest Qualification",
                iconPath: "qualified",
              ),
              const SizedBox(
                height: 20,
              ),
              const SubtitleText(
                text: "Add your skills",
                fontSize: 15,
                weight: FontWeight.w400,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade600),
                    borderRadius: BorderRadius.circular(8)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    isExpanded: true,
                    // Initial Value
                    value: dropdownvalue,

                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),

                    // Array list of items
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(
                          items,
                          style: TextStyle(
                              color: provider.isDarkMode
                                  ? Colors.grey
                                  : Colors.black),
                        ),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const SubtitleText(
                text: "Why should we Hire you:",
                fontSize: 15,
                weight: FontWeight.w400,
              ),
              const CustomTextfield1(
                label: "",
                hintText:
                    "Briefly explain about your top skills, abilities, experience, qualification and more.",
                maxLines: 5,
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Column(
                  children: [
                    RefractedButtonWidget(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                            child: Dialog(
                              backgroundColor: provider.getCurrentTheme()
                                  ? darkCardColor
                                  : lightBG,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 20, 10, 10),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const HeadingText(
                                      text: 'Payment Required !',
                                      fontSize: 18,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const SubtitleText(
                                      text:
                                          'Complete a payment of ₹0.5 for applying to this Job role',
                                      weight: FontWeight.w400,
                                      maxLines: 100,
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    ElevatedButton(
                                        style: ButtonStyle(
                                            elevation:
                                                const MaterialStatePropertyAll(0),
                                            shape: MaterialStatePropertyAll(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100))),
                                            backgroundColor:
                                                MaterialStatePropertyAll(
                                                    buttonGreen)),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const SubtitleText(
                                            text: 'Continue with payment')),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Divider(
                                      height: 10,
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const SubtitleText(text: 'Cancel'))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      color: const Color(0xff61C68A),
                      child: const Text("Apply"),
                    ),
                     Divider(
                        color: Colors.grey.shade700, indent: 50, endIndent: 50),
                    RefractedButtonWidget(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                            color: provider.isDarkMode
                                ? Colors.white
                                : Colors.black),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

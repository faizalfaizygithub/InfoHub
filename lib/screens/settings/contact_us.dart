import 'package:byb/config/app_theme.dart';
import 'package:byb/providers/contact_us_provider.dart';
import 'package:byb/providers/theme_provider.dart';
import 'package:byb/widgets/country_picker.dart';
import 'package:byb/widgets/subtitle_text.dart';
import 'package:byb/widgets/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../widgets/back_button.dart';
import '../../widgets/heading_text.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    final contactUsProvider = Provider.of<ContactUsProvider>(context);
    var themeProvider = Provider.of<ThemeProvider>(context);
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
              text: 'Contact Us',
              fontSize: 16,
              weight: FontWeight.w500,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              const HeadingText(
                text: 'Get In Touch',
              ),
              const SubtitleText(text: "Feel free to contact us anytime!"),
              const SizedBox(
                height: 30,
              ),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.withOpacity(.5)),
                    color: themeProvider.getCurrentTheme()
                        ? const Color(0xFF1f1f1f)
                        : const Color(0xffEFEFEF),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Column(
                      children: const [
                        RefractedAdressWidget(
                          iconString: 'location-minus',
                          content:
                              "Frijo Tech Pvt. Ltd. , Frijo Business Arcade 123, Nehru Street, Janakpuri New Delhi, India 110058",
                        ),
                        RefractedAdressWidget(
                          iconString: 'sms',
                          content: "info@frijotech.com, help@frijotech.com",
                        ),
                        RefractedAdressWidget(
                          iconString: 'call',
                          content: "+91 9012 345 678, +91 9078 345 678",
                        )
                      ],
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.withOpacity(.5)),
                      color: themeProvider.getCurrentTheme()
                          ? const Color(0xFF1f1f1f)
                          : const Color(0xffEFEFEF),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              final fieldData =
                                  contactUsProvider.contactFieldsData[index];
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      hintText: fieldData["field_title"],
                                      icon: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          CircleAvatar(
                                            radius: 20,
                                            backgroundColor:
                                                themeProvider.getCurrentTheme()
                                                    ? const Color(0xFF252525)
                                                    : Colors.white,
                                            child: Center(
                                              child: SvgIcon(
                                                path: fieldData['field_icon'] ??
                                                    '',
                                                height: 20,
                                                width: 20,
                                              ),
                                            ),
                                          ),
                                          if (fieldData["field_title"] ==
                                              "Your Phone Number")
                                            const CountryCodePicker(
                                                isContactUsPage: true),
                                        ],
                                      ),
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none),
                                ),
                              );
                            },
                            itemCount: 4,
                            separatorBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Divider(
                                  thickness: 1.5,
                                  color: Colors.grey.withOpacity(.1),
                                ),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Divider(
                            thickness: 1.5,
                            color: Colors.grey.withOpacity(.1),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0, top: 10),
                          child: Center(
                            child: SizedBox(
                              height: 42.sp,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          primaryColor50),
                                      elevation:
                                          const MaterialStatePropertyAll(0),
                                      shape: MaterialStatePropertyAll(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)))),
                                  onPressed: () {},
                                  child: const Text('Send Message')),
                            ),
                          ),
                        )
                      ],
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RefractedAdressWidget extends StatelessWidget {
  const RefractedAdressWidget({
    super.key,
    required this.iconString,
    required this.content,
  });

  final String iconString;
  final String content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Container(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: SvgIcon(
                    path: iconString,
                    height: 20,
                    width: 20,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: SubtitleText(
                    text: content,
                    textAlign: TextAlign.left,
                    fontSize: 14,
                    maxLines: 4,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

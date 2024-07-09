import 'dart:ui';

import 'package:byb/screens/careers/application_form.dart';
import 'package:byb/widgets/subtitle_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../config/app_theme.dart';
import '../../providers/theme_provider.dart';
import '../../widgets/back_button.dart';
import '../../widgets/heading_text.dart';
import '../home/widgets/tag_chip.dart';

class CareerDetails extends StatelessWidget {
  const CareerDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: const HeadingText(
          text: 'Frijo Careers',
          fontSize: 16,
          weight: FontWeight.w500,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: themeProvider.getCurrentTheme() ? grey50 : lightDialogBG,
              border: Border.all(
                  width: 0.5,
                  color: themeProvider.getCurrentTheme()
                      ? const Color(0xff686868)
                      : darkCardColor),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Row(
                  children: [
                    const Expanded(
                      child: HeadingText(
                        text: 'Content Writer',
                        fontSize: 18,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        showDialog(
                          useSafeArea: false,
                          context: context, builder: (context) => BackdropFilter(filter:  ImageFilter.blur(sigmaX: 5, sigmaY: 5),child: Dialog(
                            insetPadding: const EdgeInsets.only(left: 20,right: 20,bottom: 20,top: 50),
                                  backgroundColor: themeProvider.getCurrentTheme()
                                  ? darkCardColor
                                  : lightBG,
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(10)),
                                
                           child: const ApplicationForm(),
                        ),),);
                        
                      },
                      child: Chip(
                        backgroundColor: themeProvider.getCurrentTheme()
                            ? primaryColorDark
                            : primaryColor,
                        side: BorderSide(width: 0.5, color: primaryColor),
                        label: const HeadingText(
                          text: ' Apply ',
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Wrap(
                  spacing: 5,
                  runSpacing: 5,
                  children: const [
                    TagChip(label: '2+ Years Experience'),
                    TagChip(
                      label: '10 days left',
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: SubtitleText(
                  text:
                      'Are you passionate about creating engaging and informative content? Do you have a knack for turning complex ideas into clear and compelling articles? Frijo Tech is seeking a talented Content Writer to join our team and help us deliver valuable educational content to our users.',
                  fontSize: 14,
                  weight: FontWeight.w500,
                  maxLines: 100,
                ),
              ),
              const Padding(
                padding:
                    EdgeInsets.only(left: 10.0, right: 10.0, top: 10),
                child: SubtitleText(maxLines: 400, text: 'Responsibilities:'),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) => const ListTile(
                  minLeadingWidth: 0,
                  leading: SubtitleText(text: '•'),
                  title: SubtitleText(
                    text:
                        'Produce high-quality, well-researched, and engaging written content for our online educational platform.',
                    fontSize: 14,
                    weight: FontWeight.w500,
                    maxLines: 150,
                  ),
                ),
              ),
              const Padding(
                padding:
                    EdgeInsets.only(left: 10.0, right: 10.0, top: 10),
                child: SubtitleText(maxLines: 400, text: 'Requirements:'),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) => const ListTile(
                  minLeadingWidth: 0,
                  leading: SubtitleText(text: '•'),
                  title: SubtitleText(
                    text:
                        'Proven experience as a content writer, copywriter, or similar role, preferably in the education or e-learning industry.',
                    fontSize: 14,
                    weight: FontWeight.w500,
                    maxLines: 150,
                  ),
                ),
              ),
              const Padding(
                padding:
                    EdgeInsets.only(left: 10.0, right: 10.0, top: 10),
                child: SubtitleText(maxLines: 400, text: 'Skills:'),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Wrap(
                  spacing: 5,
                  runSpacing: 5,
                  children: const [
                    TagChip(label: 'Communication'),
                    TagChip(
                      label: 'SEO Practices',
                    ),
                    TagChip(
                      label: 'Journalism',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}

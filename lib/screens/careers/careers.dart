import 'package:byb/config/app_theme.dart';
import 'package:byb/providers/theme_provider.dart';
import 'package:byb/screens/careers/career_details.dart';
import 'package:byb/screens/home/widgets/tag_chip.dart';
import 'package:byb/services/navigation_service.dart';
import 'package:byb/widgets/back_button.dart';
import 'package:byb/widgets/heading_text.dart';
import 'package:byb/widgets/subtitle_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Careers extends StatelessWidget {
  const Careers({super.key});

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
      body: ListView.builder(
        itemCount: 3,
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        itemBuilder: (context, index) =>
            CareerListItem(themeProvider: themeProvider),
      ),
    );
  }
}

class CareerListItem extends StatelessWidget {
  const CareerListItem({
    super.key,
    required this.themeProvider,
  });

  final ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 125,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: themeProvider.getCurrentTheme() ? darkDialogBG : lightDialogBG,
        border: Border.all(
            width: 0.5,
            color:
                themeProvider.getCurrentTheme() ? lightDialogBG : darkDialogBG),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
        child: Column(
          children: [
            const ListTile(
              title: HeadingText(
                text: 'Content Writer',
                fontSize: 18,
                weight: FontWeight.w600,
              ),
              subtitle: SubtitleText(
                  maxLines: 3,
                  weight: FontWeight.w400,
                  text:
                      'Are you passionate about creating engaging and informative content? Do you have a knack for turning complex ideas into clear and compelling articles? ....'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Wrap(
                      spacing: 5,
                      runSpacing: 5,
                      children: const [
                        TagChip(label: '2+ Years Experience'),
                        TagChip(label: '10 days left'),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      push(context, const CareerDetails());
                    },
                    child: Chip(
                        backgroundColor: primaryColor,
                        label: const HeadingText(
                          text: 'View Details',
                          fontSize: 12,
                          color: Colors.white,
                        )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

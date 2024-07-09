// ignore_for_file: must_be_immutable

import 'package:byb/config/app_theme.dart';
import 'package:byb/widgets/back_button.dart';
import 'package:byb/widgets/heading_text.dart';
import 'package:byb/widgets/subtitle_text.dart';
import 'package:byb/widgets/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../providers/theme_provider.dart';

class FrijoDetails extends StatelessWidget {
  FrijoDetails({super.key});

  List keys = [
    'Instant Notification and messaging',
    'Personalized feeds based on your favorite categories',
    'Quick chatbot for your quick queries ',
    "Career's in frijo",
    'Switch between Dark and light themes',
  ];

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const HeadingText(text: 'See what’s in Frijo'),
        leading: const CustomBackButton(),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xff656565), width: 0.5),
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: themeProvider.getCurrentTheme()
                      ? const [Color(0xff010101), Color(0xff4A4A4A)]
                      : [lightBG, Colors.white])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                  tag: 'details0',
                  child: Image.asset('assets/images/dummy/details.png')),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: HeadingText(
                  text: 'See what’s in Frijo',
                  fontSize: 14,
                ),
              ),
              Center(
                  child: SvgIcon(
                path: themeProvider.getCurrentTheme()
                    ? 'infographics'
                    : 'infographics_light',
                width: ScreenUtil().screenWidth - 50,
              )),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: HeadingText(
                  text: 'Key Features of Frijo',
                  fontSize: 14,
                ),
              ),
              GridView.builder(
                itemCount: 5,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, childAspectRatio: 0.85),
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Container(
                          height: 100,
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              gradient: RadialGradient(colors: [
                                darkDialogBG,
                                const Color.fromARGB(255, 44, 44, 44),
                              ]),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: darkCardColor,
                                    offset: const Offset(1, 1),
                                    // spreadRadius: 1,
                                    blurRadius: 5)
                              ],
                              border: Border.all(color: primaryColor50)),
                          child: Center(
                            child: SvgIcon(path: 'key${index + 1}'),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: SubtitleText(
                          text: keys[index],
                          maxLines: 4,
                          weight: FontWeight.w500,
                          fontSize: 10,
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

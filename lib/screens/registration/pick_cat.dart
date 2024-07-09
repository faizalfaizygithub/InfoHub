import 'package:byb/config/app_theme.dart';
import 'package:byb/providers/registration_provider.dart';
import 'package:byb/providers/theme_provider.dart';
import 'package:byb/screens/home/home.dart';
import 'package:byb/screens/home/widgets/custom_chip.dart';
import 'package:byb/services/navigation_service.dart';
import 'package:byb/widgets/back_button.dart';
import 'package:byb/widgets/heading_text.dart';
import 'package:byb/widgets/subtitle_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../widgets/continue_button.dart';
import '../../widgets/skip_button.dart';
import '../../widgets/svg_icon.dart';

class PickCategories extends StatefulWidget {
  final String from;

  const PickCategories({super.key, this.from = 'reg'});

  @override
  State<PickCategories> createState() => _PickCategoriesState();
}

class _PickCategoriesState extends State<PickCategories> {
  @override
  Widget build(BuildContext context) {
    double w = ScreenUtil().screenWidth;
    // var themeProvider = Provider.of<ThemeProvider>(context);
    var registrationProvider = Provider.of<RegistrationProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          if (widget.from == 'reg')
            SvgIcon(
              path: 'pattern',
              width: w,
            ),
          SafeArea(
              child: Padding(
            padding: EdgeInsets.all(20.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: widget.from == 'reg' ? 50 : 10,
                ),
                if (widget.from == 'reg')
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const HeadingText(
                              text: 'Select your\nfavorite categories'),
                          SkipButton(
                            onTap: () {
                              pushAndRemoveUntil(context, const Home());
                            },
                            width: 75.sp,
                            height: 25.sp,
                          ),
                        ],
                      ),
                      SubtitleText(maxLines: 2, text: selectCategorytext),
                    ],
                  )
                else
                  Row(
                    children: [
                      Expanded(
                        child: AppBar(
                          leading: const Column(
                            children: [
                              CustomBackButton(),
                            ],
                          ),
                          title: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  HeadingText(
                                    text: 'Categories',
                                    fontSize: 20,
                                    weight: FontWeight.w500,
                                  ),
                                ],
                              ),
                              SubtitleText(text: 'Choose atleast 3 genres'),
                            ],
                          ),
                        ),
                      ),
                      const CustomChip(
                        label: 'Save',
                        isSelected: true,
                        isAddFeed: true,
                        height: 33,
                      )
                    ],
                  ),
                // Row(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     CustomBackButton(),
                //     Expanded(
                //       child: Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: [
                //               const HeadingText(
                //                 text: 'Categories',
                //                 fontSize: 20,
                //                 weight: FontWeight.w500,
                //               ),
                //             ],
                //           ),
                //           const SubtitleText(text: 'Choose atleast 3 genres'),
                //         ],
                //       ),
                //     ),
                //     CustomChip(
                //       label: 'Save',
                //       isSelected: true,
                //       isAddFeed: true,
                //       height: 33,
                //     )
                //   ],
                // ),
                Expanded(
                    child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    const SearchTextField(),
                    Expanded(
                      child: GridView.builder(
                        padding: const EdgeInsets.fromLTRB(0, 30, 0, 15),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: .85,
                                crossAxisCount: 3,
                                mainAxisSpacing: 0),
                        itemCount: registrationProvider.categories.length,
                        itemBuilder: (context, index) => SingleCategory(
                          image:
                              '${registrationProvider.categories[index]['image']}',
                          name: registrationProvider.categories[index]['name']
                              .toString(),
                          isSelected: registrationProvider.categories[index]
                              ['isSelected'],
                          onTap: () {
                            registrationProvider.categories[index]
                                    ['isSelected'] =
                                !registrationProvider.categories[index]
                                    ['isSelected'];
                            setState(() {});
                          },
                        ),
                      ),
                    )
                  ],
                ))
              ],
            ),
          )),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: widget.from == 'reg'
          ? ContinueButton(
              isValidated: true,
              label: 'Complete',
              onTap: () {
                pushAndRemoveUntil(context, const Home());
              },
            )
          : null,
    );
  }

  String selectCategorytext =
      "Indulge in a world of choices. Select your cherished categories. Curate your personal haven of preferences.";
}

class SingleCategory extends StatelessWidget {
  final String name;
  final String image;
  final bool isSelected;
  final Function()? onTap;

  const SingleCategory(
      {super.key,
      required this.name,
      required this.image,
      required this.isSelected,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: SizedBox(
            height: 85,
            width: 85,
            child: Stack(
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 30.w,
                    backgroundImage:
                        AssetImage('assets/images/dummy/$image.png'),
                  ),
                ),
                Visibility(
                  visible: isSelected,
                  child: Center(
                    child: Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                          border: Border.all(color: primaryColor),
                          shape: BoxShape.circle),
                    ),
                  ),
                ),
                Visibility(
                  visible: isSelected,
                  child: Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8, 4, 0),
                        child: SvgIcon(
                          path: 'check',
                          color: Colors.black,
                          fixedColor: primaryColor,
                        ),
                      )),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
        )
      ],
    );
  }
}

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      height: 42,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: themeProvider.getCurrentTheme()
              ? const Color(0xFF252525)
              : const Color(0xffE8E8ED)),
      child: const Row(
        children: [
          SizedBox(
            width: 10,
          ),
          SvgIcon(
            path: 'search-normal',
            color: Colors.grey,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                  isDense: true, border: InputBorder.none, hintText: 'Search'),
            ),
          ),
        ],
      ),
    );
  }
}

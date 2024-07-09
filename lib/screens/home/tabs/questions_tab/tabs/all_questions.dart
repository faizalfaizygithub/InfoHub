import 'package:byb/config/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../../../../../providers/theme_provider.dart';
import '../../../../../services/navigation_service.dart';
import '../../../../../widgets/heading_text.dart';
import '../../../../../widgets/subtitle_text.dart';
import '../../../../webRTC/chat/chat_list.dart';

class AllQuestions extends StatelessWidget {
  const AllQuestions({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 120),
              itemCount: 4,
              itemBuilder: (context, index) => Card(
                color: themeProvider.getCurrentTheme()
                    ? darkCardColor
                    : lightDialogBG,
                margin: const EdgeInsets.fromLTRB(17, 17, 17, 0),
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  children: [
                    const ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/dummy/dp.png'),
                      ),
                      title: HeadingText(
                        text: 'Anagha Krishna',
                        weight: FontWeight.w500,
                        fontSize: 13,
                      ),
                      subtitle: SubtitleText(
                        text: '5 Days Ago',
                        fontSize: 10,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(18, 0, 18, 18),
                      child: SubtitleText(
                        text:
                            'What are some challenges that we need to addressed in the development in the Artificial Intelligence?',
                        maxLines: 15,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(18, 0, 18, 18),
                      child: SizedBox(
                        height: 42,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                elevation: const MaterialStatePropertyAll(0),
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(6))),
                                backgroundColor:
                                    MaterialStatePropertyAll(buttonGreen)),
                            onPressed: () {
                              push(context, const ChatList());
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Iconsax.message_text),
                                SizedBox(
                                  width: 10,
                                ),
                                SubtitleText(
                                  text: 'Chat Now',
                                  color: Colors.white,
                                )
                              ],
                            )),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

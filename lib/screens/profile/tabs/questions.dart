import 'package:byb/screens/webRTC/chat/chat_list.dart';
import 'package:byb/services/navigation_service.dart';
import 'package:flutter/material.dart';

import '../../../widgets/heading_text.dart';
import '../../../widgets/subtitle_text.dart';

class QuestionsTabProfile extends StatelessWidget {
  const QuestionsTabProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) => Card(
          margin: const EdgeInsets.fromLTRB(17, 17, 17, 0),
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: InkWell(
            onTap: () {
              push(context, const ChatList());
            },
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/dummy/dp.png'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            HeadingText(
                              text: 'Anagha Krishna',
                              weight: FontWeight.w500,
                              fontSize: 13,
                            ),
                            SubtitleText(
                              text: '5 Days Ago',
                              fontSize: 10,
                            ),
                          ],
                        ),
                      )
                    ],
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

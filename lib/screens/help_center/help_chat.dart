import 'package:byb/config/app_theme.dart';
import 'package:byb/screens/webRTC/chat/widgets/received_message.dart';
import 'package:byb/screens/webRTC/chat/widgets/sent_message.dart';
import 'package:byb/screens/help_center/help_center.dart';
import 'package:byb/services/navigation_service.dart';
import 'package:byb/widgets/back_button.dart';
import 'package:byb/widgets/heading_text.dart';
import 'package:byb/widgets/subtitle_text.dart';
import 'package:flutter/material.dart';

import '../webRTC/chat/chat_list.dart';

class HelpChat extends StatefulWidget {
  const HelpChat({super.key});

  @override
  State<HelpChat> createState() => _HelpChatState();
}

class _HelpChatState extends State<HelpChat> {
  TextEditingController sendMessageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: const HeadingText(
          text: 'Chat with Frijo Team',
          fontSize: 16,
        ),
        centerTitle: false,
        actions: [
          TextButton.icon(
              onPressed: () {
                push(context, const HelpCenter());
              },
              icon: Icon(
                Icons.question_answer_rounded,
                color: primaryColor,
              ),
              label: SubtitleText(
                text: 'FAQ',
                color: primaryColor,
              )),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              itemCount: 5,
              itemBuilder: (context, index) => index < 3
                  ? SendMessage(
                      message:
                          'Hello I would like to know about redeeming Frijo Coins',
                      time: '10:32 AM',
                      isSend: true,
                      isRepeat: index > 0 ? true : false)
                  : const ReceivedMessage(
                      message: 'Hello Thanks for contacting us',
                      time: '9:48 AM',
                      isSend: true,
                      isRepeat: false),
            ),
          ),
          MessageTextField(
            onTap: () {
              if (sendMessageController.text.isEmpty) {
              } else {}
            },
            controller: sendMessageController,
          )
        ],
      ),
    );
  }
}

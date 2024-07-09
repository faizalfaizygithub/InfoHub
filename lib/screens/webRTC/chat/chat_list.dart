import 'dart:developer';

import 'package:byb/config/app_theme.dart';
import 'package:byb/providers/chat_provider.dart';
import 'package:byb/screens/webRTC/chat/widgets/sent_message.dart';
import 'package:byb/screens/webRTC/video_call/voice_call.dart';
import 'package:byb/services/navigation_service.dart';
import 'package:byb/widgets/back_button.dart';
import 'package:byb/widgets/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../../../providers/theme_provider.dart';
import '../../../widgets/heading_text.dart';
import '../../../widgets/subtitle_text.dart';
import 'widgets/received_message.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    var chatProvider = Provider.of<ChatProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                const CustomBackButton(),
                const SizedBox(
                  width: 10,
                ),
                const Expanded(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/dummy/dp.png'),
                    ),
                    contentPadding: EdgeInsets.zero,
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
                ),
                IconButton(
                    onPressed: () {
                      push(context, const CallScreen());
                    },
                    icon: const SvgIcon(
                      path: 'call',
                      color: Colors.grey,
                    )),
                IconButton(
                  onPressed: () {},
                  icon: const SvgIcon(
                    path: 'video',
                    color: Colors.grey,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const SvgIcon(
                    path: 'more-v',
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: chatProvider.messages.length,
                  padding: const EdgeInsets.all(15),
                  itemBuilder: (context, index) => chatProvider.messages[index]
                          ['type']
                      ? SendMessage(
                          message: chatProvider.messages[index]['message'],
                          time: chatProvider.messages[index]['time'],
                          isSend: chatProvider.messages[index]['type'],
                          isRepeat: index == 0
                              ? false
                              : chatProvider.messages[index]['type'] ==
                                  chatProvider.messages[index - 1]['type'])
                      : ReceivedMessage(
                          message: chatProvider.messages[index]['message'],
                          time: chatProvider.messages[index]['time'],
                          isSend: chatProvider.messages[index]['type'],
                          isRepeat: index == 0
                              ? false
                              : chatProvider.messages[index]['type'] ==
                                  chatProvider.messages[index - 1]['type'])),
            ),
            MessageTextField(
              onTap: () {
                if (chatProvider.sendMessageController.text.isEmpty) {
                  log('Empty message!');
                } else {
                  chatProvider
                      .sendMessage(chatProvider.sendMessageController.text);
                }
              },
              controller: chatProvider.sendMessageController,
            )
          ],
        ),
      ),
    );
  }
}

class MessageTextField extends StatelessWidget {
  final Function() onTap;
  final TextEditingController controller;

  const MessageTextField(
      {super.key, required this.onTap, required this.controller});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      height: 86.sp,
      decoration: BoxDecoration(
          color:
              themeProvider.getCurrentTheme() ? darkCardColor : lightDialogBG,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.fromLTRB(17, 0, 17, 0),
              decoration: BoxDecoration(
                  boxShadow: themeProvider.getCurrentTheme()
                      ? []
                      : [
                          const BoxShadow(
                              offset: Offset(0, 3),
                              blurRadius: 1,
                              color: Colors.grey)
                        ],
                  borderRadius: BorderRadius.circular(5),
                  color: themeProvider.getCurrentTheme()
                      ? darkDialogBG
                      : Colors.white),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                      border: InputBorder.none, hintText: 'Write a message...'),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 20,
              child: Icon(
                Iconsax.send_2,
                color: primaryColor,
              ),
            ),
          ),
          const SizedBox(
            width: 17,
          )
        ],
      ),
    );
  }
}

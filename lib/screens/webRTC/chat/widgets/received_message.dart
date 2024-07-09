import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../config/app_theme.dart';
import '../../../../providers/theme_provider.dart';
import '../../../../widgets/subtitle_text.dart';

class ReceivedMessage extends StatelessWidget {
  final String message;
  final String time;
  final bool isSend;
  final bool isRepeat;

  const ReceivedMessage(
      {super.key,
      required this.message,
      required this.time,
      required this.isSend,
      required this.isRepeat});
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: EdgeInsets.only(top: isRepeat ? 0.0 : 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isRepeat)
            const CircleAvatar(
              backgroundImage: AssetImage('assets/images/dummy/dp.png'),
            )
          else
            const CircleAvatar(
              backgroundColor: Colors.transparent,
            ),
          const SizedBox(
            width: 10,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: themeProvider.getCurrentTheme()
                          ? darkDialogBG
                          : lightDialogBG,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(isRepeat ? 20 : 0),
                          topRight: const Radius.circular(20),
                          bottomLeft: const Radius.circular(20),
                          bottomRight: const Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SubtitleText(
                      text: message,
                      maxLines: 50,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                if (isRepeat) SubtitleText(text: time),
                SizedBox(
                  height: isRepeat ? 20 : 6,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

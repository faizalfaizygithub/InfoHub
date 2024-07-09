import 'package:byb/widgets/subtitle_text.dart';
import 'package:flutter/material.dart';

class RefractedBulletListWidget extends StatelessWidget {
  const RefractedBulletListWidget({
    super.key,
    required this.content,
  });

  final String content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SubtitleText(
                  text: '\u2022',
                  fontSize: 16,
                ),
                const SizedBox(
                  width: 5,
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

import 'package:byb/widgets/subtitle_text.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../widgets/back_button.dart';
import '../../widgets/heading_text.dart';

class HelpCenter extends StatelessWidget {
  const HelpCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(0, kToolbarHeight + 20),
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: AppBar(
            leading: const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: CustomBackButton(),
            ),
            centerTitle: false,
            title: const HeadingText(
              text: 'FAQ',
              fontSize: 16,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            const HeadingText(
              text: 'Most relevant questions !',
              fontSize: 16,
              weight: FontWeight.w500,
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
                child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: 10,
              itemBuilder: (context, index) => const FrequentQuestionWidget(),
            ))
          ],
        ),
      ),
    );
  }
}

class FrequentQuestionWidget extends StatefulWidget {
  const FrequentQuestionWidget({
    super.key,
  });

  @override
  State<FrequentQuestionWidget> createState() => _FrequentQuestionWidgetState();
}

class _FrequentQuestionWidgetState extends State<FrequentQuestionWidget> {
  bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            onExpansionChanged: (value) {
              setState(() {
                isOpen = value;
              });
            },
            tilePadding: EdgeInsets.zero,
            title: const SubtitleText(text: 'How can I redeem coins ?'),
            trailing: isOpen
                ? const Icon(
                    Iconsax.arrow_circle_up,
                    color: Colors.grey,
                  )
                : const Icon(
                    Iconsax.arrow_circle_down,
                    color: Colors.grey,
                  ),
            children: const [
              SubtitleText(
                text:
                    'You can redeem your coins when you reach the minimum redeemable amount.',
                maxLines: 25,
              )
            ],
          ),
        ),
        const Divider(
          thickness: 0.1,
          height: 30,
        )
      ],
    );
  }
}

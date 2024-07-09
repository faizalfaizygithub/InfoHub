import 'package:byb/widgets/subtitle_text.dart';
import 'package:flutter/material.dart';

import '../../widgets/back_button.dart';
import '../../widgets/heading_text.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

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
            title: const HeadingText(
              text: 'Terms and Conditions',
              fontSize: 16,
              weight: FontWeight.w500,
            ),
          ),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeadingText(
                text: 'Terms of Services',
                fontSize: 16,
              ),
              SizedBox(
                height: 20,
              ),
              SubtitleText(
                  maxLines: 250,
                  text:
                      "Lorem ipsum dolor sit amet consectetur. Enim morbi nullam a sed vel justo vel proin. usto adipiscing pharetra. In risus semper ipsum nibh netus blandit in consectetur. Tincidunt id eros elementum odio malesuada. Habitasse dui facilisis purus volutpat nisi. Tempus netus sed iaculis quis tristique. Aliquet tempus porttitor integer mollis nunc amet. Potenti congue nisl risus et tortor nibh lacinia sed ultrices.Nec urna vitae hac tincidunt nisl neque in. Duis ut adipiscing odio et nunc. Odio condimentum in mattis nibh pulvinar hendrerit et sed. Ac neque consequat imperdiet lacus pulvinar luctus aliquam. Non et donec ipsum molestie at. Ornare hac mi neque eros leo et vulputate facilisis etiam. Leo tortor dui at ut lacinia. Posuere suspendisse non ut ut ut venenatis tellus. Dolor a tristique convallis vitae non elementum id."),
              SizedBox(
                height: 20,
              ),
              HeadingText(
                text: 'The Service',
                fontSize: 16,
              ),
              SizedBox(
                height: 20,
              ),
              SubtitleText(
                  maxLines: 250,
                  text:
                      "Lorem ipsum dolor sit amet consectetur. Enim morbi nullam a sed vel justo vel proin. usto adipiscing pharetra. In risus semper ipsum nibh netus blandit in consectetur. Tincidunt id eros elementum odio malesuada. Habitasse dui facilisis purus volutpat nisi. Tempus netus sed iaculis quis tristique. Aliquet tempus porttitor integer mollis nunc amet. Potenti congue nisl risus et tortor nibh lacinia sed ultrices.Nec urna vitae hac tincidunt nisl neque in. Duis ut adipiscing odio et nunc. Odio condimentum in mattis nibh pulvinar hendrerit et sed. Ac neque consequat imperdiet lacus pulvinar luctus aliquam. Non et donec ipsum molestie at. Ornare hac mi neque eros leo et vulputate facilisis etiam. Leo tortor dui at ut lacinia. Posuere suspendisse non ut ut ut venenatis tellus. Dolor a tristique convallis vitae non elementum id.")
            ],
          ),
        ),
      ),
    );
  }
}

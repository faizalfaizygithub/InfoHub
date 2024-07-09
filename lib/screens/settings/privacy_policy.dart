import 'package:byb/widgets/subtitle_text.dart';
import 'package:flutter/material.dart';

import '../../widgets/back_button.dart';
import '../../widgets/heading_text.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

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
              text: 'Privacy Policy',
              fontSize: 16,
              weight: FontWeight.w500,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              HeadingText(
                text: 'PRIVACY POLICY',
                fontSize: 16,
              ),
              SizedBox(
                height: 20,
              ),
              SubtitleText(text: 'Last updated on : 27/06/2023'),
              SizedBox(
                height: 20,
              ),
              SubtitleText(
                  maxLines: 250,
                  text:
                      "Lorem ipsum dolor sit amet consectetur. Enim morbi nullam a sed vel justo vel proin. Interdum massa a amet fringilla vitae mattis congue tellus a. Arcu diam risus sed integer ac justo adipiscing pharetra. In risus semper ipsum nibh netus blandit in consectetur. Tincidunt id eros elementum odio malesuada. Habitasse dui facilisis purus volutpat nisi. Tempus netus sed iaculis quis tristique. Aliquet tempus porttitor integer mollis nunc amet. Potenti congue nisl risus et tortor nibh lacinia sed ultrices.Nec urna vitae hac tincidunt nisl neque in. Duis ut adipiscing odio et nunc. Odio condimentum in mattis nibh pulvinar hendrerit et sed. Ac neque consequat imperdiet lacus pulvinar luctus aliquam. Non et donec ipsum molestie at. Ornare hac mi neque eros leo et vulputate facilisis etiam. Leo tortor dui at ut lacinia. Posuere suspendisse non ut ut ut venenatis tellus. Dolor a tristique convallis vitae non elementum id. Scelerisque nec commodo sed bibendum interdum rutrum sed. Ac velit lorem metus aliquet. Tempus ut nibh imperdiet ac. Metus sed sed dui in elementum semper augue posuere. Amet tincidunt integer purus odio mollis eu. Risus curabitur suspendisse sit nisl pretium hendrerit. Viverra ut non natoque faucibus. Arcu interdum pulvinar ut hendrerit aenean quisque. Ac odio at quis blandit neque. Eget nisl diam sed eros lacus urna vel purus.Scelerisque nec commodo sed bibendum interdum rutrum sed. Ac velit lorem metus aliquet. Tempus ut nibh imperdiet ac. Metus sed sed dui in elementum semper augue posuere. Amet tincidunt integer purus odio mollis eu. Risus curabitur suspendisse sit nisl pretium hendrerit. Viverra ut non natoque faucibus. Arcu interdum pulvinar ut hendrerit aenean quisque. Ac odio at quis blandit neque. Eget nisl diam sed eros lacus urna vel purus.")
            ],
          ),
        ),
      ),
    );
  }
}

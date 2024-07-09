
import 'package:byb/config/app_theme.dart';
import 'package:byb/providers/coin_provider.dart';
import 'package:byb/providers/theme_provider.dart';
import 'package:byb/screens/coins/widgets/redeem_coin_button.dart';
import 'package:byb/widgets/heading_text.dart';
import 'package:byb/widgets/refracted_button_widget.dart';
import 'package:byb/widgets/subtitle_text.dart';
import 'package:byb/widgets/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class BuyCoins extends StatelessWidget {
  const BuyCoins({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CoinProvider>(context);
    String collecttext =
        "Select a plan that works best for you and start collecting Frijo coins to unlock valuable resources and features!";

    return Scaffold(
        appBar: AppBar(
            leading: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const SvgIcon(
              path: 'close-slim',
              color: Colors.white,
              height: 40,
              width: 40,
            ),
          ),
        )),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeadingText(
                text: 'Collect Your',
                fontSize: 30,
                weight: FontWeight.w500,
              ),
              Row(
                children: [
                  ShaderMask(
                    blendMode: BlendMode.srcIn,
                    shaderCallback: (bounds) => const LinearGradient(
                            colors: [Color(0xffA31673), Color(0xffc70000)])
                        .createShader(
                      Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                    ),
                    child: const HeadingText(
                      text: 'FRIJO COINS',
                      fontSize: 30,
                      weight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const HeadingText(
                    text: 'now.',
                    fontSize: 30,
                    weight: FontWeight.w500,
                  ),
                ],
              ),
              SubtitleText(
                text: collecttext,
                maxLines: 5,
              ),
              Expanded(
                  child: GridView.builder(
                itemCount: provider.coinPackages.length,
                padding: const EdgeInsets.only(top: 20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 0.85),
                itemBuilder: (context, index) => CoinGridItem(
                    onTap: () {
                      provider.selectPackage(index);
                    },
                    amount: provider.coinPackages[index]['amount'],
                    isSelected: provider.selectedPackage == index,
                    coinCount: provider.coinPackages[index]['count'],
                    bonusCoinCount: '2800'),
              )),
              Center(
                  child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: RedeemCoinButton(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isDismissible: true,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25))),
                      builder: (context) => const RefractedPaymentStatusBottomSheet(
                        isPaymentStatus: true,
                      ),
                    );
                  },
                  label: 'Purchase Now',
                ),
              ))
            ],
          ),
        ));
  }
}

class RefractedPaymentStatusBottomSheet extends StatelessWidget {
  const RefractedPaymentStatusBottomSheet({
    super.key,
    this.isPaymentStatus = false,
  });

  final bool? isPaymentStatus;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: .4.sh,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: const SizedBox(
                width: 80,
                child: Divider(
                  thickness: 3,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          if (isPaymentStatus == true)
            Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 80,
                  child: Lottie.asset(
                      'assets/images/coins_subscription_status_gif.json',
                      fit: BoxFit.fill),
                ),
                const HeadingText(text: "Congratulations !"),
                const Padding(
                  padding: EdgeInsets.only(
                    top: 10.0,
                  ),
                  child: SubtitleText(text: "You earned 10,800 Frijo coins."),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    top: 10.0,
                  ),
                  child: SubtitleText(
                    text: "Coins will be reflected in your account shortly.",
                    maxLines: 3,
                  ),
                )
              ],
            )
          else
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 50.h),
                  child: const SvgIcon(
                    path: "payment status sheet remove icon",
                    height: 60,
                    width: 60,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30.h),
                  child: const HeadingText(text: "Payment failed!"),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 10.0.h,
                  ),
                  child: const SubtitleText(text: "Please retry your payment"),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.h),
                  child: RefractedButtonWidget(
                    color: const Color(0xff7D0F0A),
                    onPressed: () {},
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: SubtitleText(
                        text: "Retry Payment",
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            )
        ],
      ),
    );
  }
}

class CoinGridItem extends StatelessWidget {
  final String amount;
  final bool isSelected;
  final String coinCount;
  final String bonusCoinCount;
  final Function()? onTap;

  const CoinGridItem(
      {super.key,
      required this.amount,
      required this.isSelected,
      required this.coinCount,
      required this.bonusCoinCount,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          if (!isSelected)
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: themeProvider.getCurrentTheme()
                      ? const Color(0xff212121)
                      : null),
            )
          else
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: themeProvider.getCurrentTheme()
                      ? const LinearGradient(colors: [
                          Color.fromRGBO(163, 22, 116, 0.5),
                          Color.fromRGBO(199, 0, 0, 0.5)
                        ])
                      : const LinearGradient(colors: [
                          Color.fromRGBO(163, 22, 116, 0.8),
                          Color.fromRGBO(199, 0, 0, 0.8)
                        ])),
            ),
          Container(
            height: double.infinity,
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(0, 0, 6, 6),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                    color: themeProvider.getCurrentTheme()
                        ? const Color(0xff212121)
                        : Colors.transparent),
                color:
                    themeProvider.getCurrentTheme() ? darkBG : lightCardColor),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 22.h,
                        width: 52.w,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 0.5,
                                color: themeProvider.getCurrentTheme()
                                    ? Colors.white
                                    : Colors.black),
                            borderRadius: BorderRadius.circular(23)),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Iconsax.star1,
                                color: primaryColor,
                                size: 12,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Expanded(
                                child: Center(
                                  child: SubtitleText(
                                    text: 'BEST DEAL',
                                    fontSize: 6,
                                    maxLines: 2,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      HeadingText(
                        text: coinCount,
                        fontSize: 28,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Image.asset(
                        'assets/images/coin.png',
                        height: 20,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SubtitleText(text: '+2800 Bonus coin'),
                  Expanded(
                      child: Center(
                    child: Row(
                      children: const [
                        SizedBox(
                          width: 20,
                        ),
                        SvgIcon(path: 'gift'),
                        SubtitleText(
                          text: ' 40% off',
                          fontSize: 8,
                          weight: FontWeight.w500,
                        ),
                      ],
                    ),
                  )),
                  const Divider(),
                  SizedBox(
                    height: 30,
                    child: Center(
                      child: SubtitleText(
                        text: '₹ $amount',
                        fontSize: 15,
                        weight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

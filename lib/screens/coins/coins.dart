import 'package:byb/screens/coins/buy_coins.dart';
import 'package:byb/screens/coins/widgets/redeem_coin_button.dart';
import 'package:byb/services/navigation_service.dart';
import 'package:byb/widgets/back_button.dart';
import 'package:byb/widgets/heading_text.dart';
import 'package:byb/widgets/subtitle_text.dart';
import 'package:byb/widgets/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../../config/app_theme.dart';
import '../../providers/theme_provider.dart';
import 'widgets/coin_widget.dart';

class Coins extends StatelessWidget {
  const Coins({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          CoinsHeader(themeProvider: themeProvider),
          Padding(
            padding: EdgeInsets.only(top: 200.h),
            child: Column(
              children: [
                TransactionPoints(themeProvider: themeProvider),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const HeadingText(
                        text: 'Transaction History',
                        fontSize: 15,
                        weight: FontWeight.bold,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            SubtitleText(
                              text: 'View All',
                              weight: FontWeight.bold,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Iconsax.arrow_circle_right,
                              size: 18,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                    child: ListView.builder(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  itemCount: 10,
                  itemBuilder: (context, index) => Column(
                    children: [
                      SizedBox(
                        height: 60,
                        child: ListTile(
                          title: const HeadingText(
                            text: 'Coins added to wallet',
                            fontSize: 12,
                            weight: FontWeight.w700,
                          ),
                          subtitle: const SubtitleText(
                            text: '5 Days ago',
                            fontSize: 10,
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                'assets/images/coin.png',
                                width: 22,
                                height: 22,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              HeadingText(
                                text: index.isEven ? '34 +' : '26 -',
                                fontSize: 18,
                                color: index.isEven ? callGreen : primaryColor,
                              )
                            ],
                          ),
                        ),
                      ),
                      const Divider(
                        indent: 20,
                        endIndent: 20,
                        thickness: 0.1,
                      )
                    ],
                  ),
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TransactionPoints extends StatelessWidget {
  const TransactionPoints({
    super.key,
    required this.themeProvider,
  });

  final ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: themeProvider.getCurrentTheme()
              ? darkCardColor
              : const Color(0xffeaeaea)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: const [
                SubtitleText(
                  text: 'Transaction Points',
                  fontSize: 15,
                  weight: FontWeight.w500,
                ),
                SizedBox(
                  width: 10,
                ),
                SvgIcon(
                  path: 'graph',
                  color: Colors.grey,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 4,
                      backgroundColor: callGreen,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        const SubtitleText(
                          text: 'Points Earned',
                          fontSize: 10,
                        ),
                        Row(
                          children: const [
                            SubtitleText(
                              text: '₹ ',
                              fontSize: 16,
                            ),
                            SubtitleText(
                              text: '2568',
                              fontSize: 20,
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 4,
                      backgroundColor: appOrange,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        const SubtitleText(
                          text: 'Point Spent',
                          fontSize: 10,
                        ),
                        Row(
                          children: const [
                            SubtitleText(
                              text: '₹ ',
                              fontSize: 16,
                            ),
                            SubtitleText(
                              text: '2568',
                              fontSize: 20,
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
            const SizedBox()
          ],
        ),
      ),
    );
  }
}

class CoinsHeader extends StatelessWidget {
  const CoinsHeader({
    super.key,
    required this.themeProvider,
  });

  final ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 276.h,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                offset: const Offset(1, 1),
                color: primaryColorTrans,
                blurRadius: 20,
                spreadRadius: 1)
          ],
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50)),
          color: themeProvider.getCurrentTheme() ? darkDrawerBG : Colors.white),
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 10,
                ),
                const CustomBackButton(),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        SubtitleText(
                          text: '₹',
                          fontSize: 16,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        HeadingText(
                          text: '2500',
                          weight: FontWeight.w500,
                          fontSize: 28,
                        ),
                      ],
                    ),
                    const SubtitleText(text: 'Available balance')
                  ],
                ),
                const Expanded(child: SizedBox()),
                const CoinWidget()
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            RedeemCoinButton(
              onTap: () {
                push(context, const BuyCoins());
              },
            ),
            const Expanded(
              child: SizedBox(),
            )
          ],
        ),
      ),
    );
  }
}

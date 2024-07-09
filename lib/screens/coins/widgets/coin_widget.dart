import 'package:byb/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../config/app_theme.dart';

class CoinWidget extends StatefulWidget {
  const CoinWidget({
    super.key,
  });

  @override
  State<CoinWidget> createState() => _CoinWidgetState();
}

class _CoinWidgetState extends State<CoinWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      duration: const Duration(milliseconds: 5000),
      vsync: this,
    );
    controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      height: 57,
      width: 57,
      margin: const EdgeInsets.only(right: 17),
      child: Stack(
        children: [
          RotationTransition(
            turns: controller,
            child: Stack(
              children: [
                Center(
                  child: Container(
                    height: 57,
                    width: 57,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(colors: [
                          Colors.transparent,
                          primaryColor,
                          primaryColor,
                          Colors.transparent,
                        ])),
                  ),
                ),
                Center(
                  child: RotatedBox(
                    quarterTurns: 1,
                    child: Container(
                      height: 57,
                      width: 57,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(colors: [
                            Colors.transparent,
                            primaryColor,
                            primaryColor,
                            Colors.transparent,
                          ])),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: themeProvider.getCurrentTheme()
                            ? darkBG
                            : Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/images/coin.gif',
              ),
            ),
          )
        ],
      ),
    );
  }
}

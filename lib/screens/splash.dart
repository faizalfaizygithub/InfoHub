import 'package:byb/providers/splash_provider.dart';
import 'package:byb/providers/theme_provider.dart';
import 'package:byb/widgets/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  ThemeProvider themeProvider = ThemeProvider();
  SplashProvider provider = SplashProvider();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      themeProvider.setTheme().then((value) {
        provider.handleSplash();
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of<ThemeProvider>(context);
    provider = Provider.of<SplashProvider>(context);

    return Scaffold(
      body: Stack(
        children: [
          SvgIcon(
            path: 'bg_pattern',
            height: ScreenUtil().screenHeight + 50,
          ),

          // Center(
          //   child: SvgIcon(
          //     path: themeProvider.isDarkMode ? 'logo1' : 'logo2',
          //     height: 200,
          //   ),
          // )
          Center(
            child: Image.asset(
              'assets/images/logo3.png',
              height: 100,
            ),
          )
          // Center(S
          //     child: Container(
          //   decoration: BoxDecoration(
          //       shape: BoxShape.circle,
          //       color: darkBG,
          //       border: Border.all(color: isDark ? Colors.grey : darkBG)),
          //   child: IconButton(
          //       onPressed: () {
          //         setState(() {
          //           isDark = !isDark;
          //         });
          //         themeProvider.switchTheme(isDark);
          //       },
          //       icon: isDark
          //           ? const Icon(
          //               Icons.light_mode,
          //               color: Colors.amber,
          //             )
          //           : Icon(
          //               Icons.dark_mode,
          //               color: Colors.blue[100],
          //             )),
          // ))
        ],
      ),
    );
  }
}

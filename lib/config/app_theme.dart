import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

Color msgButtonColor = const Color(0xffAE6511);
Color darkBG = const Color(0xff171717);
Color grey50 = const Color.fromRGBO(99, 99, 99, 0.5);
Color darkBG80 = const Color.fromRGBO(23, 23, 23, 0.8);
Color darkDialogBG = const Color(0xFF393939);
Color lightBG = const Color(0xFFE6E6E6);
Color primaryColor = const Color(0xffC70000);
Color primaryColor50 = const Color.fromRGBO(199, 0, 0, 0.50);
Color primaryColorDark = const Color.fromARGB(255, 107, 19, 12);
Color primaryColorTrans = const Color(0x1FC70000);
Color subtitleColor = const Color(0xffE2E2E2);
Color buttonBorderColor = const Color(0x7D000000);
Color lightDialogBG = const Color(0xffEFEFEF);
Color darkDrawerBG = const Color(0xff121212);
Color darkDividerColor = const Color(0xffEDEDED);
Color darkCardColor = const Color(0xff1B1B1B);
Color lightCardColor = const Color(0xffF0DDE1);
Color lightChatBubbleColor = const Color(0x91AE6611);
Color callGreen = const Color(0xff279362);
Color buttonGreen = const Color(0xff3EA969);

Color appOrange = const Color(0xffC73C00);

MaterialColor primarySwatch = const MaterialColor(0xffC70000, {
  50: Color(0xffC70000),
  100: Color(0xffC70000),
  200: Color(0xffC70000),
  300: Color(0xffC70000),
  400: Color(0xffC70000),
  500: Color(0xffC70000),
  600: Color(0xffC70000),
  700: Color(0xffC70000),
  800: Color(0xffC70000),
  900: Color(0xffC70000),
});

ThemeData darkThemeData = ThemeData(
    //fontFamily: 'Montserrat',
    fontFamily: GoogleFonts.montserrat().fontFamily,
    scaffoldBackgroundColor: darkBG,
    primarySwatch: primarySwatch,
    textTheme: TextTheme(
      titleSmall: GoogleFonts.montserrat(color: Colors.white),
      titleMedium: GoogleFonts.montserrat(color: Colors.white),
      titleLarge: GoogleFonts.montserrat(color: Colors.white),
      displayMedium: GoogleFonts.montserrat(color: Colors.white),
      displayLarge: GoogleFonts.montserrat(color: Colors.white),
      displaySmall: GoogleFonts.montserrat(color: Colors.white),
      bodyLarge: GoogleFonts.montserrat(color: Colors.white),
      bodyMedium: GoogleFonts.montserrat(color: Colors.white),
      bodySmall: GoogleFonts.montserrat(color: Colors.white),
      headlineLarge: GoogleFonts.montserrat(color: Colors.white),
      headlineMedium: GoogleFonts.montserrat(color: Colors.white),
      headlineSmall: GoogleFonts.montserrat(color: Colors.white),
      labelLarge: GoogleFonts.montserrat(color: Colors.white),
      labelMedium: GoogleFonts.montserrat(color: Colors.white),
      labelSmall: GoogleFonts.montserrat(color: Colors.white),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle:
          const TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
      labelStyle: GoogleFonts.montserrat(color: Colors.white),
    ),
    cardColor: darkDialogBG,
    navigationBarTheme:
        const NavigationBarThemeData(backgroundColor: Color(0xff121212)),
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: darkDrawerBG),
    checkboxTheme: CheckboxThemeData(
      side: const BorderSide(color: Colors.white, width: 0.4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    dialogBackgroundColor: darkDialogBG,
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
          iconColor: const MaterialStatePropertyAll(Colors.white),
          foregroundColor: const MaterialStatePropertyAll(Colors.white),
          shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
          side: const MaterialStatePropertyAll(
              BorderSide(color: Colors.white, width: 0.2))),
    ),
    drawerTheme: DrawerThemeData(backgroundColor: darkDrawerBG),
    dividerColor: darkDividerColor,
    appBarTheme: AppBarTheme(
        backgroundColor: darkBG,
        elevation: 0,
        titleTextStyle: GoogleFonts.montserrat(color: Colors.white)));

ThemeData lightThemeData = ThemeData(
    //fontFamily: 'Montserrat',
    fontFamily: GoogleFonts.montserrat().fontFamily,
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: lightDialogBG),
    cardColor: lightCardColor,
    scaffoldBackgroundColor: Colors.white,
    primarySwatch: primarySwatch,
    navigationBarTheme: NavigationBarThemeData(backgroundColor: lightDialogBG),
    checkboxTheme: CheckboxThemeData(
      side: const BorderSide(color: Colors.grey, width: 0.4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    ),
    tabBarTheme: const TabBarTheme(
        labelColor: Colors.black, unselectedLabelColor: Colors.grey),
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        titleTextStyle: GoogleFonts.montserrat(color: Colors.black)));

var systemUIOverlay = SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent,
        statusBarColor: Colors.transparent));

var systemOrientation = SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

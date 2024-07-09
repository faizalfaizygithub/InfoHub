import 'package:byb/config/app_theme.dart';
import 'package:byb/providers/auth_provider.dart';
import 'package:byb/providers/chat_provider.dart';
import 'package:byb/providers/coin_provider.dart';
import 'package:byb/providers/contact_us_provider.dart';
import 'package:byb/providers/feeds_provider.dart';
import 'package:byb/providers/home_provider.dart';
import 'package:byb/providers/notification_provider.dart';
import 'package:byb/providers/profile_provider.dart';
import 'package:byb/providers/registration_provider.dart';
import 'package:byb/providers/search_provider.dart';
import 'package:byb/providers/splash_provider.dart';
import 'package:byb/providers/theme_provider.dart';
import 'package:byb/screens/auth/login.dart';
import 'package:byb/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'services/sharedprefrence_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesService().setPreferences();

  systemUIOverlay;
  systemOrientation;

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ChangeNotifierProvider(create: (_) => SplashProvider()),
      ChangeNotifierProvider(create: (_) => AuthProvider()),
      ChangeNotifierProvider(create: (_) => RegistrationProvider()),
      ChangeNotifierProvider(create: (_) => HomeProvider()),
      ChangeNotifierProvider(create: (_) => FeedsProvider()),
      ChangeNotifierProvider(create: (_) => NotificationProvider()),
      ChangeNotifierProvider(create: (_) => SearchProvider()),
      ChangeNotifierProvider(create: (_) => ChatProvider()),
      ChangeNotifierProvider(create: (_) => CoinProvider()),
      ChangeNotifierProvider(create: (_) => ProfileProvider()),
      ChangeNotifierProvider(create: (_) => ContactUsProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var themeProvider = ThemeProvider();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      themeProvider.initTheme();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of<ThemeProvider>(context);

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: navigatorKey,
          title: 'Frijotech',
          themeMode: themeProvider.themeMode,
          theme: lightThemeData,
          darkTheme: darkThemeData,
          home: LoginScreen()),
    );
  }
}

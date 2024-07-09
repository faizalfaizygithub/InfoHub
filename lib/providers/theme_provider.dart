import 'dart:developer';

import 'package:byb/services/sharedprefrence_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode? themeMode;

  bool isDarkMode = false;

  Future<void> initTheme() async {
    var brightness =
        SchedulerBinding.instance.platformDispatcher.platformBrightness;
    log('$brightness');

    if (SharedPreferencesService.prefs.getBool('isDark') == null) {
      if (brightness == Brightness.dark) {
        isDarkMode = true;
        themeMode = ThemeMode.dark;
      } else {
        isDarkMode = false;
        themeMode = ThemeMode.light;
      }
      //isDarkMode = brightness == Brightness.dark ? true : false;
      // themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
      log('message spnull $themeMode $isDarkMode $brightness');

      notifyListeners();
    } else {
      if (brightness == Brightness.dark) {
        isDarkMode = true;
        themeMode = ThemeMode.dark;
      } else {
        isDarkMode = false;
        themeMode = ThemeMode.light;
      }
      log('message$themeMode $isDarkMode $brightness');

      notifyListeners();
    }

    // themeMode = SharedPreferencesService.prefs.getBool('isDark') == null
    //     ? ThemeMode.system
    //     : SharedPreferencesService.prefs.getBool('isDark')!
    //         ? ThemeMode.dark
    //         : ThemeMode.light;
  }

  Future<bool> setTheme() async {
    // var brightness =
    //     SchedulerBinding.instance.platformDispatcher.platformBrightness;
    SharedPreferencesService().setPreferences();
    bool? isDark = SharedPreferencesService.prefs.getBool('isDark') ?? false;
    SharedPreferencesService.prefs.setBool('isDark', isDark);
    themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    return isDark;
  }

  switchTheme(bool isDark) async {
    themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    isDarkMode = isDark;

    SharedPreferencesService.prefs.setBool('isDark', isDark);

    notifyListeners();
  }

  bool getCurrentTheme() {
    var brightness =
        SchedulerBinding.instance.platformDispatcher.platformBrightness;

    bool isDark = SharedPreferencesService.prefs.getBool('isDark') ??
            brightness == Brightness.dark
        ? true
        : false;

    return isDark;
  }
}

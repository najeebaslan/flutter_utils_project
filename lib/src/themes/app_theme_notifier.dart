/*
* File : App Theme Notifier (Listener)
* Version : 1.0.0
* */

/// [FuAppThemeNotifier] - notifies the app by giving the theme to the app

import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'custom_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app_theme.dart';

class FuAppThemeNotifier extends ChangeNotifier {
  FuAppThemeNotifier() {
    init();
  }

  init() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int fxAppThemeMode = sharedPreferences.getInt("fx_app_theme_mode") ??
        FuAppThemeType.light.index;
    changeAppThemeMode(FuAppThemeType.values[fxAppThemeMode]);

    notifyListeners();
  }

  changeAppThemeMode(FuAppThemeType? themeType) async {
    FuAppTheme.defaultThemeType = themeType!;
    if (themeType.index == 1) {
      FuCustomTheme.defaultThemeType =
          FuCustomThemeType.values[FuAppThemeType.dark.index];
      FuAppTheme.isDarkMode = true;
    } else if (themeType.index == 0) {
      FuCustomTheme.defaultThemeType =
          FuCustomThemeType.values[FuAppThemeType.light.index];
      FuAppTheme.isDarkMode = false;
    }

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setInt("fx_app_theme_mode", themeType.index);
    notifyListeners();
  }
}

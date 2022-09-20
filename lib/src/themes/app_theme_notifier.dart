/*
* File : App Theme Notifier (Listener)
* Version : 1.2.0
* */

/// [FuAppThemeNotifier] - notifies the app by giving the theme to the app

import 'package:flutter/widgets.dart';
import 'custom_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app_theme.dart';

class FuAppThemeNotifier extends ChangeNotifier {
  FuAppThemeNotifier() {
    init();
  }

  /// it's for initialize App Theme
  init() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int fxAppThemeMode = sharedPreferences.getInt("fx_app_theme_mode") ??
        FuAppThemeType.light.index;
    changeAppThemeMode(FuAppThemeType.values[fxAppThemeMode]);

    notifyListeners();
  }

  changeAppThemeMode(FuAppThemeType? themeType) async {
    ///it's for change value  App Theme
    FuAppTheme.defaultThemeType = themeType!;

    if (themeType.index == 1) {
      ///it's for change value  Custom Theme
      FuCustomTheme.defaultThemeType =
          FuCustomThemeType.values[FuAppThemeType.dark.index];
      FuAppTheme.isDarkMode = true;
    } else if (themeType.index == 0) {
      ///it's for change value  Custom Theme
      FuCustomTheme.defaultThemeType =
          FuCustomThemeType.values[FuAppThemeType.light.index];
      FuAppTheme.isDarkMode = false;
    }

    ///it's save value AppTheme in SharedPreferences
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setInt("fx_app_theme_mode", themeType.index);
    notifyListeners();
  }
}

/*
      * File : App Theme
      * Version : 1.2.0
      * */

/// [FuAppThemeType.dark] - Applies all the properties for dark theme
/// [FuAppThemeType.light] - Applies all the properties for light theme

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_theme.dart';

enum FuAppThemeType { light, dark }

class FuAppTheme {
  static bool isDarkMode = false;
  static FuAppThemeType defaultThemeType = FuAppThemeType.light;

  static ThemeData get theme => FuAppTheme.getThemeFromThemeMode();
  static FuCustomTheme get customTheme => FuCustomTheme.getCustomAppTheme();

  /// -------------------------- Light Theme  -------------------------------------------- ///

  static ThemeData lightTheme = ThemeData.light().copyWith(
    /// Brightness
    brightness: Brightness.light,

    /// Primary Color
    primaryColor: const Color(0xff3d63ff),

    /// Scaffold and Background color
    canvasColor: Colors.transparent,
    backgroundColor: const Color(0xfff6f6f6),
    scaffoldBackgroundColor: const Color(0xfff6f6f6),

    /// AppBar Theme
    appBarTheme: const AppBarTheme(
      actionsIconTheme: IconThemeData(
        color: Color(0xff495057),
      ),
      color: Color(0xffffffff),
      iconTheme: IconThemeData(color: Color(0xff495057), size: 24),
    ),

    ///ButtonTheme
    buttonTheme: ButtonThemeData(
      textTheme: ButtonTextTheme.normal,
      buttonColor: const Color(0xFF3E3E41),
      colorScheme: const ColorScheme.light(
        primary: Color(0xff3d63ff),
        onPrimary: Colors.white,
        // primaryVariant: Color(0xff0055ff),
        secondary: Color(0xff495057),
        // secondaryVariant: Color(0xff3cd278), deprecated
        onSecondary: Colors.white,
        surface: Color(0xffe2e7f1),
        background: Color(0xff3d63ff),
        onBackground: Color(0xff495057),
      ).copyWith(secondary: const Color(0xff3d63ff)),
    ),

    navigationRailTheme: const NavigationRailThemeData(
        selectedIconTheme:
            IconThemeData(color: Color(0xff3d63ff), opacity: 1, size: 24),
        unselectedIconTheme:
            IconThemeData(color: Color(0xff495057), opacity: 1, size: 24),
        backgroundColor: Color(0xffffffff),
        elevation: 3,
        selectedLabelTextStyle: TextStyle(color: Color(0xff3d63ff)),
        unselectedLabelTextStyle: TextStyle(color: Color(0xff495057))),

    /// Card Theme
    cardTheme: CardTheme(
      color: Colors.white,
      shadowColor: Colors.black.withOpacity(0.4),
      elevation: 1,
      margin: const EdgeInsets.all(0),
    ),

    /// Input (Text-Field) Theme
    inputDecorationTheme: const InputDecorationTheme(
      fillColor: Color(0xfff5f5f5),
      hintStyle: TextStyle(fontSize: 15, color: Color(0xaa495057)),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide(width: 1, color: Color(0xff3d63ff)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide(width: 1, color: Colors.black54),
      ),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: Colors.black54)),
    ),

    /// Icon Theme
    iconTheme: const IconThemeData(
      color: Color(0xff3d63ff),
    ),

    /// Other Colors
    splashColor: Colors.white.withAlpha(100),
    indicatorColor: Colors.white,
    disabledColor: const Color(0xffdcc7ff),
    highlightColor: Colors.white,
    cardColor: Colors.white,
    errorColor: const Color(0xfff0323c),

    /// Floating Action Theme
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: const Color(0xff3d63ff),
        splashColor: Colors.white.withAlpha(100),
        highlightElevation: 8,
        elevation: 4,
        focusColor: const Color(0xff3d63ff),
        hoverColor: const Color(0xff3d63ff),
        foregroundColor: Colors.white),

    /// Divider Theme
    dividerTheme:
        const DividerThemeData(color: Color(0xffe8e8e8), thickness: 1),
    dividerColor: const Color(0xffe8e8e8),

    popupMenuTheme: const PopupMenuThemeData(
      color: Color(0xffffffff),
    ),

    /// Bottom AppBar Theme
    bottomAppBarTheme:
        const BottomAppBarTheme(color: Color(0xffffffff), elevation: 2),

    /// Tab bar Theme
    tabBarTheme: const TabBarTheme(
      unselectedLabelColor: Color(0xff495057),
      labelColor: Color(0xff3d63ff),
      indicatorSize: TabBarIndicatorSize.label,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: Color(0xff3d63ff), width: 2.0),
      ),
    ),

    /// Slider Theme
    sliderTheme: SliderThemeData(
      activeTrackColor: const Color(0xff3d63ff),
      inactiveTrackColor: const Color(0xff3d63ff).withAlpha(140),
      trackShape: const RoundedRectSliderTrackShape(),
      trackHeight: 4.0,
      thumbColor: const Color(0xff3d63ff),
      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10.0),
      overlayShape: const RoundSliderOverlayShape(overlayRadius: 24.0),
      tickMarkShape: const RoundSliderTickMarkShape(),
      inactiveTickMarkColor: Colors.red[100],
      valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
      valueIndicatorTextStyle: const TextStyle(
        color: Colors.white,
      ),
    ),

    /// Color scheme
    colorScheme: const ColorScheme.light(
            primary: Color(0xff3d63ff),
            onPrimary: Colors.white,
            secondary: Color(0xff495057),
            onSecondary: Colors.white,
            surface: Color(0xffe2e7f1),
            background: Color(0xfffefefe),
            onBackground: Color(0xff495057))
        .copyWith(secondary: const Color(0xff3d63ff)),
  );

  /// -------------------------- Dark Theme  -------------------------------------------- ///

  static ThemeData darkTheme = ThemeData.dark().copyWith(

      /// Brightness
      brightness: Brightness.dark,

      /// Primary Color
      primaryColor: const Color(0xff3d63ff),

      /// Scaffold and Background color

      scaffoldBackgroundColor: const Color(0xff1b1b1b),
      backgroundColor: const Color(0xff252525),
      canvasColor: Colors.transparent,

      /// AppBar Theme
      appBarTheme: const AppBarTheme(
        actionsIconTheme: IconThemeData(
          color: Color(0xffffffff),
        ),
        color: Color(0xff2e343b),
        iconTheme: IconThemeData(color: Color(0xffffffff), size: 24),
      ),

      ///ButtonTheme
      buttonTheme: ButtonThemeData(
        textTheme: ButtonTextTheme.normal,
        buttonColor: const Color(0xFF3E3E41),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xff3d63ff),
          onPrimary: Colors.white,
          secondary: Color(0xff495057),
          onSecondary: Colors.white,
          surface: Color(0xFF14161A),
          background: Color(0xFF2E2C2C),
          onBackground: Color(0xff495057),
        ).copyWith(secondary: const Color(0xff3d63ff)),
      ),

      /// Card Theme
      cardTheme: const CardTheme(
        color: Color(0xff37404a),
        shadowColor: Color(0xff000000),
        elevation: 1,
        margin: EdgeInsets.all(0),
      ),
      iconTheme: const IconThemeData(
        color: Color(0xff3d63ff),
      ),

      /// Other Colors
      indicatorColor: Colors.white,
      disabledColor: const Color(0xffa3a3a3),
      highlightColor: Colors.white,

      /// Input (Text-Field) Theme
      inputDecorationTheme: const InputDecorationTheme(
        fillColor: Color(0xff3E444A),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: Color(0xff3d63ff)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          borderSide: BorderSide(width: 1, color: Colors.white70),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(width: 1, color: Colors.white70)),
      ),

      /// Divider Theme
      dividerTheme:
          const DividerThemeData(color: Color(0xff363636), thickness: 1),
      dividerColor: const Color(0xff363636),
      errorColor: Colors.orange,
      cardColor: const Color(0xff282a2b),
      splashColor: Colors.white.withAlpha(100),

      /// Floating Action Theme
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: const Color(0xff3d63ff),
          splashColor: Colors.white.withAlpha(100),
          highlightElevation: 8,
          elevation: 4,
          focusColor: const Color(0xff3d63ff),
          hoverColor: const Color(0xff3d63ff),
          foregroundColor: Colors.white),
      popupMenuTheme: const PopupMenuThemeData(
        color: Color(0xff37404a),
      ),

      /// Bottom AppBar Theme
      bottomAppBarTheme:
          const BottomAppBarTheme(color: Color(0xff464c52), elevation: 2),

      /// Tab bar Theme
      tabBarTheme: const TabBarTheme(
        unselectedLabelColor: Color(0xff495057),
        labelColor: Color(0xff3d63ff),
        indicatorSize: TabBarIndicatorSize.label,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(color: Color(0xff3d63ff), width: 2.0),
        ),
      ),

      /// Slider Theme
      sliderTheme: SliderThemeData(
        activeTrackColor: const Color(0xff3d63ff),
        inactiveTrackColor: const Color(0xff3d63ff).withAlpha(100),
        trackShape: const RoundedRectSliderTrackShape(),
        trackHeight: 4.0,
        thumbColor: const Color(0xff3d63ff),
        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10.0),
        overlayShape: const RoundSliderOverlayShape(overlayRadius: 24.0),
        tickMarkShape: const RoundSliderTickMarkShape(),
        inactiveTickMarkColor: Colors.red[100],
        valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
        valueIndicatorTextStyle: const TextStyle(
          color: Colors.white,
        ),
      ),
      cupertinoOverrideTheme: const CupertinoThemeData(),

      /// Color scheme
      colorScheme: const ColorScheme.dark(
        primary: Color(0xff3d63ff),
        secondary: Color(0xff00cc77),
        // secondaryVariant: Color(0xff00cc77),
        background: Color(0xff252525),
        onPrimary: Colors.white,
        onBackground: Colors.white,
        onSecondary: Colors.white,
        surface: Color(0xff585e63),
      ).copyWith(secondary: const Color(0xff3d63ff)));

  static ThemeData getThemeFromThemeMode({FuAppThemeType? themeType}) {
    themeType ??= defaultThemeType;
    switch (themeType) {
      case FuAppThemeType.light:
        return lightTheme;
      default:
        return darkTheme;
    }
  }

  static void changeLightTheme(ThemeData themeData) {
    lightTheme = themeData;
  }

  static void changeDarkTheme(ThemeData themeData) {
    darkTheme = themeData;
  }

  static void changeThemeType(FuAppThemeType? themeType) {
    defaultThemeType = themeType!;
  }
}

/*
* File : App Theme
* Version : 1.2.0
* */

/// [FuCustomTheme] - provides the different properties for the custom theme.

import 'package:flutter/widgets.dart';

enum FuCustomThemeType { light, dark }

class FuCustomTheme {
  final Color bgLayer1,
      bgLayer2,
      border1,
      border2,
      disabledColor,
      onDisabled,
      colorInfo,
      colorWarning,
      colorSuccess,
      colorError,
      shadowColor,
      onInfo,
      onWarning,
      onSuccess,
      onError;

  final Color lightBlack,
      red,
      green,
      yellow,
      orange,
      blue,
      purple,
      pink,
      brown,
      withe,
      blackToWithe,
      blueToWithe;

  FuCustomTheme({
    this.border1 = const Color(0xffeeeeee),
    this.border2 = const Color(0xffe6e6e6),
    this.bgLayer1 = const Color(0xfff0f0f0),
    this.bgLayer2 = const Color(0xfffefefe),
    this.disabledColor = const Color(0xffdcc7ff),
    this.onDisabled = const Color(0xffffffff),
    this.colorWarning = const Color(0xffffc837),
    this.colorInfo = const Color(0xffff784b),
    this.colorSuccess = const Color(0xff3cd278),
    this.shadowColor = const Color(0xff1f1f1f),
    this.onInfo = const Color(0xffffffff),
    this.onWarning = const Color(0xffffffff),
    this.onSuccess = const Color(0xffffffff),
    this.colorError = const Color(0xfff0323c),
    this.onError = const Color(0xffffffff),

    //Color
    this.lightBlack = const Color(0xffa7a7a7),
    this.red = const Color(0xffFF0000),
    this.green = const Color(0xff008000),
    this.yellow = const Color(0xfffff44f),
    this.orange = const Color(0xffFFA500),
    this.blue = const Color(0xff0000ff),
    this.purple = const Color(0xff800080),
    this.pink = const Color(0xffFFC0CB),
    this.brown = const Color(0xffA52A2A),
    this.withe = const Color(0xffeeeeee),
    this.blueToWithe = const Color(0xff0000ff),
    this.blackToWithe = const Color(0xFF1C1C22),
  });

  static FuCustomTheme lightCustomAppTheme = FuCustomTheme(
    bgLayer1: const Color(0xfff6f6f6),
    bgLayer2: const Color(0xffffffff),
    disabledColor: const Color(0xff636363),
    onDisabled: const Color(0xffffffff),
    colorInfo: const Color(0xffff784b),
    colorWarning: const Color(0xffffc837),
    withe: const Color(0xffeeeeee),
    colorSuccess: const Color(0xff3cd278),
    shadowColor: const Color(0xffd9d9d9),
    onInfo: const Color(0xffffffff),
    onSuccess: const Color(0xffffffff),
    onWarning: const Color(0xffffffff),
    colorError: const Color(0xfff0323c),
    onError: const Color(0xffffffff),
    blueToWithe: const Color(0xff0000ff),
  );

  static FuCustomTheme darkCustomAppTheme = FuCustomTheme(
      bgLayer1: const Color(0xff1b1b1b),
      bgLayer2: const Color(0xff252525),
      border1: const Color(0xff303030),
      border2: const Color(0xff363636),
      disabledColor: const Color(0xffbababa),
      onDisabled: const Color(0xff000000),
      colorInfo: const Color(0xffff784b),
      colorWarning: const Color(0xffffc837),
      colorSuccess: const Color(0xff3cd278),
      shadowColor: const Color(0xff202020),
      onInfo: const Color(0xffffffff),
      onSuccess: const Color(0xffffffff),
      onWarning: const Color(0xffffffff),
      colorError: const Color(0xfff0323c),
      blueToWithe: const Color(0xffffffff),
      blackToWithe: const Color(0xffffffff),
      onError: const Color(0xffffffff));

  static FuCustomThemeType defaultThemeType = FuCustomThemeType.light;

  static FuCustomTheme getCustomAppTheme({FuCustomThemeType? themeType}) {
    themeType ??= defaultThemeType;
    switch (themeType) {
      case FuCustomThemeType.light:
        return lightCustomAppTheme;
      default:
        return darkCustomAppTheme;
    }
  }
}

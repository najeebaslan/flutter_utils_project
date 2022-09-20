/*File : FuSpacing
Version : 1.2.0
*/
/// [FuSpacing] - provides spacing of various types.

import 'package:flutter/widgets.dart';

class FuSpacing {
  static EdgeInsetsGeometry zero = EdgeInsets.zero;
  static EdgeInsetsGeometry only(
      {double top = 0, double right = 0, double bottom = 0, double left = 0}) {
    return EdgeInsets.only(left: left, right: right, top: top, bottom: bottom);
  }

  static EdgeInsetsGeometry fromLTRB(
      double left, double top, double right, double bottom) {
    return FuSpacing.only(bottom: bottom, top: top, right: right, left: left);
  }

  static EdgeInsetsGeometry all(double spacing) {
    return FuSpacing.only(
        bottom: spacing, top: spacing, right: spacing, left: spacing);
  }

  static EdgeInsetsGeometry left(double spacing) {
    return FuSpacing.only(left: spacing);
  }

  /// it's do padding from all deration except Left
  static EdgeInsetsGeometry noLeft(double spacing) {
    return FuSpacing.only(top: spacing, bottom: spacing, right: spacing);
  }

  static EdgeInsetsGeometry top(double spacing) {
    return FuSpacing.only(top: spacing);
  }

  /// it's do padding from all deration except Top
  static EdgeInsetsGeometry noTop(double spacing) {
    return FuSpacing.only(left: spacing, bottom: spacing, right: spacing);
  }

  static EdgeInsetsGeometry right(double spacing) {
    return FuSpacing.only(right: spacing);
  }

  /// it's do padding from all deration except Right
  static EdgeInsetsGeometry noRight(double spacing) {
    return FuSpacing.only(top: spacing, bottom: spacing, left: spacing);
  }

  static EdgeInsetsGeometry bottom(double spacing) {
    return FuSpacing.only(bottom: spacing);
  }

  /// it's do padding from all deration except Bottom
  static EdgeInsetsGeometry noBottom(double spacing) {
    return FuSpacing.only(top: spacing, left: spacing, right: spacing);
  }

  static EdgeInsetsGeometry horizontal(double spacing) {
    return FuSpacing.only(left: spacing, right: spacing);
  }

  static x(double spacing) {
    return FuSpacing.only(left: spacing, right: spacing);
  }

  static xy(double xSpacing, double ySpacing) {
    return FuSpacing.only(
        left: xSpacing, right: xSpacing, top: ySpacing, bottom: ySpacing);
  }

  static y(double spacing) {
    return FuSpacing.only(top: spacing, bottom: spacing);
  }

  static EdgeInsetsGeometry vertical(double spacing) {
    return FuSpacing.only(top: spacing, bottom: spacing);
  }

  static EdgeInsetsGeometry symmetric(
      {double vertical = 0, double horizontal = 0}) {
    return FuSpacing.only(
        top: vertical, right: horizontal, left: horizontal, bottom: vertical);
  }

  static Widget height(double height) {
    return SizedBox(
      height: height,
    );
  }

  static Widget width(double width) {
    return SizedBox(
      width: width,
    );
  }
}

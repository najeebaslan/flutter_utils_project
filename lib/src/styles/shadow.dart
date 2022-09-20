/*
* File : FuShadow
* Version : 1.2.0
* */

/// [FuShadow] - provides custom shadow to the widget

import 'package:flutter/widgets.dart';

enum ToolShadowPosition {
  topLeft,
  top,
  topRight,
  centerLeft,
  center,
  centerRight,
  bottomLeft,
  bottom,
  bottomRight
}

class FuShadow {
  late int alpha;
  late double elevation, spreadRadius, blurRadius;
  Offset? offset;
  ToolShadowPosition? position;
  Color? color;
  bool? darkShadow;

  FuShadow(
      {double elevation = 8,
      double? spreadRadius,
      double? blurRadius,
      Offset? offset,
      ToolShadowPosition position = ToolShadowPosition.bottom,
      int? alpha,
      Color? color,
      bool darkShadow = false}) {
    this.spreadRadius = spreadRadius ?? elevation * 0.125;
    this.blurRadius = blurRadius ?? elevation * 2;
    this.alpha = alpha ?? (darkShadow ? 100 : 36);
    this.elevation = elevation;
    this.offset = offset;
    this.position = position;
    this.color = color;
    this.darkShadow = darkShadow;

    if (offset == null) {
      switch (position) {
        case ToolShadowPosition.topLeft:
          this.offset = Offset(-elevation, -elevation);
          break;
        case ToolShadowPosition.top:
          this.offset = Offset(0, -elevation);
          break;
        case ToolShadowPosition.topRight:
          this.offset = Offset(elevation, -elevation);
          break;
        //TODO: Shadow problem
        case ToolShadowPosition.centerLeft:
          this.offset = Offset(-elevation, elevation * 0.25);
          break;
        case ToolShadowPosition.center:
          this.offset = const Offset(0, 0);
          break;
        //TODO: Shadow problem
        case ToolShadowPosition.centerRight:
          this.offset = Offset(elevation, elevation * 0.25);
          break;
        case ToolShadowPosition.bottomLeft:
          this.offset = Offset(-elevation, elevation);
          break;
        case ToolShadowPosition.bottom:
          this.offset = Offset(0, elevation);
          break;
        case ToolShadowPosition.bottomRight:
          this.offset = Offset(elevation, elevation);
          break;
      }
    }
  }

  @override
  String toString() {
    return 'FuShadow{alpha: $alpha, elevation: $elevation, spreadRadius: $spreadRadius, blurRadius: $blurRadius, offset: $offset, position: $position, color: $color, darkShadow: $darkShadow}';
  }
}

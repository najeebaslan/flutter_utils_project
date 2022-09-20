/*File : FuButton
Version : 1.2.0
*/

/// Three types of button implemented from Material Button.

/// [FuButtonType.elevated] - gives elevation to the button along with some height and shadow.
/// [FuButtonType.outlined] - gives outline to the button
/// [FuButtonType.text] - able to build text button

import 'package:flutter/material.dart';

enum FuButtonType { elevated, outlined, text }

class FuButton extends StatelessWidget {
  final FuButtonType? buttonType;

  final ButtonStyle? style;

  final VoidCallback onPressed;

  final bool? disabled;
  final bool? block;
  final bool soft;

  final MaterialStateProperty<EdgeInsetsGeometry>? msPadding;
  final EdgeInsetsGeometry? padding;

  final MaterialStateProperty<double>? msElevation;
  final double? elevation;

  final MaterialStateProperty<EdgeInsetsGeometry>? msShape;
  final OutlinedBorder? shape;
  final BorderRadiusGeometry? borderRadius;
  final double? borderRadiusAll;

  final MaterialStateProperty<Color>? msBackgroundColor;
  final Color? backgroundColor;

  final MaterialStateProperty<BorderSide>? msSide;
  final BorderSide? side;
  final Color borderColor;

  final MaterialStateProperty<Color>? msShadowColor;
  final Color? shadowColor;

  final Color? splashColor;

  final Widget child;

  const FuButton({
    required this.onPressed,
    required this.child,
    this.msPadding,
    this.padding,
    this.msShape,
    this.shape,
    this.borderRadius,
    this.borderRadiusAll = 0,
    this.msBackgroundColor,
    this.backgroundColor = Colors.blue,
    this.buttonType = FuButtonType.elevated,
    this.style,
    this.msShadowColor,
    this.msSide,
    this.side,
    this.borderColor = Colors.transparent,
    this.disabled = false,
    this.block = false,
    this.soft = false,
    this.msElevation,
    this.elevation = 4,
    this.shadowColor,
    this.splashColor,
  });

  const FuButton.rounded(
      {required this.onPressed,
      required this.child,
      this.msPadding,
      this.padding,
      this.msShape,
      this.shape,
      this.borderRadius,
      this.borderRadiusAll = 4,
      this.msBackgroundColor,
      this.backgroundColor = Colors.blue,
      this.buttonType = FuButtonType.elevated,
      this.style,
      this.block = false,
      this.msSide,
      this.disabled = false,
      this.side,
      this.soft = false,
      this.borderColor = Colors.transparent,
      this.msShadowColor,
      this.msElevation,
      this.elevation = 4,
      this.shadowColor,
      this.splashColor});

  const FuButton.small(
      {required this.onPressed,
      required this.child,
      this.msPadding,
      this.padding = const EdgeInsets.fromLTRB(8, 4, 8, 4),
      this.msShape,
      this.shape,
      this.borderRadius,
      this.borderRadiusAll = 0,
      this.msBackgroundColor,
      this.backgroundColor = Colors.blue,
      this.buttonType = FuButtonType.elevated,
      this.style,
      this.block = false,
      this.msSide,
      this.soft = false,
      this.disabled = false,
      this.side,
      this.borderColor = Colors.transparent,
      this.msShadowColor,
      this.msElevation,
      this.elevation = 4,
      this.shadowColor,
      this.splashColor});

  const FuButton.medium(
      {required this.onPressed,
      required this.child,
      this.msPadding,
      this.padding = const EdgeInsets.fromLTRB(24, 16, 24, 16),
      this.msShape,
      this.block = false,
      this.shape,
      this.soft = false,
      this.borderRadius,
      this.borderRadiusAll = 0,
      this.msBackgroundColor,
      this.backgroundColor = Colors.blue,
      this.buttonType = FuButtonType.elevated,
      this.style,
      this.msSide,
      this.disabled = false,
      this.side,
      this.borderColor = Colors.transparent,
      this.msShadowColor,
      this.msElevation,
      this.elevation = 4,
      this.shadowColor,
      this.splashColor});

  const FuButton.text(
      {required this.onPressed,
      required this.child,
      this.msPadding,
      this.padding = const EdgeInsets.fromLTRB(24, 16, 24, 16),
      this.msShape,
      this.block = false,
      this.shape,
      this.soft = false,
      this.borderRadius,
      this.borderRadiusAll = 0,
      this.msBackgroundColor,
      this.backgroundColor = Colors.blue,
      this.buttonType = FuButtonType.text,
      this.style,
      this.msSide,
      this.disabled = false,
      this.side,
      this.borderColor = Colors.transparent,
      this.msShadowColor,
      this.msElevation,
      this.elevation = 4,
      this.shadowColor,
      this.splashColor});

  const FuButton.block(
      {required this.onPressed,
      required this.child,
      this.msPadding,
      this.padding = const EdgeInsets.fromLTRB(24, 16, 24, 16),
      this.msShape,
      this.block = true,
      this.shape,
      this.soft = false,
      this.borderRadius,
      this.borderRadiusAll = 0,
      this.msBackgroundColor,
      this.backgroundColor = Colors.blue,
      this.buttonType = FuButtonType.elevated,
      this.style,
      this.msSide,
      this.disabled = false,
      this.side,
      this.borderColor = Colors.transparent,
      this.msShadowColor,
      this.msElevation,
      this.elevation = 4,
      this.shadowColor,
      this.splashColor});

  const FuButton.outlined(
      {required this.onPressed,
      required this.child,
      this.msPadding,
      this.padding = const EdgeInsets.fromLTRB(24, 16, 24, 16),
      this.msShape,
      this.soft = false,
      this.shape,
      this.borderRadius,
      this.borderRadiusAll = 0,
      this.msBackgroundColor,
      this.backgroundColor = Colors.blue,
      this.buttonType = FuButtonType.outlined,
      this.style,
      this.msSide,
      this.block = false,
      this.side,
      this.disabled = false,
      this.borderColor = Colors.transparent,
      this.msShadowColor,
      this.msElevation,
      this.elevation = 4,
      this.shadowColor,
      this.splashColor});

  const FuButton.large(
      {required this.onPressed,
      required this.child,
      this.msPadding,
      this.padding = const EdgeInsets.fromLTRB(36, 20, 36, 20),
      this.msShape,
      this.shape,
      this.soft = false,
      this.borderRadius,
      this.borderRadiusAll = 0,
      this.msBackgroundColor,
      this.backgroundColor = Colors.blue,
      this.buttonType = FuButtonType.elevated,
      this.style,
      this.disabled = false,
      this.msSide,
      this.side,
      this.block = false,
      this.borderColor = Colors.transparent,
      this.msShadowColor,
      this.msElevation,
      this.elevation = 4,
      this.shadowColor,
      this.splashColor});

  @override
  Widget build(BuildContext context) {
    Widget button;

    if (buttonType == FuButtonType.outlined) {
      button = OutlinedButton(
        onPressed: onPressed,
        child: child,
        style: style ??
            ButtonStyle(
                side: msSide ??
                    MaterialStateProperty.all(side ??
                        BorderSide(
                          color:
                              soft ? borderColor.withAlpha(100) : borderColor,
                          width: soft ? 0.8 : 1,
                        )),
                overlayColor: MaterialStateProperty.all(splashColor ??
                    (backgroundColor != null
                        ? backgroundColor!.withAlpha(40)
                        : null)),
                backgroundColor: soft
                    ? MaterialStateProperty.all(borderColor.withAlpha(40))
                    : null,
                foregroundColor:
                    MaterialStateProperty.all(borderColor.withAlpha(40)),
                shadowColor:
                    msShadowColor ?? MaterialStateProperty.all(shadowColor),
                padding: msPadding ?? MaterialStateProperty.all(padding),
                shape: MaterialStateProperty.all(shape ??
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(borderRadiusAll ?? 0),
                    ))),
      );
    } else if (buttonType == FuButtonType.elevated) {
      button = ElevatedButton(
          style: style ??
              ButtonStyle(
                  elevation: msElevation ??
                      MaterialStateProperty.resolveWith<double>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.disabled)) {
                            return 0;
                          } else if (states.contains(MaterialState.pressed)) {
                            return elevation! * 2;
                          } else if (states.contains(MaterialState.hovered)) {
                            return elevation! * 1.5;
                          }
                          return elevation!;
                        },
                      ),
                  backgroundColor: msBackgroundColor ??
                      MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.disabled)) {
                            return backgroundColor!.withAlpha(100);
                          }
                          return backgroundColor!;
                        },
                      ),
                  shadowColor: msShadowColor ??
                      MaterialStateProperty.all(shadowColor ?? backgroundColor),
                  padding: msPadding ?? MaterialStateProperty.all(padding),
                  shape: MaterialStateProperty.all(shape ??
                      RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(borderRadiusAll ?? 0),
                      ))),
          onPressed: disabled! ? null : onPressed,
          child: child);
    } else {
      button = TextButton(
        style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(splashColor ??
                (backgroundColor != null
                    ? backgroundColor!.withAlpha(40)
                    : null)),
            padding: msPadding ?? MaterialStateProperty.all(padding),
            visualDensity: VisualDensity.compact,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap),
        onPressed: disabled! ? null : onPressed,
        child: child,
      );
    }

    return block!
        ? Row(
            children: [
              Expanded(child: button),
            ],
          )
        : button;
  }
}

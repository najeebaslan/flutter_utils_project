/*File : FuTextField
Version : 1.2.0
*/

///There are mainly 2 styles of TextField.
///[FuTextFieldStyle.underlined] -  It gives underline to the textField.
///[FuTextFieldStyle.outlined] -  It gives outline to the textField.

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_utils_project/src/themes/app_theme.dart';
import 'package:flutter_utils_project/src/themes/text_style.dart';
import 'package:flutter_utils_project/src/utils/spacing.dart';
import 'dart:ui' as ui show BoxHeightStyle, BoxWidthStyle;

enum FuTextFieldType { email, password, name, address, mobileNumber }

enum FuTextFieldStyle {
  underlined,
  outlined,
}

class FuTextField extends StatefulWidget {
  final FuTextFieldType textFieldType;
  final FuTextFieldStyle textFieldStyle;
  final bool? autoIcon;
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final double? enabledBorderRadius;
  final double? focusedBorderRadius;
  final Color? prefixIconColor;
  final Color? suffixIconColor;
  final Color? labelTextColor;
  final bool? autoFocusedBorder;
  final bool enableHint;
  final Color? textColor;

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final InputDecoration? decoration;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization? textCapitalization;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextAlignVertical? textAlignVertical;
  final TextDirection? textDirection;
  final bool? autofocus;
  final String? obscuringCharacter;
  final bool? obscureText;
  final bool? autocorrect;
  final SmartDashesType? smartDashesType;
  final SmartQuotesType? smartQuotesType;
  final bool? enableSuggestions;
  final int? maxLines;
  final int? minLines;
  final bool? expands;
  final bool? readOnly;
  final ToolbarOptions? toolbarOptions;
  final bool? showCursor;
  final Brightness? keyboardAppearance;
  final int? noMaxLength = -1;
  final int? maxLength;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onSubmitted;
  final AppPrivateCommandCallback? onAppPrivateCommand;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final double? cursorWidth;
  final double? cursorHeight;
  final Radius? cursorRadius;
  final Color? cursorColor;
  final ui.BoxHeightStyle? selectionHeightStyle;
  final ui.BoxWidthStyle? selectionWidthStyle;
  final EdgeInsets? scrollPadding;
  final bool? enableInteractiveSelection;
  final TextSelectionControls? selectionControls;
  final DragStartBehavior? dragStartBehavior;

  bool? get selectionEnabled => enableInteractiveSelection;
  final GestureTapCallback? onTap;
  final MouseCursor? mouseCursor;
  final InputCounterWidgetBuilder? buildCounter;
  final ScrollPhysics? scrollPhysics;
  final ScrollController? scrollController;
  final Iterable<String>? autofillHints;
  final String? restorationId;

  // input decoration properties
  final Widget? icon;
  final String? labelText;
  final TextStyle? labelStyle;
  final String? helperText;
  final TextStyle? helperStyle;
  final int? helperMaxLines;
  final String? hintText;
  final TextStyle? hintStyle;
  final TextDirection? hintTextDirection;
  final int? hintMaxLines;
  final String? errorText;
  final TextStyle? errorStyle;
  final int? errorMaxLines;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final bool? isDense;
  final EdgeInsetsGeometry? contentPadding;
  final bool? isCollapsed;
  final Widget? prefixIcon;
  final BoxConstraints? prefixIconConstraints;
  final Widget? prefix;
  final String? prefixText;
  final TextStyle? prefixStyle;
  final Widget? suffixIcon;
  final Widget? suffix;
  final String? suffixText;
  final TextStyle? suffixStyle;
  final BoxConstraints? suffixIconConstraints;
  final String? counterText;
  final Widget? counter;
  final TextStyle? counterStyle;
  final bool? filled;
  final Color? fillColor;
  final Color? focusColor;
  final Color? hoverColor;
  final InputBorder? errorBorder;
  final InputBorder? focusedBorder;
  final InputBorder? focusedErrorBorder;
  final InputBorder? disabledBorder;
  final InputBorder? enabledBorder;
  final InputBorder? border;
  final bool? textEnabled;
  final String? semanticCounterText;
  final bool? alignLabelWithHint;
  final bool? allowSuffixIcon;

  const FuTextField(
      {this.controller,
      this.focusNode,
      this.decoration,
      this.keyboardType,
      this.textInputAction,
      this.textCapitalization,
      this.style,
      this.strutStyle,
      this.textAlign,
      this.textAlignVertical,
      this.textDirection,
      this.autofocus,
      this.obscuringCharacter,
      this.obscureText,
      this.autocorrect,
      this.smartDashesType,
      this.smartQuotesType,
      this.enableSuggestions,
      this.keyboardAppearance,
      this.maxLines,
      this.minLines,
      this.expands,
      this.readOnly,
      this.toolbarOptions,
      this.showCursor,
      this.maxLength,
      this.maxLengthEnforcement,
      this.onChanged,
      this.onEditingComplete,
      this.onSubmitted,
      this.onAppPrivateCommand,
      this.inputFormatters,
      this.enabled,
      this.cursorWidth,
      this.cursorHeight,
      this.cursorRadius,
      this.cursorColor,
      this.selectionHeightStyle,
      this.selectionWidthStyle,
      this.scrollPadding,
      this.enableInteractiveSelection,
      this.selectionControls,
      this.dragStartBehavior,
      this.onTap,
      this.mouseCursor,
      this.buildCounter,
      this.scrollPhysics,
      this.scrollController,
      this.autofillHints,
      this.restorationId,
//input decoration properties
      this.icon,
      this.labelText,
      this.labelStyle,
      this.helperText,
      this.helperStyle,
      this.helperMaxLines,
      this.hintText,
      this.hintStyle,
      this.hintTextDirection,
      this.hintMaxLines,
      this.errorText,
      this.errorStyle,
      this.errorMaxLines,
      this.floatingLabelBehavior,
      this.isCollapsed,
      this.isDense,
      this.contentPadding,
      this.prefixIcon,
      this.prefixIconConstraints,
      this.prefix,
      this.prefixText,
      this.prefixStyle,
      this.suffixIcon,
      this.suffix,
      this.suffixText,
      this.suffixStyle,
      this.suffixIconConstraints,
      this.counter,
      this.counterText,
      this.counterStyle,
      this.filled,
      this.fillColor,
      this.focusColor,
      this.hoverColor,
      this.errorBorder,
      this.focusedBorder,
      this.focusedErrorBorder,
      this.disabledBorder,
      this.enabledBorder,
      this.border,
      this.textEnabled,
      this.semanticCounterText,
      this.alignLabelWithHint,
      this.textFieldType = FuTextFieldType.name,
      this.textFieldStyle = FuTextFieldStyle.outlined,
      this.autoIcon,
      this.enabledBorderColor,
      this.focusedBorderColor,
      this.enabledBorderRadius,
      this.focusedBorderRadius,
      this.labelTextColor,
      this.prefixIconColor,
      this.suffixIconColor,
      this.autoFocusedBorder,
      this.enableHint = true,
      this.textColor,
      this.allowSuffixIcon});

  @override
  _FuTextFieldState createState() => _FuTextFieldState();
}

class _FuTextFieldState extends State<FuTextField> {
  late String? labelText;
  late TextInputType? keyboardType;
  late Color? fillColor;
  late InputBorder? enabledBorder;
  late InputBorder? focusedBorder;
  late bool? filled;
  late Widget? prefixIcon;
  late bool? obscureText;
  late int? maxLines;
  late Widget? suffixIcon;
  late bool showPassword;
  late bool autoIcon;
  late Color? enabledBorderColor;
  late Color? focusedBorderColor;
  late double? enabledBorderRadius;
  late double? focusedBorderRadius;
  late Color? prefixIconColor;
  late Color? suffixIconColor;
  late Color? labelTextColor, textColor;
  late Color? cursorColor;
  late bool autoFocusedBorder;
  late InputBorder? border;
  late bool allowSuffixIcon;

  @override
  void initState() {
    super.initState();
    showPassword = false;
    obscureText =
        widget.obscureText ?? widget.textFieldType == FuTextFieldType.password
            ? true
            : false;
  }

  @override
  Widget build(BuildContext context) {
    labelText = widget.labelText;
    keyboardType = widget.keyboardType;
    fillColor = widget.fillColor;
    enabledBorder = widget.enabledBorder;
    focusedBorder = widget.focusedBorder;
    filled = widget.filled;
    fillColor = fillColor ??
        FuAppTheme.getThemeFromThemeMode().inputDecorationTheme.fillColor ??
        Colors.transparent;
    prefixIcon = widget.prefixIcon;

    maxLines = widget.maxLines;

    suffixIcon = widget.suffixIcon;
    enabledBorderColor = widget.enabledBorderColor;
    focusedBorderColor = widget.focusedBorderColor;
    enabledBorderRadius = widget.enabledBorderRadius;
    focusedBorderRadius = widget.focusedBorderRadius;
    suffixIconColor = widget.suffixIconColor;
    prefixIconColor = widget.prefixIconColor;
    labelTextColor = widget.labelTextColor;
    cursorColor = widget.cursorColor;
    autoFocusedBorder = widget.autoFocusedBorder ?? true;
    border = widget.border;
    autoIcon = widget.autoIcon ?? true;
    textColor = widget.textColor ?? labelTextColor;
    allowSuffixIcon = widget.allowSuffixIcon ?? false;

    buildPasswordField();

    buildTextFieldStyle();

    buildTextFieldType();

    return TextField(
      style: widget.style ?? FuTextStyle.b1(color: textColor),
      onTap: widget.onTap,
      cursorColor: cursorColor,
      textAlign: widget.textAlign ?? TextAlign.start,
      decoration: widget.decoration ??
          InputDecoration(
            icon: widget.icon,
            border: widget.border,
            focusedBorder: focusedBorder,
            prefixIcon: prefixIcon,
            alignLabelWithHint: true,
            contentPadding: widget.contentPadding ?? FuSpacing.all(16),
            counter: widget.counter,
            counterStyle: widget.counterStyle,
            counterText: widget.counterText,
            disabledBorder: widget.disabledBorder,
            enabled: widget.textEnabled ?? true,
            enabledBorder: enabledBorder,
            errorBorder: widget.enabledBorder,
            errorMaxLines: widget.errorMaxLines,
            errorStyle: widget.errorStyle,
            errorText: widget.errorText,
            fillColor: fillColor,
            filled: filled,
            floatingLabelBehavior: widget.floatingLabelBehavior,
            focusColor: widget.focusColor,
            focusedErrorBorder: widget.focusedErrorBorder,
            suffixText: widget.suffixText,
            suffixStyle: widget.suffixStyle,
            suffixIconConstraints: widget.suffixIconConstraints,
            suffixIcon: suffixIcon,
            suffix: widget.suffix,
            semanticCounterText: widget.semanticCounterText,
            prefixText: widget.prefixText,
            prefixStyle: widget.prefixStyle,
            prefixIconConstraints: widget.prefixIconConstraints,
            prefix: widget.prefix,
            labelText: labelText,
            labelStyle:
                widget.labelStyle ?? FuTextStyle.b1(color: labelTextColor),
            helperMaxLines: widget.helperMaxLines,
            isDense: widget.isDense ?? false,
            helperStyle: widget.helperStyle,
            helperText: widget.helperText,
            isCollapsed: widget.isCollapsed ?? false,
            hoverColor: widget.hoverColor,
            hintMaxLines: widget.hintMaxLines,
            hintStyle: widget.hintStyle ??
                widget.labelStyle ??
                FuTextStyle.b1(color: labelTextColor),
            hintText: widget.enableHint ? (widget.hintText ?? labelText) : null,
            hintTextDirection: widget.hintTextDirection,
          ),
      autocorrect: widget.autocorrect ?? true,
      autofillHints: widget.autofillHints,
      autofocus: widget.autofocus ?? false,
      buildCounter: widget.buildCounter,
      controller: widget.controller,
      cursorHeight: widget.cursorHeight,
      cursorRadius: widget.cursorRadius,
      cursorWidth: widget.cursorWidth ?? 2.0,
      dragStartBehavior: widget.dragStartBehavior ?? DragStartBehavior.start,
      enabled: widget.enabled,
      enableInteractiveSelection: widget.enableInteractiveSelection ?? true,
      enableSuggestions: widget.enableSuggestions ?? true,
      expands: widget.expands ?? false,
      focusNode: widget.focusNode,
      inputFormatters: widget.inputFormatters,
      key: widget.key,
      keyboardType: keyboardType,
      maxLength: widget.maxLength,
      maxLengthEnforcement: widget.maxLengthEnforcement,
      maxLines: maxLines,
      minLines: widget.minLines,
      mouseCursor: widget.mouseCursor,
      obscureText: obscureText ?? false,
      obscuringCharacter: widget.obscuringCharacter ?? '•',
      onAppPrivateCommand: widget.onAppPrivateCommand,
      onChanged: widget.onChanged,
      onEditingComplete: widget.onEditingComplete,
      onSubmitted: widget.onSubmitted,
      readOnly: widget.readOnly ?? false,
      restorationId: widget.restorationId,
      scrollController: widget.scrollController,
      scrollPadding: widget.scrollPadding ?? const EdgeInsets.all(20.0),
      scrollPhysics: widget.scrollPhysics,
      selectionControls: widget.selectionControls,
      selectionHeightStyle:
          widget.selectionHeightStyle ?? ui.BoxHeightStyle.tight,
      selectionWidthStyle: widget.selectionWidthStyle ?? ui.BoxWidthStyle.tight,
      showCursor: widget.showCursor,
      smartDashesType: widget.smartDashesType,
      smartQuotesType: widget.smartQuotesType,
      strutStyle: widget.strutStyle,
      textAlignVertical: widget.textAlignVertical,
      textCapitalization: widget.textCapitalization ?? TextCapitalization.none,
      toolbarOptions: widget.toolbarOptions,
      textInputAction: widget.textInputAction,
      textDirection: widget.textDirection,
      keyboardAppearance: widget.keyboardAppearance,
    );
  }

  void buildTextFieldStyle() {
    switch (widget.textFieldStyle) {
      case FuTextFieldStyle.underlined:
        filled = filled ?? true;
        fillColor = fillColor ??
            FuAppTheme.getThemeFromThemeMode().inputDecorationTheme.fillColor;
        enabledBorder = enabledBorder ??
            UnderlineInputBorder(
              borderSide: BorderSide(
                color: enabledBorderColor ??
                    FuAppTheme.getThemeFromThemeMode()
                        .inputDecorationTheme
                        .enabledBorder!
                        .borderSide
                        .color,
              ),
            );

        focusedBorder = focusedBorder ??
            UnderlineInputBorder(
              borderSide: BorderSide(
                color: focusedBorderColor ??
                    FuAppTheme.getThemeFromThemeMode().colorScheme.primary,
              ),
            );
        break;

      case FuTextFieldStyle.outlined:
        filled = filled ?? false;
        fillColor = fillColor ??
            FuAppTheme.getThemeFromThemeMode().inputDecorationTheme.fillColor;
        enabledBorder = enabledBorder ??
            OutlineInputBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(enabledBorderRadius ?? 8)),
              borderSide: BorderSide(
                color: autoFocusedBorder
                    ? Colors.transparent
                    : enabledBorderColor ??
                        FuAppTheme.getThemeFromThemeMode()
                            .inputDecorationTheme
                            .enabledBorder!
                            .borderSide
                            .color,
              ),
            );

        focusedBorder = focusedBorder ??
            OutlineInputBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(enabledBorderRadius ?? 8)),
              borderSide: BorderSide(
                color: focusedBorderColor ??
                    FuAppTheme.getThemeFromThemeMode().colorScheme.primary,
              ),
            );
        border = enabledBorder;

        break;
    }
  }

  void buildTextFieldType() {
    if (labelText == null) {
      switch (widget.textFieldType) {
        case FuTextFieldType.email:
          prefixIcon = prefixIcon ??
              (autoIcon
                  ? Icon(
                      Icons.email_outlined,
                      color: prefixIconColor,
                    )
                  : null);

          labelText = "Email Address";
          keyboardType = keyboardType ?? TextInputType.emailAddress;
          break;
        case FuTextFieldType.password:
          maxLines = 1;
          prefixIcon = prefixIcon ??
              (autoIcon
                  ? Icon(
                      Icons.lock_outline,
                      color: prefixIconColor,
                    )
                  : null);
          labelText = "Password";
          keyboardType = keyboardType ?? TextInputType.text;
          obscureText = obscureText ?? true;
          break;
        case FuTextFieldType.name:
          prefixIcon = prefixIcon ??
              (autoIcon
                  ? Icon(
                      Icons.person_outline,
                      color: prefixIconColor,
                    )
                  : null);
          labelText = "Name";
          keyboardType = keyboardType ?? TextInputType.text;
          break;
        case FuTextFieldType.address:
          prefixIcon = prefixIcon ??
              (autoIcon
                  ? Icon(
                      Icons.location_on_outlined,
                      color: prefixIconColor,
                    )
                  : null);
          labelText = "Address";
          keyboardType = keyboardType ?? TextInputType.streetAddress;
          break;
        case FuTextFieldType.mobileNumber:
          prefixIcon = prefixIcon ??
              (autoIcon
                  ? Icon(
                      Icons.phone_outlined,
                      color: prefixIconColor,
                    )
                  : null);
          labelText = "Mobile Number";
          keyboardType = keyboardType ?? TextInputType.phone;
          break;
        default:
          labelText = "Label";
          break;
      }
    }
  }

  void buildPasswordField() {
    if (widget.textFieldType == FuTextFieldType.password) {
      suffixIcon = allowSuffixIcon
          ? InkWell(
              onTap: () {
                setState(() {
                  showPassword = !showPassword;
                  obscureText = !obscureText!;
                });
              },
              child: (showPassword
                  ? Icon(
                      Icons.visibility_outlined,
                      color: widget.suffixIconColor,
                      size: 20,
                    )
                  : Icon(
                      Icons.visibility_off_outlined,
                      color: widget.suffixIconColor,
                      size: 20,
                    )))
          : widget.suffixIcon;
    }
  }
}

/*
* File : SnapHelperWidget
* Version : 1.2.0
* */

/// [SnapHelperWidget] - SnapHelperWidget makes easy implementation for future or stream builder

import 'package:flutter/material.dart';
import 'package:flutter_utils_project/flutter_utils_project.dart';

class SnapHelperWidget<T> extends StatelessWidget {
  final dynamic initialData;
  final Future<T>? future;
  final Widget Function(T data) onSuccess;
  final Widget? loadingWidget;
  final Widget? errorWidget;
  final String? defaultErrorMessage;
  final bool useConnectionStateForLoader;

   SnapHelperWidget({
    required this.future,
    required this.onSuccess,
    this.loadingWidget,
    this.errorWidget,
    this.initialData,
    this.defaultErrorMessage,
    this.useConnectionStateForLoader = false,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: future,
      initialData: initialData,
      builder: (BuildContext context, AsyncSnapshot<T> snap) {
        if (!useConnectionStateForLoader) {
          if (snap.hasData) {
            if (snap.data != null) {
              return onSuccess(snap.data!);
            } else {
              return snapWidgetHelper(
                snap,
                errorWidget: errorWidget,
                loadingWidget: loadingWidget,
                defaultErrorMessage: defaultErrorMessage,
              );
            }
          } else {
            return snapWidgetHelper(
              snap,
              errorWidget: errorWidget,
              loadingWidget: loadingWidget,
              defaultErrorMessage: defaultErrorMessage,
            );
          }
        } else {
          switch (snap.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.active:
              return loadingWidget ??
                  CircularProgressIndicator(color: context.theme.primaryColor);
            case ConnectionState.done:
              if (snap.hasData) {
                if (snap.data != null) {
                  return onSuccess(snap.data!);
                } else {
                  return snapWidgetHelper(
                    snap,
                    errorWidget: errorWidget,
                    loadingWidget: loadingWidget,
                    defaultErrorMessage: defaultErrorMessage,
                  );
                }
              }
              if (!snap.hasData) {
                return const CircularProgressIndicator();
              } else {
                return errorWidget ??
                    Text(defaultErrorMessage ?? snap.error.toString(),
                            style: FuTextStyle.primaryTextStyle())
                        .center();
              }
            default:
              return const SizedBox();
          }
        }
      },
    );
  }

  /// Handle error and loading widget when using FutureBuilder or StreamBuilder
  Widget snapWidgetHelper<T>(
    AsyncSnapshot<T> snap, {
    Widget? errorWidget,
    Widget? loadingWidget,
    String? defaultErrorMessage,
    BuildContext? context,
    @Deprecated('Do not use this') bool checkHasData = false,
  }) {
    if (snap.hasError) {
      FuLog(snap.error.toString());
      return errorWidget ??
          Text(
            defaultErrorMessage ?? snap.error.toString(),
            style: FuTextStyle.primaryTextStyle(),
          ).center();
    } else if (!snap.hasData) {
      return loadingWidget ??
          CircularProgressIndicator(color: context?.theme.primaryColor);
    } else {
      return const SizedBox();
    }
  }
}

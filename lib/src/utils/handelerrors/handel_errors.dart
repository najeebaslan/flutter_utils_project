/*File : ApiErrorHandler
Version : 1.2.0
*/
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_utils_project/flutter_utils_project.dart';

class ApiErrorHandler {
  static parseError(
    ex,
    BuildContext context,
  ) {
    if (ex is SocketException) {
      FuErrorResponse.snackBarError(
        error:
            'The server is not connected Make sure you are connected to the Internet 😑',
        context: context,
        color: Colors.red,
      );

      FuLog('No Internet connection 😑');
    } else if (ex is HttpException) {
      FuErrorResponse.snackBarError(
        error: "Couldn't find the post 😱",
        context: context,
        color: Colors.red,
      );

      FuLog("Couldn't find the post ");
    } else if (ex is FormatException) {
      FuErrorResponse.snackBarError(
        error: "Bad response format 👎",
        context: context,
        color: Colors.red,
      );
      FuLog("Bad response format 👎");
    } else if (ex is PlatformException) {
      FuErrorResponse.snackBarError(
        error: "Make sure you are connected to the internet",
        context: context,
        color: Colors.red,
      );

      FuLog("Bad response format 👎");
    } else {
      FuErrorResponse.snackBarError(
        error: ex.toString(),
        context: context,
        color: Colors.red,
      );
    }
    return;
  }
}

//it's OPP snackBar
class FuErrorResponse {
  static snackBarError(
      {required String error,
      required BuildContext context,
      required Color color}) {
    return ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(
          backgroundColor: Colors.blueAccent,
          content: Text(error.toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700))));
  }
}

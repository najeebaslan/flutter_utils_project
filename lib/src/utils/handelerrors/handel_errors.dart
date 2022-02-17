/*File : ApiErrorHandler
Version : 0.0.1
*/
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ApiErrorHandler {
  static parseError( ex, BuildContext context,) {
    if (ex is SocketException) {
      FuErrorResponse.snackBarError('The server is not connected Make sure you are connected to the Internet 😑', context, Colors.red, );
      if (kDebugMode) { print('No Internet connection 😑');}
    } else if (ex is HttpException) {
      FuErrorResponse.snackBarError("Couldn't find the post 😱",context, Colors.red,);
      if (kDebugMode) { print("Couldn't find the post ");}
    } else if (ex is FormatException) {
      FuErrorResponse.snackBarError("Bad response format 👎", context,Colors.red,);
      if (kDebugMode) { print("Bad response format 👎"); }
    } else if (ex is PlatformException) {
      FuErrorResponse.snackBarError( "Make sure you are connected to the internet", context, Colors.red,);
      if (kDebugMode) { print("Bad response format 👎"); }
    } else {
      FuErrorResponse.snackBarError(ex.toString(), context,Colors.red, );
    }
    return;
  }
}

class FuErrorResponse {
  //this OPP snackBar
  static snackBarError(String error, BuildContext context, Color color) {
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

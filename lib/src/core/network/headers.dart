/*
* File : FuHeader
* Version : 1.2.0
* */

/// [FuHeader] -There are mainly 2 types of Header utils. headerWithoutToken - headerWithToken

import 'dart:io';

class FuHeader {
  static Map<String, String> headerWithoutToken() => {
        "Content-type": "application/json",
        "Accept": "application/json" "Access-Control-Allow-Origin: *",
      };

  static headerWithToken(
    String accessToken,
  ) {
    return {
      "Content-type": "application/json",
      "Accept": "application/json" "Access-Control-Allow-Origin: *",
      HttpHeaders.authorizationHeader: 'Bearer ' + accessToken
    };
  }
}

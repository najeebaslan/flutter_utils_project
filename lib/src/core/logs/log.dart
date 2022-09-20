/*
* File : FuLog
* Version : 1.2.0
* */

import 'package:flutter/foundation.dart';

/// [FuLog] - provides a way to print anything in the console-

class FuLog {
  static bool _enabled = true;

  FuLog(dynamic message) {
    if (_enabled) {
      if (kDebugMode) {
        print(message.toString());
      }
    }
  }

  static enable() {
    _enabled = true;
  }

  static disable() {
    _enabled = false;
  }

  static isEnabled() {
    return _enabled;
  }
}

/*
* File : FuLog
* Version : 1.0.0
* */

/// [FuLog] - provides a way to print anything in the console-

import 'dart:developer';

class FuLog {
  static bool _enabled = true;

  FuLog(dynamic message) {
    if (_enabled) {
      log(message.toString());
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

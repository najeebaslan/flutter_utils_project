import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class FuInputValidation{
//this is Global validation
  static String? validationTextField({
    required var controller,
    required String error,
    required String lengthMin,
    required String lengthMax,
    required int main,
    required int max,
  }) {
    if (controller is TextEditingController) {
      if (controller.text.trim().isEmpty) {
        return error.toString();
      } else if (controller.text.trim().length < main) {
        return lengthMin.toString();
      } else if (controller.text.trim().length > max) {
        return lengthMax.toString();
      }
    } else if (controller.trim() != null && controller.trim().isEmpty) {
      return error.toString();
    } else if (controller.trim().length < main) {
      return lengthMin.toString();
    } else if (controller.trim().length > max) {
      return lengthMax.toString();
    }
  }
}
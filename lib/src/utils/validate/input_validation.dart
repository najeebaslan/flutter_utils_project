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
    ///this is for check if controller equal  TextEditingController or no
    /// for if controller equal TextEditingController do it [controller.text] else do it [controller.trim() or anything]
    if (controller is TextEditingController) {
      ///if text is equal Empty return error
      if (controller.text.trim().isEmpty) {
        return error.toString();
        ///if the length of the text is less than the minimum
      } else if (controller.text.trim().length < main) {
        return lengthMin.toString();
        ///If the length of the text is greater than the maximum
      } else if (controller.text.trim().length > max) {
        return lengthMax.toString();
      }
       ///if text is equal Empty return error
    } else if (controller.trim() != null && controller.trim().isEmpty) {
      return error.toString();
      ///if the length of the text is less than the minimum
    } else if (controller.trim().length < main) {
      return lengthMin.toString();
      ///If the length of the text is greater than the maximum
    } else if (controller.trim().length > max) {
      return lengthMax.toString();
    }
  }
}
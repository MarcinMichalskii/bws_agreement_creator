import 'package:bws_agreement_creator/main.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/material.dart';

class SnackMessage {
  final String message;
  final Color? color;
  SnackMessage(this.message, this.color);
}

class SnackbarHandler {
  static void showSnackBar(String message, {Color? color}) {
    scaffoldKey.currentState!.showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: color ?? CustomColors.applicationColorMain,
    ));
  }
}

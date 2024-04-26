import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SnackMessage {
  final String message;
  final Color? color;
  SnackMessage(this.message, this.color);
}

final snackbarProvider = StateNotifierProvider<SnackbarNotifier, SnackMessage?>(
    (ref) => SnackbarNotifier());

class SnackbarNotifier extends StateNotifier<SnackMessage?> {
  SnackbarNotifier() : super(null);

  void showSnackBar(String message, {Color? color}) {
    state = SnackMessage(message, color);
  }
}

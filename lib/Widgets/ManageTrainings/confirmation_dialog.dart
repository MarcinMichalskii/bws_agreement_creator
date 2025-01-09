import 'package:bws_agreement_creator/Widgets/Components/yes_no_dialog.dart';
import 'package:flutter/material.dart';

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({super.key, required this.onConfirm});
  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    return YesNoDialog(onConfirm: onConfirm, text: 'Czy na pewno usunąć?');
  }
}

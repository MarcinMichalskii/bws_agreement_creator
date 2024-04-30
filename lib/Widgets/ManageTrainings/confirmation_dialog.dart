import 'package:bws_agreement_creator/Widgets/ManageTrainings/manage_trainings_scaffold.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/material.dart';

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({Key? key, required this.onConfirm})
      : super(key: key);
  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: CustomColors.almostBlack2,
      title: const Text('Czy na pewno usunąć?',
          style: TextStyle(color: CustomColors.gray)),
      actions: <Widget>[
        PillButton(
            title: 'Tak',
            onPress: () {
              onConfirm();
              Navigator.of(context).pop();
            }),
        PillButton(
          title: 'Nie',
          onPress: () {
            Navigator.of(context).pop();
          },
          color: CustomColors.gray,
        )
      ],
    );
  }
}

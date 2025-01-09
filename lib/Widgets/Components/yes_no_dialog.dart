import 'package:bws_agreement_creator/Widgets/ManageTrainings/manage_chapters_scaffold.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/material.dart';

class YesNoDialog extends StatelessWidget {
  const YesNoDialog({super.key, required this.onConfirm, required this.text});
  final VoidCallback onConfirm;
  final String text;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: CustomColors.almostBlack2,
      title: Text(text, style: TextStyle(color: CustomColors.gray)),
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

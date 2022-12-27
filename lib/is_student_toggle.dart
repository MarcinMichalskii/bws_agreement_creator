import 'package:bws_agreement_creator/colors.dart';
import 'package:flutter/material.dart';

class IsStudentToggle extends StatelessWidget {
  const IsStudentToggle(
      {super.key, required this.areYouAStudent, required this.onChanged});
  final bool areYouAStudent;
  final void Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 4),
      child: Row(children: [
        const Text(
          "Czy jesteś studentem?",
          style: TextStyle(color: CustomColors.gray, fontSize: 14),
        ),
        Switch(
          value: areYouAStudent,
          onChanged: onChanged,
          inactiveTrackColor:
              CustomColors.applicationColorMain.withOpacity(0.3),
          activeTrackColor: CustomColors.applicationColorMain.withOpacity(0.5),
          activeColor: CustomColors.applicationColorMain,
        )
      ]),
    );
  }
}

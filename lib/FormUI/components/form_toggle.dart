import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/material.dart';

class FormToggle extends StatelessWidget {
  const FormToggle(
      {super.key,
      required this.isOn,
      required this.onChanged,
      required this.title});
  final bool isOn;
  final void Function(bool) onChanged;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 4),
      child: Row(children: [
        Flexible(
          child: Text(
            title,
            style: const TextStyle(color: CustomColors.gray, fontSize: 14),
          ),
        ),
        Switch(
          value: isOn,
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

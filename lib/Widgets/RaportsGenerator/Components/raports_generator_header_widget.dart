import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/material.dart';

class RaportsGeneratorHeaderWidget extends StatelessWidget {
  final String text;
  final bool isOn;
  final ValueSetter<bool>? onToggle;
  const RaportsGeneratorHeaderWidget(
      {super.key, required this.text, this.isOn = false, this.onToggle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 20, color: CustomColors.gray),
          ),
          Spacer(),
          if (onToggle != null)
            Container(
              margin: EdgeInsets.only(right: 12),
              child: Switch(
                value: isOn,
                onChanged: (t) {
                  onToggle?.call(t);
                },
                activeColor: CustomColors.applicationColorMain,
                inactiveTrackColor: CustomColors.darkGray,
              ),
            )
        ],
      ),
    );
  }
}

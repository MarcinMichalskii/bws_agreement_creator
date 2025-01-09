import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RaportsGeneratorToggleWidget extends HookConsumerWidget {
  final String text;
  final bool isOn;
  final ValueSetter<bool> onToggle;
  const RaportsGeneratorToggleWidget({
    super.key,
    required this.text,
    required this.isOn,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context, ref) {
    final isOn = useState(this.isOn);

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: CustomColors.darkGray),
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
      child: Row(
        children: [
          Text(text, style: TextStyle(color: CustomColors.gray, fontSize: 17)),
          Spacer(),
          Switch(
            value: isOn.value,
            onChanged: (t) {
              isOn.value = t;
              onToggle(t);
            },
            activeColor: CustomColors.applicationColorMain,
            inactiveTrackColor: CustomColors.darkGray,
          ),
        ],
      ),
    );
  }
}

import 'package:bws_agreement_creator/Widgets/GenerateAgreement/test/touchable_opacity.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AnswerButton extends HookConsumerWidget {
  final String answer;
  final bool isSelected;
  final VoidCallback onPress;
  const AnswerButton(
      {super.key,
      required this.answer,
      required this.isSelected,
      required this.onPress});

  @override
  Widget build(BuildContext context, ref) {
    return TouchableOpacity(
      onTap: onPress,
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey,
              width: 0.5,
            ),
          ),
        ),
        margin: const EdgeInsets.symmetric(vertical: 2),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              Icon(Icons.check_circle,
                  color: isSelected ? CustomColors.green : CustomColors.gray,
                  size: 24),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 8),
                  child: Text(
                    answer,
                    softWrap: true,
                    style:
                        const TextStyle(fontSize: 19, color: CustomColors.gray),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

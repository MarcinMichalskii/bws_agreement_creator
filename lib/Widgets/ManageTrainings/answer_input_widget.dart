import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AnswerInputWidget extends HookConsumerWidget {
  final String letter;
  final String initialValue;
  final ValueSetter<String> onChanged;
  final VoidCallback onCorrectChanged;
  final VoidCallback onDelete;
  final bool isCorrect;

  AnswerInputWidget(
      {super.key,
      required this.onChanged,
      required this.letter,
      required this.initialValue,
      required this.isCorrect,
      required this.onCorrectChanged,
      required this.onDelete});

  @override
  Widget build(BuildContext context, ref) {
    return Row(
      children: [
        Text('$letter) ',
            style: const TextStyle(
                color: CustomColors.gray, fontSize: 17, height: 1.5)),
        Expanded(
            child: TextFormField(
                style: const TextStyle(
                    color: CustomColors.gray, fontSize: 17, height: 1.5),
                initialValue: initialValue,
                onChanged: onChanged,
                cursorColor: CustomColors.applicationColorMain,
                decoration: const InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: CustomColors.applicationColorMain),
                )))),
        IconButton(
            onPressed: () {
              onCorrectChanged();
            },
            icon: isCorrect
                ? const Icon(Icons.check, color: CustomColors.green)
                : const Icon(Icons.close, color: CustomColors.red)),
        IconButton(
            onPressed: onDelete,
            icon: const Icon(Icons.delete_outline, color: CustomColors.gray))
      ],
    );
  }
}

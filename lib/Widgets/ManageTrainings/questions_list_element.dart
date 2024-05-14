// hook consumer widget

import 'package:bws_agreement_creator/Widgets/GenerateAgreement/components/touchable_opacity.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class QuestionListElement extends HookConsumerWidget {
  final String question;
  final ValueSetter<String>? onQuestionDelete;
  final ValueSetter<String>? onQuestionOpen;
  const QuestionListElement(
      {Key? key,
      required this.question,
      this.onQuestionDelete,
      this.onQuestionOpen});

  @override
  Widget build(BuildContext context, ref) {
    return TouchableOpacity(
      onTap: () {
        // onChapterOpen(e);
      },
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Container(
                padding: const EdgeInsets.all(8),
                color: CustomColors.almostBlack2,
                child: Row(
                  children: [
                    const Icon(Icons.video_camera_back_outlined,
                        color: CustomColors.darkGray),
                    Container(
                      margin: const EdgeInsets.only(left: 8),
                      child: Text(question,
                          style: const TextStyle(
                              fontSize: 20, color: CustomColors.gray)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

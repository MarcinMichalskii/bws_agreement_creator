import 'package:bws_agreement_creator/Model/chapter_question_data.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/components/touchable_opacity.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class QuestionsListWidget extends HookConsumerWidget {
  final List<ChapterQuestionData> questions;
  final ValueSetter<String>? onQuestionDelete;
  final ValueSetter<ChapterQuestionData>? onQuestionEdit;

  const QuestionsListWidget({
    super.key,
    required this.questions,
    this.onQuestionDelete,
    this.onQuestionEdit,
  });

  @override
  Widget build(BuildContext context, ref) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 12),
          child: const Text("Pytania do rozdziału",
              style: TextStyle(fontSize: 18, color: CustomColors.gray)),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: questions.map((e) {
                    return TouchableOpacity(
                      onTap: () => onQuestionEdit!(e),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    color: CustomColors.almostBlack2,
                                    child: Row(
                                      children: [
                                        const Icon(Icons.quiz_outlined,
                                            color: CustomColors.darkGray),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(left: 8),
                                          child: Text(e.questionText,
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  color: CustomColors.gray)),
                                        ),
                                        const Spacer(),
                                        if (onQuestionDelete != null)
                                          TouchableOpacity(
                                              onTap: () {
                                                onQuestionDelete!(e.id);
                                              },
                                              child: const Icon(Icons.delete,
                                                  color:
                                                      CustomColors.darkGray)),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

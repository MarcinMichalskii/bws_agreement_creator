import 'package:bws_agreement_creator/Model/chapter_question_data.dart';
import 'package:bws_agreement_creator/Widgets/Components/default_list_element.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/components/touchable_opacity.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class QuestionsListWidget extends HookConsumerWidget {
  final List<QuestionData> questions;
  final ValueSetter<String>? onQuestionDelete;
  final ValueSetter<QuestionData>? onQuestionEdit;
  final VoidCallback onFilterTapped;

  const QuestionsListWidget({
    super.key,
    required this.questions,
    this.onQuestionDelete,
    this.onQuestionEdit,
    required this.onFilterTapped,
  });

  @override
  Widget build(BuildContext context, ref) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 32, height: 32),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 12),
                child: const Text("Pytania do szkolenia",
                    style: TextStyle(fontSize: 18, color: CustomColors.gray)),
              ),
              TouchableOpacity(
                  onTap: onFilterTapped,
                  child: Container(
                    margin: const EdgeInsets.only(right: 12),
                    child: const Icon(
                      Icons.filter_alt_outlined,
                      color: CustomColors.gray,
                    ),
                  ))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: questions.map((e) {
                      return DefaultListElement(
                          onElementTapped: () {
                            onQuestionEdit!(e);
                          },
                          onElementDelete: () {
                            onQuestionDelete!(e.id);
                          },
                          passed: e.passed,
                          title: e.questionText);
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

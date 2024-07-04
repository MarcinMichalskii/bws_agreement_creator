import 'package:bws_agreement_creator/Model/chapter_question_data.dart';
import 'package:bws_agreement_creator/Widgets/Components/default_list_element.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/components/bordered_input.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/components/touchable_opacity.dart';
import 'package:bws_agreement_creator/router.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class QuestionsListWidget extends HookConsumerWidget {
  final List<QuestionData> questions;
  final ValueSetter<String>? onQuestionDelete;
  final ValueSetter<QuestionData>? onQuestionEdit;
  final VoidCallback onFilterTapped;
  final ValueSetter<String> onFilterTextChanged;

  const QuestionsListWidget({
    super.key,
    required this.questions,
    this.onQuestionDelete,
    this.onQuestionEdit,
    required this.onFilterTapped,
    required this.onFilterTextChanged,
  });

  @override
  Widget build(BuildContext context, ref) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          if (isDekstop(context))
            QuestionsHeaderDesktop(
                onFilterTapped: onFilterTapped,
                questions: questions,
                onFilterTextChanged: onFilterTextChanged),
          if (!isDekstop(context))
            QuestionsHeaderMobile(
                onFilterTapped: onFilterTapped, questions: questions),
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

class QuestionsHeaderDesktop extends StatelessWidget {
  const QuestionsHeaderDesktop({
    super.key,
    required this.onFilterTapped,
    required this.questions,
    required this.onFilterTextChanged,
  });

  final VoidCallback onFilterTapped;
  final List<QuestionData> questions;
  final ValueSetter<String> onFilterTextChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 160,
          child: BorderedInput(
            placeholder: 'Wyszukaj',
            initialValue: null,
            onChanged: (text) {
              onFilterTextChanged(text ?? '');
            },
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 12),
          child: const Text("Pytania do szkolenia",
              style: TextStyle(fontSize: 18, color: CustomColors.gray)),
        ),
        SizedBox(
          width: 160,
          child: Row(
            children: [
              const Spacer(),
              Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: TouchableOpacity(
                        onTap: onFilterTapped,
                        child: Container(
                          margin: const EdgeInsets.only(right: 12),
                          child: const Icon(
                            Icons.filter_alt_outlined,
                            color: CustomColors.gray,
                          ),
                        )),
                  ),
                  Positioned(
                      bottom: 2,
                      right: 8,
                      child: Text(
                        '${questions.length}',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 10),
                      ))
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

class QuestionsHeaderMobile extends StatelessWidget {
  const QuestionsHeaderMobile({
    super.key,
    required this.onFilterTapped,
    required this.questions,
  });

  final VoidCallback onFilterTapped;
  final List<QuestionData> questions;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(width: 32, height: 32),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 12),
          child: const Text("Pytania do szkolenia",
              style: TextStyle(fontSize: 18, color: CustomColors.gray)),
        ),
        Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              child: TouchableOpacity(
                  onTap: onFilterTapped,
                  child: Container(
                    margin: const EdgeInsets.only(right: 12),
                    child: const Icon(
                      Icons.filter_alt_outlined,
                      color: CustomColors.gray,
                    ),
                  )),
            ),
            Positioned(
                bottom: 2,
                right: 8,
                child: Text(
                  '${questions.length}',
                  style: const TextStyle(color: Colors.white, fontSize: 10),
                ))
          ],
        )
      ],
    );
  }
}

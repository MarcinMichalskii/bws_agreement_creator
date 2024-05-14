import 'package:bws_agreement_creator/Model/examine_result.dart';
import 'package:bws_agreement_creator/Widgets/ManageTrainings/manage_trainings_scaffold.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChapterExamineFinished extends HookConsumerWidget {
  final int numberOfQuestions;
  final ExamineResultData result;

  const ChapterExamineFinished(
      {Key? key, required this.result, required this.numberOfQuestions})
      : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Column(children: [
      Text(
        result.passed ? 'Gratulacje!' : 'Spróbuj ponownie!',
        style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: CustomColors.gray),
      ),
      if (result.passed)
        const Text(
          'Egzamin zaliczony',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: CustomColors.gray),
        ),
      Text(
        'Zdobyłeś ${result.correctAnswers} / $numberOfQuestions punktów!',
        style: const TextStyle(
          color: CustomColors.gray,
          fontSize: 18,
        ),
      ),
      Container(
        margin: const EdgeInsets.only(top: 16),
        child: PillButton(
            title: "Powrót",
            onPress: () {
              Navigator.of(context).pop();
            }),
      )
    ]);
  }
}

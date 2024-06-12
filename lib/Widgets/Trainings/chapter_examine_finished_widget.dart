import 'package:bws_agreement_creator/Model/examine_result.dart';
import 'package:bws_agreement_creator/Providers/check_examine_provider.dart';
import 'package:bws_agreement_creator/Providers/get_chapter_questions_provider.dart';
import 'package:bws_agreement_creator/Widgets/ManageTrainings/manage_chapters_scaffold.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChapterExamineFinished extends HookConsumerWidget {
  final int numberOfQuestions;
  final ExamineResultData result;
  final String chapterId;

  const ChapterExamineFinished(
      {Key? key,
      required this.result,
      required this.numberOfQuestions,
      required this.chapterId})
      : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.center,
      child: Column(children: [
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
        if (!result.passed)
          const Text(
            textAlign: TextAlign.center,
            'Nie zdobyto wymaganej ilości punktów. Żeby zaliczyć musisz mieć przynajmniej 70% prawidłowych odpowiedzi',
            style: TextStyle(fontSize: 18, color: CustomColors.gray),
          ),
        Container(
          margin: const EdgeInsets.only(top: 16),
          child: PillButton(
              title: "Powrót",
              onPress: () {
                ref.read(checkExamineProivder(chapterId).notifier).resetState();
                ref
                    .read(getChapterQuestionsProvider(chapterId).notifier)
                    .resetState();
                if (result.passed) {
                  Navigator.of(context).pop();
                }
                Navigator.of(context).pop();
              }),
        )
      ]),
    );
  }
}

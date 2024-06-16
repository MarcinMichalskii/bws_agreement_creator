import 'package:bws_agreement_creator/Model/examine_result.dart';
import 'package:bws_agreement_creator/Widgets/ManageTrainings/manage_chapters_scaffold.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class VideoExamineFinishedWidget extends HookConsumerWidget {
  final int numberOfQuestions;
  final ExamineResultData result;

  final VoidCallback onFinish;
  final String title;
  final bool passingAgain;
  final bool isLastVideo;

  const VideoExamineFinishedWidget(
      {Key? key,
      required this.passingAgain,
      required this.title,
      required this.result,
      required this.numberOfQuestions,
      required this.onFinish,
      required this.isLastVideo})
      : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: CustomColors.almostBlack,
            borderRadius: BorderRadius.circular(16),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 16),
          alignment: Alignment.center,
          child: Column(children: [
            Text(
              result.passed ? 'Quiz zaliczony!' : 'Spróbuj ponownie!',
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: CustomColors.gray),
            ),
            if (result.passed)
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: const Icon(Icons.thumb_up_alt_outlined,
                    size: 70, color: CustomColors.darkGreen),
              ),
            Container(
              margin: const EdgeInsets.only(top: 4),
              child: Text(
                'Zdobyłeś ${result.correctAnswers} / $numberOfQuestions punktów!',
                style: const TextStyle(
                  color: CustomColors.gray,
                  fontSize: 18,
                ),
              ),
            ),
            if (result.passed && !passingAgain && !isLastVideo)
              Container(
                margin: const EdgeInsets.only(top: 16),
                child: const Text(
                  textAlign: TextAlign.left,
                  'Możesz teraz przejść do kolejnego filmu',
                  style: TextStyle(
                    color: CustomColors.gray,
                    fontSize: 18,
                  ),
                ),
              ),
            if (result.passed && !passingAgain && isLastVideo)
              Container(
                margin: const EdgeInsets.only(top: 16),
                child: const Text(
                  textAlign: TextAlign.left,
                  'Możesz teraz przejść do egzaminu podsumowującego',
                  style: TextStyle(
                    color: CustomColors.gray,
                    fontSize: 18,
                  ),
                ),
              ),
            if (!result.passed)
              const Text(
                textAlign: TextAlign.center,
                'Nie zdobyto wymaganej ilości punktów. Żeby zaliczyć musisz mieć przynajmniej 90% prawidłowych odpowiedzi',
                style: TextStyle(fontSize: 18, color: CustomColors.gray),
              ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: PillButton(title: title, onPress: onFinish),
            )
          ]),
        ),
        const Spacer(),
      ],
    );
  }
}

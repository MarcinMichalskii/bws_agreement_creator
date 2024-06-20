import 'package:bws_agreement_creator/Model/examine_result.dart';
import 'package:bws_agreement_creator/Widgets/ManageTrainings/manage_chapters_scaffold.dart';
import 'package:bws_agreement_creator/Widgets/Trainings/WatchVideo/video_player_widget.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChapterExamineFinishedWidget extends HookConsumerWidget {
  final int numberOfQuestions;
  final ExamineResultData result;

  final VoidCallback onFinish;
  final String title;
  final String chapterName;
  final bool passingAgain;
  final String? outroUrl;

  const ChapterExamineFinishedWidget(
      {Key? key,
      required this.passingAgain,
      required this.title,
      required this.result,
      required this.numberOfQuestions,
      required this.onFinish,
      required this.chapterName,
      required this.outroUrl})
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
              result.passed ? 'Gratulacje!' : 'Spróbuj ponownie!',
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: CustomColors.gray),
            ),
            if (result.passed)
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: const Icon(Icons.rocket_launch_outlined,
                    size: 110, color: CustomColors.darkGreen),
              ),
            if (!result.passed)
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: const Icon(Icons.sentiment_very_dissatisfied_outlined,
                    size: 110, color: CustomColors.mildRed),
              ),
            if (result.passed && !passingAgain)
              Text(
                textAlign: TextAlign.center,
                'Ukończyłeś szkolenie "${chapterName}"',
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: CustomColors.gray),
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
            if (result.passed && !passingAgain)
              Container(
                margin: const EdgeInsets.only(top: 16),
                child: const Text(
                  textAlign: TextAlign.left,
                  'Teraz w profilu sinch możesz zapisać się na praktyczną część szkolenia \nDo Twojego profilu została dodana nowa odznaka',
                  style: TextStyle(
                    color: CustomColors.gray,
                    fontSize: 18,
                  ),
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
              child: PillButton(title: title, onPress: onFinish),
            )
          ]),
        ),
        if (result.passed && !passingAgain && outroUrl != null)
          Container(
            padding: const EdgeInsets.all(16),
            child: VideoPlayerWidget(
                url: outroUrl!,
                onPlayingChanged: (e) {},
                onTimeUpdate: (e) {},
                onDurationChanged: (e) {},
                initialStart: 0),
          ),
        const Spacer(),
      ],
    );
  }
}

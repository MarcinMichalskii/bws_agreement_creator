import 'package:bws_agreement_creator/Widgets/Trainings/examine/components/examine_navigation_ui.dart';
import 'package:bws_agreement_creator/Widgets/Trainings/examine/components/examine_question_ui.dart';
import 'package:bws_agreement_creator/Widgets/Trainings/examine/examine_provider.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ExamineUI extends HookConsumerWidget {
  const ExamineUI(
      {super.key, required this.onExamFinished, required this.isLoading});

  final VoidCallback onExamFinished;
  final bool isLoading;

  @override
  Widget build(BuildContext context, ref) {
    if (isLoading) {
      return const Center(
          child: CircularProgressIndicator(
        color: CustomColors.applicationColorMain,
      ));
    }

    final canGoToNextQuestion =
        ref.watch(examineProvider)!.nextQuestionAvailable;
    final canGoToPreviousQuestion =
        ref.watch(examineProvider)!.previousQuestionAvailable;
    final answerSelected = ref.watch(examineProvider)!.currentQuestionAnswered;
    final finalQuestion = ref.watch(examineProvider)!.isFinalQuestion;
    final selectedQuestion = ref.watch(examineProvider)!.selectedQuestion;
    final questions = ref.watch(examineProvider)!.questions;
    final selectedIndex = ref.watch(examineProvider)!.selectedIndex;

    return Column(
      children: [
        ExamineQuestionUI(
            question: selectedQuestion,
            updateAnswerForQuestion:
                ref.read(examineProvider.notifier).updateAnswerForQuestion),
        ExamineNavigationUI(
          canGoToNextQuestion: canGoToNextQuestion,
          canGoToPreviousQuestion: canGoToPreviousQuestion,
          answerSelected: answerSelected,
          finalQuestion: finalQuestion,
          onPreviousPressed: () {
            ref.read(examineProvider.notifier).previousQuestion();
          },
          onNextPressed: () {
            if (!answerSelected) {
              return;
            }
            ref.read(examineProvider.notifier).nextQuestion();
          },
          onFinishExam: onExamFinished,
          examPositionText: "${selectedIndex + 1}/${questions.length}",
        )
      ],
    );
  }
}

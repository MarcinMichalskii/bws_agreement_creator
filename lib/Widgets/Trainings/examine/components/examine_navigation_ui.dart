import 'package:bws_agreement_creator/Widgets/Trainings/examine/components/examine_navigation_button.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/material.dart';

class ExamineNavigationUI extends StatelessWidget {
  const ExamineNavigationUI({
    super.key,
    required this.onPreviousPressed,
    required this.onNextPressed,
    required this.onFinishExam,
    required this.examPositionText,
    required this.answerSelected,
    required this.canGoToPreviousQuestion,
    required this.canGoToNextQuestion,
    required this.finalQuestion,
  });

  final bool canGoToPreviousQuestion;
  final bool canGoToNextQuestion;
  final bool answerSelected;
  final bool finalQuestion;

  final VoidCallback onPreviousPressed;
  final VoidCallback onNextPressed;
  final VoidCallback onFinishExam;
  final String examPositionText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Row(
        children: [
          ExamineNavigationButton(
              title: "Poprzednie",
              enabled: canGoToPreviousQuestion,
              onPress: onPreviousPressed),
          const Spacer(),
          Text(examPositionText,
              style: const TextStyle(color: CustomColors.gray, fontSize: 20)),
          const Spacer(),
          if (canGoToNextQuestion)
            ExamineNavigationButton(
                title: "Następne",
                enabled: answerSelected,
                onPress: onNextPressed),
          if (finalQuestion)
            ExamineNavigationButton(
                title: "Zakończ egzamin",
                enabled: answerSelected,
                onPress: onFinishExam),
        ],
      ),
    );
  }
}

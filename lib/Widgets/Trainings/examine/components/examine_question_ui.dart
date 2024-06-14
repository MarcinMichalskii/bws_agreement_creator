import 'package:bws_agreement_creator/Widgets/Trainings/examine/components/examine_answer_button.dart';
import 'package:bws_agreement_creator/Widgets/Trainings/examine/quiz_question.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/material.dart';

class ExamineQuestionUI extends StatelessWidget {
  const ExamineQuestionUI({
    super.key,
    required this.question,
    required this.updateAnswerForQuestion,
  });

  final QuizQuestion question;
  final ValueSetter<String> updateAnswerForQuestion;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: CustomColors.almostBlack2,
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 12),
            child: Text(question.question.questionText,
                style: const TextStyle(color: CustomColors.gray, fontSize: 20)),
          ),
          ...question.question.answers.map((answer) {
            return AnswerButton(
              answer: answer,
              isSelected: question.markedAnswer == answer,
              onPress: () {
                updateAnswerForQuestion(answer);
              },
            );
          }).toList()
        ],
      ),
    );
  }
}

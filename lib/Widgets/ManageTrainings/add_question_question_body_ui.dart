import 'package:bws_agreement_creator/Widgets/GenerateAgreement/Components/bordered_input.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/Components/touchable_opacity.dart';
import 'package:bws_agreement_creator/Widgets/ManageTrainings/answer_draft.dart';
import 'package:bws_agreement_creator/Widgets/ManageTrainings/answer_input_widget.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/material.dart';

class AddQuestionQuestionBodyUI extends StatelessWidget {
  const AddQuestionQuestionBodyUI({
    super.key,
    required this.question,
    required this.onQuestionChanged,
    required this.answers,
    required this.onDeleteAnswer,
    required this.onAnswerTextChanged,
    required this.onCorrectAnswerChanged,
    required this.onAddAnswer,
  });

  final String question;
  final ValueSetter<String> onQuestionChanged;
  final List<AnswerDraft> answers;
  final ValueSetter<int> onDeleteAnswer;
  final Null Function(AnswerDraft draft, String newText) onAnswerTextChanged;
  final ValueSetter<AnswerDraft> onCorrectAnswerChanged;
  final VoidCallback onAddAnswer;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      BorderedInput(
        placeholder: 'Treść pytania',
        initialValue: question,
        onChanged: (text) {
          onQuestionChanged(text ?? '');
        },
      ),
      ...answers.asMap().entries.map((entry) {
        final index = entry.key;
        final answer = entry.value;
        final letter = String.fromCharCode(index + 65);
        return AnswerInputWidget(
          onDelete: () {
            onDeleteAnswer(index);
          },
          onChanged: (newText) {
            onAnswerTextChanged(answer, newText);
          },
          letter: letter,
          initialValue: entry.value.text,
          isCorrect: answer.isCorrect,
          onCorrectChanged: () {
            onCorrectAnswerChanged(answer);
          },
        );
      }),
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: TouchableOpacity(
            onTap: onAddAnswer,
            child: const Icon(Icons.add,
                color: CustomColors.applicationColorMain)),
      ),
    ]);
  }
}

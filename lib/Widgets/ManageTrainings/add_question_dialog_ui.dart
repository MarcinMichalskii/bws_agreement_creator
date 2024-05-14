import 'package:bws_agreement_creator/Widgets/GenerateAgreement/components/bordered_input.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/components/generate_pdf_button.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/components/touchable_opacity.dart';
import 'package:bws_agreement_creator/Widgets/ManageTrainings/answer_draft.dart';
import 'package:bws_agreement_creator/Widgets/ManageTrainings/answer_input_widget.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddQuestionDialogUI extends HookConsumerWidget {
  final String chapterId;
  final VoidCallback onSavedPressed;
  final List<AnswerDraft> answers;
  final ValueSetter<String> onQuestionChanged;
  final ValueSetter<List<AnswerDraft>> onAnswersChanged;
  final String question;
  final bool isLoading;
  const AddQuestionDialogUI(
      {super.key,
      required this.question,
      required this.answers,
      required this.chapterId,
      required this.onSavedPressed,
      required this.onQuestionChanged,
      required this.onAnswersChanged,
      required this.isLoading});

  @override
  Widget build(BuildContext context, ref) {
    final onAddAnswer = useCallback(() {
      final newAnswers = [...answers];
      final newAnswer = AnswerDraft(text: '', isCorrect: false);
      newAnswers.add(newAnswer);
      onAnswersChanged(newAnswers);
    }, [answers]);

    final onDeleteAnswer = useCallback((int index) {
      final newAnswers = [...answers];
      newAnswers.removeAt(index);
      onAnswersChanged(newAnswers);
    }, [answers]);

    final onAnswerTextChanged =
        useCallback((AnswerDraft draft, String newText) {
      final newAnswers = [...answers];
      final index = newAnswers.indexWhere((element) => element.id == draft.id);
      newAnswers[index] =
          AnswerDraft(text: newText, isCorrect: draft.isCorrect);
      onAnswersChanged(newAnswers);
    }, [answers]);

    final onCorrectAnswerChanged = useCallback((AnswerDraft draft) {
      List<AnswerDraft> newAnswers = [...answers];
      final index = newAnswers.indexWhere((element) => element.id == draft.id);
      newAnswers = newAnswers.map((e) {
        return e.copyWith(isCorrect: false);
      }).toList();
      newAnswers[index] = AnswerDraft(text: draft.text, isCorrect: true);
      onAnswersChanged(newAnswers);
    }, [answers]);

    return Dialog(
      backgroundColor: CustomColors.almostBlack3,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Nowe pytanie',
                style: TextStyle(color: CustomColors.gray, fontSize: 17)),
            const SizedBox(height: 16),
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
            const SizedBox(height: 16),
            isLoading
                ? const CircularProgressIndicator(
                    color: CustomColors.applicationColorMain)
                : DefaultBorderedButton(
                    text: "Zapisz",
                    borderColor: CustomColors.applicationColorMain,
                    onTap: onSavedPressed)
          ],
        ),
      ),
    );
  }
}

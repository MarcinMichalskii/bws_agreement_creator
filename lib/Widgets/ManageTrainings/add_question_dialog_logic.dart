import 'package:bws_agreement_creator/Providers/add_question_provider.dart';
import 'package:bws_agreement_creator/Providers/add_video_provider.dart';
import 'package:bws_agreement_creator/Widgets/ManageTrainings/add_question_dialog_ui.dart';
import 'package:bws_agreement_creator/Widgets/ManageTrainings/answer_draft.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddQuestionDialogLogic extends HookConsumerWidget {
  final String chapterId;
  const AddQuestionDialogLogic({Key? key, required this.chapterId})
      : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final question = useState('');
    final answers = useState<List<AnswerDraft>>([]);
    final onQuestionChanged = useCallback((String text) {
      question.value = text;
    }, [question.value]);

    final onAnswersChanged = useCallback((List<AnswerDraft> newAnswers) {
      answers.value = newAnswers;
    }, [answers.value]);

    ref.listen(addQuestionProvider, (previous, next) {
      if (next.data != null) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: CustomColors.applicationColorMain,
            content: Text('Dodano nowe pytanie')));
        Navigator.of(context).pop();
      }
    });

    final onSavedPressed = useCallback(() {
      ref.read(addQuestionProvider.notifier).addQuestion(
          question: question.value,
          answers: answers.value,
          chapterId: chapterId);
    }, [question.value, answers.value]);
    final isLoading = ref.watch(addVideoProvider).isLoading;

    return AddQuestionDialogUI(
        question: question.value,
        answers: answers.value,
        chapterId: chapterId,
        onSavedPressed: onSavedPressed,
        onQuestionChanged: onQuestionChanged,
        onAnswersChanged: onAnswersChanged,
        isLoading: isLoading);
  }
}

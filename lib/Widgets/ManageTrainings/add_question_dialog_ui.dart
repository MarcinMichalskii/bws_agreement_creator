import 'package:bws_agreement_creator/Model/video_data.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/test/default_bordered_button.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/test/touchable_opacity.dart';
import 'package:bws_agreement_creator/Widgets/ManageTrainings/add_question_question_body_ui.dart';
import 'package:bws_agreement_creator/Widgets/ManageTrainings/add_question_select_videos_ui.dart';
import 'package:bws_agreement_creator/Widgets/ManageTrainings/answer_draft.dart';
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
  final String title;
  final List<VideoData> videosList;
  final List<VideoData> selectedVideos;
  final ValueSetter<List<VideoData>> onSelectedVideosChanged;
  const AddQuestionDialogUI(
      {super.key,
      required this.title,
      required this.question,
      required this.answers,
      required this.chapterId,
      required this.onSavedPressed,
      required this.onQuestionChanged,
      required this.onAnswersChanged,
      required this.videosList,
      required this.selectedVideos,
      required this.onSelectedVideosChanged,
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

    final selectingVideos = useState(false);

    final toggleSelectingVideos = useCallback(() {
      selectingVideos.value = !selectingVideos.value;
    }, [selectingVideos.value]);

    return Dialog(
      backgroundColor: CustomColors.almostBlack3,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 24,
                  height: 24,
                ),
                Text(title,
                    style: const TextStyle(
                        color: CustomColors.gray, fontSize: 17)),
                TouchableOpacity(
                  onTap: () {
                    toggleSelectingVideos();
                  },
                  child: Icon(
                      !selectingVideos.value
                          ? Icons.playlist_add_check_circle_outlined
                          : Icons.not_listed_location_outlined,
                      color: CustomColors.gray),
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (!selectingVideos.value)
              AddQuestionQuestionBodyUI(
                  question: question,
                  onQuestionChanged: onQuestionChanged,
                  answers: answers,
                  onDeleteAnswer: onDeleteAnswer,
                  onAnswerTextChanged: onAnswerTextChanged,
                  onCorrectAnswerChanged: onCorrectAnswerChanged,
                  onAddAnswer: onAddAnswer),
            if (selectingVideos.value)
              AddQuestionSelectItemsUI(
                  itemsList: videosList,
                  selectedItems: selectedVideos,
                  onSelectedItemsChanged: onSelectedVideosChanged,
                  labelExtractor: (element) {
                    return element.name;
                  }),
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

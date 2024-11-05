import 'package:bws_agreement_creator/Model/chapter_question_data.dart';
import 'package:bws_agreement_creator/Model/video_data.dart';
import 'package:bws_agreement_creator/Providers/add_video_provider.dart';
import 'package:bws_agreement_creator/Providers/get_videos_provider.dart';
import 'package:bws_agreement_creator/Providers/update_question_provider.dart';
import 'package:bws_agreement_creator/Widgets/ManageTrainings/add_question_dialog_ui.dart';
import 'package:bws_agreement_creator/Widgets/ManageTrainings/answer_draft.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EditQuestionDialogLogic extends HookConsumerWidget {
  final String chapterId;
  final QuestionData questionData;
  const EditQuestionDialogLogic(
      {super.key, required this.chapterId, required this.questionData});

  @override
  Widget build(BuildContext context, ref) {
    final mapped = questionData.answers
        .map((e) =>
            AnswerDraft(text: e, isCorrect: e == questionData.correctAnswer))
        .toList();
    final question = useState(questionData.questionText);
    final answers = useState<List<AnswerDraft>>(mapped);
    final onQuestionChanged = useCallback((String text) {
      question.value = text;
    }, [question.value]);

    final onAnswersChanged = useCallback((List<AnswerDraft> newAnswers) {
      answers.value = newAnswers;
    }, [answers.value]);

    ref.listen(updateQuestionProvider, (previous, next) {
      if (next.data != null) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: CustomColors.applicationColorMain,
            content: Text('Pytanie zakutalizowane')));
        Navigator.of(context).pop();
      }
    });

    final List<VideoData> videosList =
        ref.watch(getVideosProvider(chapterId)).data ?? [];
    final selectedVideos = useState<List<VideoData>>(videosList
        .where((element) => questionData.videos.contains(element.id))
        .toList());
    final onSelectedVideosChanged = useCallback((List<VideoData> selected) {
      selectedVideos.value = selected;
    }, []);

    final onSavedPressed = useCallback(() {
      ref.read(updateQuestionProvider.notifier).updateQuestion(
          questionId: questionData.id,
          questionText: question.value,
          answers: answers.value,
          videos: selectedVideos.value.map((e) => e.id).toList(),
          chapterId: chapterId);
    }, [question.value, answers.value]);
    final isLoading = ref.watch(addVideoProvider).isLoading;

    return AddQuestionDialogUI(
        title: 'Edytuj pytanie',
        question: question.value,
        answers: answers.value,
        chapterId: chapterId,
        onSavedPressed: onSavedPressed,
        onQuestionChanged: onQuestionChanged,
        onAnswersChanged: onAnswersChanged,
        videosList: videosList,
        selectedVideos: selectedVideos.value,
        onSelectedVideosChanged: onSelectedVideosChanged,
        isLoading: isLoading);
  }
}

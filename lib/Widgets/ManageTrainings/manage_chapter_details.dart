import 'package:bws_agreement_creator/Providers/delete_question_provider.dart';
import 'package:bws_agreement_creator/Providers/delete_video_provider.dart';
import 'package:bws_agreement_creator/Providers/get_chapter_questions_provider.dart';
import 'package:bws_agreement_creator/Providers/get_videos_provider.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/EmployeeForm/form_widget.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/components/touchable_opacity.dart';
import 'package:bws_agreement_creator/Widgets/ManageTrainings/add_question_dialog_logic.dart';
import 'package:bws_agreement_creator/Widgets/ManageTrainings/add_video.dialog.dart';
import 'package:bws_agreement_creator/Widgets/ManageTrainings/confirmation_dialog.dart';
import 'package:bws_agreement_creator/Widgets/ManageTrainings/edit_question_dialog_logic.dart';
import 'package:bws_agreement_creator/Widgets/ManageTrainings/videos_list_widget.dart';
import 'package:bws_agreement_creator/Widgets/ManageTrainings/questions_list_widget.dart';
import 'package:bws_agreement_creator/Widgets/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ManageChapterDetailsScaffold extends HookConsumerWidget with RouteAware {
  final String chapterId;
  final String chapterTitle;
  const ManageChapterDetailsScaffold(
      {super.key, required this.chapterId, required this.chapterTitle});

  @override
  Widget build(BuildContext context, ref) {
    final videosProvider = getVideosProvider(chapterId);
    final questionsProvider = getChapterQuestionsProvider(chapterId);
    final videos = ref.watch(videosProvider).data ?? [];
    final questions = ref.watch(questionsProvider).data ?? [];
    final onQuestionDelete = useCallback((questionId) {
      showDialog(
          context: context,
          builder: (context) {
            return ConfirmationDialog(
              onConfirm: () {
                ref.read(deleteQuestionProvider.notifier).deleteQuestion(
                    questionId: questionId, chapterId: chapterId);
              },
            );
          });
    }, [chapterId]);

    final onVideoDelete = useCallback((videoId) {
      showDialog(
          context: context,
          builder: (context) {
            return ConfirmationDialog(
              onConfirm: () {
                ref
                    .read(deleteVideoProvider.notifier)
                    .deleteVideo(videoId: videoId, chapterId: chapterId);
              },
            );
          });
    }, [chapterId]);

    final onQuestionEdit = useCallback((question) {
      showDialog(
          context: context,
          builder: (_) => EditQuestionDialogLogic(
                chapterId: chapterId,
                questionData: question,
              ));
    }, [chapterId]);

    useBuildEffect(() {
      ref.read(videosProvider.notifier).getVideos();
      ref.read(questionsProvider.notifier).getChapterQuestions();
    }, []);
    return AppScaffold(
        title: "Rozdział $chapterTitle",
        actions: [
          TouchableOpacity(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (_) =>
                        AddQuestionDialogLogic(chapterId: chapterId));
              },
              child: const Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: Icon(Icons.add_task_outlined))),
          TouchableOpacity(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (_) => AddVideoDialog(chapterId: chapterId));
              },
              child: const Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: Icon(Icons.video_call_outlined)))
        ],
        body: Column(
          children: [
            VideosListWidget(
              videos: videos,
              onVideoDelete: onVideoDelete,
            ),
            QuestionsListWidget(
              questions: questions,
              onQuestionDelete: onQuestionDelete,
              onQuestionEdit: onQuestionEdit,
            ),
          ],
        ));
  }
}
import 'package:bws_agreement_creator/Model/chapter_question_data.dart';
import 'package:bws_agreement_creator/Model/video_data.dart';
import 'package:bws_agreement_creator/Providers/delete_question_provider.dart';
import 'package:bws_agreement_creator/Providers/delete_video_provider.dart';
import 'package:bws_agreement_creator/Providers/get_chapter_questions_provider.dart';
import 'package:bws_agreement_creator/Providers/get_videos_provider.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/EmployeeForm/form_widget.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/Components/touchable_opacity.dart';
import 'package:bws_agreement_creator/Widgets/ManageTrainings/add_question_dialog_logic.dart';
import 'package:bws_agreement_creator/Widgets/ManageTrainings/add_video_dialog.dart';
import 'package:bws_agreement_creator/Widgets/ManageTrainings/confirmation_dialog.dart';
import 'package:bws_agreement_creator/Widgets/ManageTrainings/edit_question_dialog_logic.dart';
import 'package:bws_agreement_creator/Widgets/ManageTrainings/edit_video_dialog.dart';
import 'package:bws_agreement_creator/Widgets/ManageTrainings/import_questions_dialog_logic.dart';
import 'package:bws_agreement_creator/Widgets/ManageTrainings/questions_list_widget.dart';
import 'package:bws_agreement_creator/Widgets/ManageTrainings/select_filtered_videos_dialog_logic.dart';
import 'package:bws_agreement_creator/Widgets/ManageTrainings/videos_list_widget.dart';
import 'package:bws_agreement_creator/Widgets/app_scaffold.dart';
import 'package:bws_agreement_creator/utils/use_build_effect.dart';
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
    final isEditing = useState(false);
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

    final selectedVideos = useState<List<VideoData>>([]);
    final onSelectedVideoChanged = useCallback((List<VideoData> videos) {
      selectedVideos.value = videos;
    }, []);

    final onFilterTapped = useCallback(() {
      showDialog(
          context: context,
          builder: (_) => SelectFilteredVideosDialogLogic(
              chapterId: chapterId,
              videosList: videos,
              selectedVideos: selectedVideos.value,
              onSelectedVideosChanged: onSelectedVideoChanged));
    }, [videos]);

    final filterQuestionText = useState('');
    final filteredQuestions = useState<List<QuestionData>>([]);

    useBuildEffect(() {
      final filteredQuestionsData = questions.where((element) {
        if (selectedVideos.value.isEmpty && filterQuestionText.value.isEmpty) {
          return true;
        }
        var isOnVideosList = false;
        if (selectedVideos.value.isNotEmpty) {
          isOnVideosList = selectedVideos.value.any((video) {
            return element.videos.contains(video.id);
          });
        } else {
          isOnVideosList = true;
        }

        if (filterQuestionText.value.isNotEmpty) {
          return isOnVideosList &&
              element.questionText
                  .toLowerCase()
                  .contains(filterQuestionText.value.toLowerCase());
        }
        return isOnVideosList;
      }).toList()
        ..sort((a, b) => a.questionText.compareTo(b.questionText));
      filteredQuestions.value = filteredQuestionsData;
      return null;
    }, [questions, selectedVideos.value, filterQuestionText.value]);

    final onFilterTextChanged = useCallback((String text) {
      filterQuestionText.value = text;
    }, []);

    final onOpenVideoEdit = useCallback((VideoData videoData) {
      showDialog(
          context: context,
          builder: (_) => EditVideoDialog(
                chapterId: chapterId,
                videoData: videoData,
              ));
    }, []);

    useBuildEffect(() {
      ref.read(videosProvider.notifier).getVideos();
      ref.read(questionsProvider.notifier).getChapterQuestions();
      return null;
    }, []);
    return AppScaffold(
        title: "Szkolenie $chapterTitle",
        actions: [
          TouchableOpacity(
              onTap: () {
                isEditing.value = !isEditing.value;
              },
              child: const Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: Icon(Icons.swap_vert))),
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
                  child: Icon(Icons.video_call_outlined))),
          TouchableOpacity(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (_) => ImportQuestionsDialogLogic(
                          chapterId: chapterId,
                        ));
              },
              child: const Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: Icon(Icons.publish_outlined)))
        ],
        body: SingleChildScrollView(
          child: Column(
            children: [
              VideosListWidget(
                  chapterId: chapterId,
                  isEditing: isEditing.value,
                  videos: videos,
                  onVideoDelete: onVideoDelete,
                  onVideoOpen: onOpenVideoEdit),
              QuestionsListWidget(
                onFilterTapped: onFilterTapped,
                questions: filteredQuestions.value,
                onQuestionDelete: onQuestionDelete,
                onQuestionEdit: onQuestionEdit,
                onFilterTextChanged: onFilterTextChanged,
              ),
            ],
          ),
        ));
  }
}

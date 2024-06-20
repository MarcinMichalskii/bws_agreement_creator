import 'package:bws_agreement_creator/Model/add_chapter_question_data.dart';
import 'package:bws_agreement_creator/Model/video_data.dart';
import 'package:bws_agreement_creator/Providers/add_multiple_questions_provider.dart';
import 'package:bws_agreement_creator/Providers/get_videos_provider.dart';
import 'package:bws_agreement_creator/Providers/snackbar_handler.dart';
import 'package:bws_agreement_creator/Widgets/ManageTrainings/import_questions_dialog_ui.dart';
import 'package:bws_agreement_creator/utils/import_questions_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ImportQuestionsDialogLogic extends HookConsumerWidget {
  final String chapterId;
  const ImportQuestionsDialogLogic({Key? key, required this.chapterId})
      : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final videoList = ref.watch(getVideosProvider(chapterId)).data ?? [];
    final selectedVideos = useState<List<VideoData>>([]);
    final onSelectedVideosChanged = useCallback((selected) {
      selectedVideos.value = selected;
    }, []);

    final importedQuestions = useState<List<AddChapterQuestionData>>([]);
    final onImportTapped = useCallback(() async {
      try {
        final questions = await ImportQuestionsHelper().pickFile(chapterId);
        importedQuestions.value = questions;
      } catch (e) {
        SnackbarHandler.showSnackBar(e.toString(), color: Colors.red);
      }
    }, []);

    final onSaveTapped = useCallback(() {
      importedQuestions.value = importedQuestions.value
          .toList()
          .map((e) => e.copyWith(
              videos: selectedVideos.value.map((e) => e.id).toList()))
          .toList();
      ref.read(addMultipleQuestionsProvider.notifier).addQuestions(
          questions: importedQuestions.value, chapterId: chapterId);
      Navigator.of(context).pop(importedQuestions.value);
    }, [importedQuestions.value, selectedVideos.value]);

    final isLoading = ref.watch(addMultipleQuestionsProvider).isLoading;

    return ImportQuestionsDialogUI(
        onImportTapped: onImportTapped,
        importedQuestions: importedQuestions.value,
        chapterId: chapterId,
        videosList: videoList,
        selectedVideos: selectedVideos.value,
        onSelectedVideosChanged: onSelectedVideosChanged,
        onSaveTapped: onSaveTapped,
        isLoading: isLoading);
  }
}

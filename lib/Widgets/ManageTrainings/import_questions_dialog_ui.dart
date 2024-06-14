import 'package:bws_agreement_creator/Model/add_chapter_question_data.dart';
import 'package:bws_agreement_creator/Model/video_data.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/components/generate_pdf_button.dart';
import 'package:bws_agreement_creator/Widgets/ManageTrainings/add_question_select_videos_ui.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:bws_agreement_creator/utils/import_questions_helper.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ImportQuestionsDialogUI extends HookConsumerWidget {
  final String chapterId;
  final List<VideoData> videosList;
  final List<VideoData> selectedVideos;
  final ValueSetter<List<VideoData>> onSelectedVideosChanged;
  final List<AddChapterQuestionData> importedQuestions;
  final VoidCallback onImportTapped;
  final bool isLoading;

  final VoidCallback onSaveTapped;

  const ImportQuestionsDialogUI({
    super.key,
    required this.chapterId,
    required this.videosList,
    required this.selectedVideos,
    required this.onSelectedVideosChanged,
    required this.importedQuestions,
    required this.onImportTapped,
    required this.onSaveTapped,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context, ref) {
    return Dialog(
      backgroundColor: CustomColors.almostBlack3,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Import pytań",
                style: TextStyle(color: CustomColors.gray, fontSize: 17)),
            AddQuestionSelectVideosUI(
                videosList: videosList,
                selectedVideos: selectedVideos,
                onSelectedVideosChanged: onSelectedVideosChanged),
            if (importedQuestions.isEmpty)
              DefaultBorderedButton(
                  text: "Wybierz plik CSV",
                  borderColor: CustomColors.applicationColorMain,
                  onTap: onImportTapped),
            if (importedQuestions.isNotEmpty)
              Text(
                "Zaimportowano ${importedQuestions.length} pytań",
                style: const TextStyle(color: CustomColors.gray),
              ),
            if (importedQuestions.isNotEmpty)
              isLoading
                  ? Container(
                      margin: const EdgeInsets.symmetric(vertical: 12),
                      constraints:
                          const BoxConstraints(maxWidth: 32, maxHeight: 32),
                      child: const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                            CustomColors.applicationColorMain),
                      ),
                    )
                  : DefaultBorderedButton(
                      text: "Zapisz",
                      borderColor: CustomColors.applicationColorMain,
                      onTap: () async {
                        onSaveTapped();
                      })
          ],
        ),
      ),
    );
  }
}

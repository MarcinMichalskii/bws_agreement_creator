import 'package:bws_agreement_creator/Model/video_data.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/components/generate_pdf_button.dart';
import 'package:bws_agreement_creator/Widgets/ManageTrainings/add_question_select_videos_ui.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SelectFilteredVideosDialogLogic extends HookConsumerWidget {
  final String chapterId;
  final List<VideoData> videosList;
  final List<VideoData> selectedVideos;
  final ValueSetter<List<VideoData>> onSelectedVideosChanged;

  const SelectFilteredVideosDialogLogic({
    super.key,
    required this.chapterId,
    required this.videosList,
    required this.selectedVideos,
    required this.onSelectedVideosChanged,
  });

  @override
  Widget build(BuildContext context, ref) {
    final selectedVideos2 = useState(selectedVideos);
    return Dialog(
      backgroundColor: CustomColors.almostBlack3,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Pytania do filmów",
                style: TextStyle(color: CustomColors.gray, fontSize: 17)),
            AddQuestionSelectVideosUI(
                videosList: videosList,
                selectedVideos: selectedVideos2.value,
                onSelectedVideosChanged: (videos) {
                  selectedVideos2.value = videos;
                  onSelectedVideosChanged(videos);
                }),
          ],
        ),
      ),
    );
  }
}

import 'package:bws_agreement_creator/Model/video_data.dart';
import 'package:bws_agreement_creator/Providers/get_videos_provider.dart';
import 'package:bws_agreement_creator/Widgets/Trainings/VideosList/video_cell.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChapterDetailsUI extends HookConsumerWidget {
  const ChapterDetailsUI(
      {super.key,
      required this.videos,
      required this.chapterId,
      required this.onVideoOpen,
      required this.onExamineOpen});
  final List<VideoData> videos;
  final String chapterId;
  final ValueSetter<VideoData> onVideoOpen;
  final ValueSetter<VideoData> onExamineOpen;

  @override
  Widget build(BuildContext context, ref) {
    return Container(
        alignment: Alignment.topCenter,
        child: Wrap(
          children: videos.map((video) {
            final isLocked = ref
                .read(getVideosProvider(chapterId).notifier)
                .isVideoLocked(video.id);
            return VideoCell(
              isEnabled: !isLocked,
              video: video,
              onVideoOpen: onVideoOpen,
              onExamineOpen: onExamineOpen,
            );
          }).toList(),
        ));
  }
}

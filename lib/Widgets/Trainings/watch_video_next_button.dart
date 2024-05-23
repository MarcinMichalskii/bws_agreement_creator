import 'package:bws_agreement_creator/Providers/get_chapters_provider.dart';
import 'package:bws_agreement_creator/Providers/get_videos_provider.dart';
import 'package:bws_agreement_creator/Widgets/ManageTrainings/manage_chapters_scaffold.dart';
import 'package:bws_agreement_creator/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WatchVideoNextButton extends HookConsumerWidget {
  final String chapterId;
  final String videoId;
  final bool isLocked;

  const WatchVideoNextButton(
      {Key? key,
      required this.chapterId,
      required this.videoId,
      required this.isLocked})
      : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final chapterName =
        ref.read(getChaptersProvider.notifier).getChapterForId(chapterId)?.name;
    final isLastVideo =
        ref.read(getVideosProvider(chapterId).notifier).isLastVideo(videoId);

    return Opacity(
        opacity: isLocked ? 0.5 : 1,
        child: PillButton(
            title: isLastVideo ? "Egzamin" : "Następny",
            onPress: () {
              if (isLocked) {
                return;
              }
              if (isLastVideo) {
                context.pushScreen('examine', params: {
                  'id1': chapterId,
                }, queryParams: {
                  'name': chapterName
                });
              } else {
                final nextVideo = ref
                    .read(getVideosProvider(chapterId).notifier)
                    .getNextVideo(videoId);
                context.pop();
                context.pushScreen('watchVideo', params: {
                  'id1': chapterId,
                  'id2': nextVideo!.id
                }, queryParams: {
                  'title': nextVideo.name,
                  'url': nextVideo.url,
                });
              }
            }));
  }
}

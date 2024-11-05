import 'package:bws_agreement_creator/Model/video_user_data.dart';
import 'package:bws_agreement_creator/Providers/get_chapters_provider.dart';
import 'package:bws_agreement_creator/Providers/get_video_user_data_provider.dart';
import 'package:bws_agreement_creator/Providers/get_videos_provider.dart';
import 'package:bws_agreement_creator/Widgets/ManageTrainings/manage_chapters_scaffold.dart';
import 'package:bws_agreement_creator/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WatchVideoNextButton extends HookConsumerWidget {
  final String chapterId;
  final String videoId;

  const WatchVideoNextButton({
    super.key,
    required this.chapterId,
    required this.videoId,
  });

  @override
  Widget build(BuildContext context, ref) {
    final videoUserData = ref.watch(getVideoUserDataProvider(videoId)).data;
    final videoWatched = videoUserData?.videoWatched == true;
    final chapterName =
        ref.read(getChaptersProvider.notifier).getChapterForId(chapterId)?.name;
    final isLastVideo =
        ref.read(getVideosProvider(chapterId).notifier).isLastVideo(videoId);

    final videoTitle = ref
        .read(getVideosProvider(chapterId).notifier)
        .getVideoForId(videoId)
        ?.name;

    final openVideoExamine = useCallback(() {
      context.pushScreen('videoExamine', params: {
        'id1': chapterId,
      }, queryParams: {
        'videoTitle': videoTitle,
        'videoId': videoId,
        'openedFromList': 'false'
      });
    }, [chapterId, videoId]);

    final openChapterExamine = useCallback(() {
      context.pushScreen('examine', params: {
        'id1': chapterId,
      }, queryParams: {
        'name': chapterName
      });
    }, [chapterName, chapterId]);

    final openNextVideo = useCallback(() {
      final nextVideo =
          ref.read(getVideosProvider(chapterId).notifier).getNextVideo(videoId);
      context.pop();
      context.pushScreen('watchVideo', params: {
        'id1': chapterId,
        'id2': nextVideo!.id
      }, queryParams: {
        'title': nextVideo.name,
        'url': nextVideo.url,
      });
    }, [chapterId]);

    final navigationState =
        videoUserData!.getNavigationState(isLastVideo: isLastVideo);
    final onNavigationTapped = useCallback(() {
      switch (navigationState) {
        case VideoUserDataNavigationState.locked:
          return;
        case VideoUserDataNavigationState.nextVideo:
          return openNextVideo();
        case VideoUserDataNavigationState.examine:
          return openVideoExamine();
        case VideoUserDataNavigationState.chapterExamine:
          return openChapterExamine();
      }
    }, [navigationState]);

    return Opacity(
        opacity: videoWatched ? 1.0 : 0.5,
        child: PillButton(
            title: videoUserData.videoNextButtonTitle(isLastVideo: isLastVideo),
            onPress: onNavigationTapped));
  }
}

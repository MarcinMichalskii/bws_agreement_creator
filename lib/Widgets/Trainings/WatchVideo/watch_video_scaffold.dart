import 'dart:async';

import 'package:bws_agreement_creator/Providers/get_video_user_data_provider.dart';
import 'package:bws_agreement_creator/Providers/update_video_user_data_provider.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/EmployeeForm/form_widget.dart';
import 'package:bws_agreement_creator/Widgets/Trainings/WatchVideo/video_player_widget.dart';
import 'package:bws_agreement_creator/Widgets/Trainings/WatchVideo/video_progress_status_widget.dart';
import 'package:bws_agreement_creator/Widgets/Trainings/WatchVideo/watch_video_next_button.dart';
import 'package:bws_agreement_creator/Widgets/app_scaffold.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WatchVideoScaffold extends HookConsumerWidget {
  final String videoUrl;
  final String videoTitle;
  final String videoId;
  final String chapterId;

  const WatchVideoScaffold(
      {super.key,
      required this.videoUrl,
      required this.videoTitle,
      required this.videoId,
      required this.chapterId});
  @override
  Widget build(BuildContext context, ref) {
    final videoUserData = ref.watch(getVideoUserDataProvider(videoId)).data;

    final watchedSeconds = useState(0);
    final secondsToWatch = useState(0);
    final secondsLeft = (secondsToWatch.value - watchedSeconds.value) <= 0
        ? 0
        : (secondsToWatch.value - watchedSeconds.value);

    useBuildEffect(() {
      if (videoUserData != null) {
        watchedSeconds.value = videoUserData.secondsWatched;
      }
      return null;
    }, [videoUserData]);

    final isPlaying = useState(false);
    final onPlayingChanged = useCallback((bool playing) {
      isPlaying.value = playing;
    }, []);

    final onDurationChanged = useCallback((int value) {
      secondsToWatch.value = (value * 0.9).toInt();
    }, []);

    final currentTime = useState(0);
    final onTimeUpdate = useCallback((int value) {
      currentTime.value = value;
    }, []);

    void updateUserVideoData() {
      if (!isPlaying.value) {
        return;
      }
      ref
          .read(updateVideoUserDataProvider(videoId).notifier)
          .updateVideoUserData(
              secondsWatched: watchedSeconds.value,
              finishedWatchingAt: currentTime.value,
              chapterId: chapterId);
    }

    useMemoized(() {
      return Timer.periodic(const Duration(seconds: 1), (_) {
        if (isPlaying.value) {
          watchedSeconds.value++;
        }
        final left = secondsToWatch.value - watchedSeconds.value;
        if (left == 0) {
          updateUserVideoData();
        }
      });
    });

    void getVideoUserData() {
      ref.read(getVideoUserDataProvider(videoId).notifier).getVideoUserData();
    }

    useBuildEffect(() {
      getVideoUserData();
      Timer timer = Timer.periodic(const Duration(seconds: 15), (timer) {
        updateUserVideoData();
      });
      return timer.cancel;
    }, [videoId]);

    if (videoUserData == null) {
      return Container(
        alignment: Alignment.topCenter,
        child: Container(
            margin: const EdgeInsets.only(top: 64),
            child: const CircularProgressIndicator(
              color: CustomColors.applicationColorMain,
            )),
      );
    }
    return AppScaffold(
      title: videoTitle,
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: [
            VideoPlayerWidget(
              initialStart: videoUserData.finishedWatchingAt,
              url: videoUrl,
              onPlayingChanged: onPlayingChanged,
              onTimeUpdate: onTimeUpdate,
              onDurationChanged: onDurationChanged,
            ),
            VideoProgressStatusWidget(
              secondsLeft: secondsLeft,
              videoId: videoId,
            ),
            WatchVideoNextButton(
              chapterId: chapterId,
              videoId: videoId,
            )
          ],
        )),
      ),
    );
  }
}

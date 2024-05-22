import 'dart:async';
import 'dart:html';

import 'package:bws_agreement_creator/Providers/get_chapters_provider.dart';
import 'package:bws_agreement_creator/Providers/get_video_user_data_provider.dart';
import 'package:bws_agreement_creator/Providers/get_videos_provider.dart';
import 'package:bws_agreement_creator/Providers/pass_video_provider.dart';
import 'package:bws_agreement_creator/Providers/update_video_user_data_provider.dart';
import 'package:bws_agreement_creator/Widgets/ManageTrainings/manage_chapters_scaffold.dart';
import 'package:bws_agreement_creator/Widgets/app_scaffold.dart';
import 'package:bws_agreement_creator/router.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_player/video_player.dart';

class WatchVideoScaffold extends HookConsumerWidget {
  final String videoUrl;
  final String videoTitle;
  final String videoId;
  final String chapterId;

  String _formatDuration(int seconds) {
    Duration duration = Duration(seconds: seconds);
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  const WatchVideoScaffold(
      {Key? key,
      required this.videoUrl,
      required this.videoTitle,
      required this.videoId,
      required this.chapterId})
      : super(key: key);
  @override
  Widget build(BuildContext context, ref) {
    final vieoWatchedProvider = passVideoProvider(videoId);
    final videoPlayer = useState<VideoPlayerController?>(null);
    final chewieController = useState<ChewieController?>(null);
    final watchedSeconds = useState(0);
    final secondsToWatch = useState(0);
    final requestSent = useState(false);
    final initialized = useState(false);
    print('jajebe');

    final passVideo = useCallback(() {
      ref.read(vieoWatchedProvider.notifier).videoPassed(chapterId: chapterId);
    }, []);

    final secondsLeft = (secondsToWatch.value - watchedSeconds.value) < 0
        ? 0
        : (secondsToWatch.value - watchedSeconds.value);
    // useMemoized(() {
    //   return Timer.periodic(const Duration(seconds: 1), (_) {
    //     if (chewieController.value?.isPlaying == true) {
    //       watchedSeconds.value++;
    //     }
    //     final left = secondsToWatch.value - watchedSeconds.value;
    //     if (left == 0 && !requestSent.value && secondsToWatch.value != 0) {
    //       requestSent.value = true;
    //       passVideo();
    //     }
    //   });
    // });

    void getVideoUserData() {
      ref.read(getVideoUserDataProvider(videoId).notifier).getVideoUserData();
    }

    void initializeChewie() async {
      final controller = VideoPlayerController.networkUrl(Uri.parse(videoUrl));
      await controller.initialize();
      getVideoUserData();

      videoPlayer.value = controller;
      chewieController.value = ChewieController(
          showOptions: false,
          videoPlayerController: controller,
          allowFullScreen: true,
          autoPlay: true,
          fullScreenByDefault: false,
          systemOverlaysOnEnterFullScreen: [],
          showControls: true,
          aspectRatio: controller.value.aspectRatio,
          allowPlaybackSpeedChanging: false);

      secondsToWatch.value =
          (controller.value.duration.inSeconds * 0.85).toInt();
    }

    chewieController.value?.addListener(() {
      if (chewieController.value?.isFullScreen == true) {
        // document.documentElement?.requestFullscreen();
      }
    });

    // document.addEventListener('fullscreenchange', (event) {
    //   if (document.fullscreenElement == null) {
    //     Timer(const Duration(milliseconds: 350), () {
    //       chewieController.value?.exitFullScreen();
    //       Timer(const Duration(milliseconds: 300), () {
    //         chewieController.value?.play();
    //       });
    //     });
    //   }
    // });

    useEffect(
      () {
        initializeChewie();

        return () {
          videoPlayer.value?.pause();
          videoPlayer.value?.dispose();
          chewieController.value?.pause();
          chewieController.value?.dispose();
        };
      },
      [],
    );

    void updateUserVideoData() {
      if (videoPlayer.value?.value.isPlaying == false) {
        return;
      }
      ref
          .read(updateVideoUserDataProvider(videoId).notifier)
          .updateVideoUserData(
              secondsWatched: watchedSeconds.value,
              finishedWatchingAt: videoPlayer.value!.value.position.inSeconds);
    }

    useEffect(() {
      Timer timer = Timer.periodic(Duration(seconds: 15), (timer) {
        updateUserVideoData();
      });
      return timer.cancel;
    }, []);

    ref.listen(getVideoUserDataProvider(videoId), (previous, next) {
      if (next.data != null) {
        watchedSeconds.value = next.data!.secondsWatched;
        videoPlayer.value
            ?.seekTo(Duration(seconds: next.data!.finishedWatchingAt));
      } else {
        watchedSeconds.value = 0;
      }
      initialized.value = true;
    });

    return !initialized.value
        ? const Center(
            child: CircularProgressIndicator(
              color: CustomColors.applicationColorMain,
            ),
          )
        : AppScaffold(
            title: videoTitle,
            body: SingleChildScrollView(
              child: Center(
                  child: Column(
                children: [
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: chewieController.value != null
                        ? Chewie(controller: chewieController.value!)
                        : Container(),
                  ),
                  if (chewieController.value != null)
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Text(
                              style: const TextStyle(
                                  fontSize: 20, color: CustomColors.gray),
                              'Aby zaliczyć ten filmu, musisz obejrzeć jeszcze: ${_formatDuration(secondsLeft)}',
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 8),
                            child: Icon(
                                size: secondsLeft == 0 ? 30 : 20,
                                Icons.check,
                                color: secondsLeft == 0
                                    ? CustomColors.green
                                    : CustomColors.gray),
                          ),
                        ],
                      ),
                    ),
                  WatchVideoNextButton(
                    isLocked: !requestSent.value,
                    chapterId: chapterId,
                    videoId: videoId,
                  )
                ],
              )),
            ),
          );
  }
}

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

    // useCallback(() {}, [isLocked]);

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

import 'dart:async';
import 'dart:html';

import 'package:bws_agreement_creator/Providers/pass_video_provider.dart';
import 'package:bws_agreement_creator/Widgets/app_scaffold.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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

    final passVideo = useCallback(() {
      ref.read(vieoWatchedProvider.notifier).videoPassed(chapterId: chapterId);
    }, []);

    final secondsLeft = (secondsToWatch.value - watchedSeconds.value) < 0
        ? 0
        : (secondsToWatch.value - watchedSeconds.value);
    useMemoized(() {
      return Timer.periodic(Duration(seconds: 1), (_) {
        if (chewieController.value?.isPlaying == true) {
          watchedSeconds.value++;
        }
        final left = secondsToWatch.value - watchedSeconds.value;
        if (left == 0 && !requestSent.value && secondsToWatch.value != 0) {
          requestSent.value = true;
          passVideo();
        }
      });
    });

    void initializeChewie() async {
      final controller = VideoPlayerController.networkUrl(Uri.parse(videoUrl));
      await controller.initialize();
      videoPlayer.value = controller;
      chewieController.value = ChewieController(
          showOptions: false,
          videoPlayerController: controller,
          allowFullScreen: true,
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
        document.documentElement?.requestFullscreen();
      }
    });

    document.addEventListener('fullscreenchange', (event) {
      if (document.fullscreenElement == null) {
        Timer(const Duration(milliseconds: 150), () {
          chewieController.value?.exitFullScreen();
          Timer(const Duration(milliseconds: 300), () {
            chewieController.value?.play();
          });
        });
      }
    });

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

    return AppScaffold(
      title: videoTitle,
      body: Center(
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
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    style:
                        const TextStyle(fontSize: 20, color: CustomColors.gray),
                    'Aby zaliczyć ten filmu, musisz obejrzeć jeszcze: ${_formatDuration(secondsLeft)}',
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
        ],
      )),
    );
  }
}

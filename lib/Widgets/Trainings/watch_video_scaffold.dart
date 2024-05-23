import 'dart:async';
import 'dart:html' as html;
import 'dart:ui_web' as ui_web;

import 'package:bws_agreement_creator/Providers/get_video_user_data_provider.dart';
import 'package:bws_agreement_creator/Providers/pass_video_provider.dart';
import 'package:bws_agreement_creator/Providers/update_video_user_data_provider.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/EmployeeForm/form_widget.dart';
import 'package:bws_agreement_creator/Widgets/Trainings/watch_video_next_button.dart';
import 'package:bws_agreement_creator/Widgets/app_scaffold.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:bws_agreement_creator/utils/int_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WatchVideoScaffold extends HookConsumerWidget {
  final String videoUrl;
  final String videoTitle;
  final String videoId;
  final String chapterId;

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
    final watchedSeconds = useState(0);
    final secondsToWatch = useState(0);
    final requestSent = useState(false);
    final videoPassed = useState(false);

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

    final passVideo = useCallback(() {
      ref.read(vieoWatchedProvider.notifier).videoPassed(chapterId: chapterId);
    }, []);

    final secondsLeft = (secondsToWatch.value - watchedSeconds.value) < 0
        ? 0
        : (secondsToWatch.value - watchedSeconds.value);
    useMemoized(() {
      return Timer.periodic(const Duration(seconds: 1), (_) {
        if (isPlaying.value) {
          watchedSeconds.value++;
        }
        final left = secondsToWatch.value - watchedSeconds.value;
        if (left == 0 && !requestSent.value && secondsToWatch.value != 0) {
          requestSent.value = true;
          passVideo();
        }
      });
    });

    void getVideoUserData() {
      ref.read(getVideoUserDataProvider(videoId).notifier).getVideoUserData();
    }

    void updateUserVideoData() {
      if (!isPlaying.value) {
        return;
      }
      ref
          .read(updateVideoUserDataProvider(videoId).notifier)
          .updateVideoUserData(
              secondsWatched: watchedSeconds.value,
              finishedWatchingAt: currentTime.value);
    }

    useBuildEffect(() {
      getVideoUserData();
      Timer timer = Timer.periodic(const Duration(seconds: 15), (timer) {
        updateUserVideoData();
      });
      return timer.cancel;
    }, []);
    final goToTime = useState<int?>(null);

    ref.listen(getVideoUserDataProvider(videoId), (previous, next) {
      if (next.data != null) {
        watchedSeconds.value = next.data!.secondsWatched;
        goToTime.value = next.data!.finishedWatchingAt;
        ref.read(getVideoUserDataProvider(videoId).notifier).reset();
        if (watchedSeconds.value >= secondsToWatch.value) {
          videoPassed.value = true;
        }
      } else if (next.error != null) {
        goToTime.value = 0;
      }
    });

    return goToTime.value == null
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : AppScaffold(
            title: videoTitle,
            body: SingleChildScrollView(
              child: Center(
                  child: Column(
                children: [
                  AspectRatio(
                      aspectRatio: 16 / 9,
                      child: goToTime.value == null
                          ? Container()
                          : VideoPlayer(
                              initialStart: goToTime.value!,
                              url: videoUrl,
                              onPlayingChanged: onPlayingChanged,
                              onTimeUpdate: onTimeUpdate,
                              onDurationChanged: onDurationChanged,
                            )),
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
                            'Aby zaliczyć ten filmu, musisz obejrzeć jeszcze: ${secondsLeft.formattedAsDuration()}',
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
                    isLocked: !requestSent.value && !videoPassed.value,
                    chapterId: chapterId,
                    videoId: videoId,
                  )
                ],
              )),
            ),
          );
  }
}

class VideoPlayer extends HookConsumerWidget {
  final String url;
  final ValueSetter<bool> onPlayingChanged;
  final ValueSetter<int> onTimeUpdate;
  final ValueSetter<int> onDurationChanged;
  final int initialStart;

  const VideoPlayer(
      {Key? key,
      required this.url,
      required this.onPlayingChanged,
      required this.onTimeUpdate,
      required this.onDurationChanged,
      required this.initialStart})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final id = useState(UniqueKey().toString());
    void goToMoment(html.VideoElement videoElement, double moment) async {
      // await Future.delayed(const Duration(milliseconds: 1000));
      videoElement.currentTime = moment;
    }

    useEffect(() {
      final videoElement = html.VideoElement()
        ..src = url
        ..controls = true
        ..style.width = '100%';

      videoElement.onPlaying.listen((event) {
        onPlayingChanged(true);
      });

      videoElement.onPause.listen((event) {
        onPlayingChanged(false);
      });

      videoElement.onTimeUpdate.listen((event) {
        onTimeUpdate(videoElement.currentTime.toInt());
      });

      videoElement.onLoadedMetadata.listen((event) {
        goToMoment(videoElement, initialStart.toDouble());
      });
      videoElement.onDurationChange.listen((event) {
        onDurationChanged(videoElement.duration.toInt());
      });

      videoElement.onEnded.listen((event) {
        onPlayingChanged(false);
      });

      ui_web.platformViewRegistry.registerViewFactory(
        'video${id.value}', // Use a unique identifier
        (int viewId) => videoElement,
      );

      // goToMoment(videoElement, initialStart.toDouble());

      return null;
    }, []);

    return HtmlElementView(viewType: 'video${id.value}');
  }
}

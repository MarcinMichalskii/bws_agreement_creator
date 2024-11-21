import 'dart:html' as html;
import 'dart:ui_web' as ui_web;

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class VideoPlayerWidget extends HookConsumerWidget {
  final String url;
  final ValueSetter<bool> onPlayingChanged;
  final ValueSetter<int> onTimeUpdate;
  final ValueSetter<int> onDurationChanged;
  final int initialStart;

  const VideoPlayerWidget(
      {super.key,
      required this.url,
      required this.onPlayingChanged,
      required this.onTimeUpdate,
      required this.onDurationChanged,
      required this.initialStart});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final id = useState(UniqueKey().toString());
    void goToMoment(html.VideoElement videoElement, double moment) async {
      videoElement.currentTime = moment;
    }

    useEffect(() {
      const iner = '<source type="video/webm">';

      final videoElement = html.VideoElement()
        ..src = url
        ..controls = true
        ..style.width = '100%';
      videoElement.setInnerHtml(iner);

      videoElement.onPlaying.listen((event) {
        onPlayingChanged(true);
      });

      videoElement.onPause.listen((event) {
        onPlayingChanged(false);
      });

      videoElement.onTimeUpdate.listen((event) {
        onTimeUpdate(videoElement.currentTime.toInt());
      });

      videoElement.onDurationChange.listen((event) {
        onDurationChanged(videoElement.duration.toInt());
      });

      videoElement.onEnded.listen((event) {
        onPlayingChanged(false);
      });

      videoElement.onLoadedData.listen((event) {
        goToMoment(videoElement, initialStart.toDouble());
      });

      ui_web.platformViewRegistry.registerViewFactory(
        'video${id.value}',
        (int viewId) => videoElement,
      );

      return null;
    }, []);

    return AspectRatio(
        aspectRatio: 16 / 9,
        child: HtmlElementView(viewType: 'video${id.value}'));
  }
}

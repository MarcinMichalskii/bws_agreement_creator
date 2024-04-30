import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_player/video_player.dart';

class WatchVideoScaffold extends HookConsumerWidget {
  final String videoUrl;
  const WatchVideoScaffold({Key? key, required this.videoUrl})
      : super(key: key);
  @override
  Widget build(BuildContext context, ref) {
    final videoPlayer = useState<VideoPlayerController>(
      VideoPlayerController.networkUrl(Uri.parse(videoUrl)),
    );

    void _toggleFullScreen() {
      if (videoPlayer.value.value.isPlaying) {
        videoPlayer.value.pause();
      }
      SystemChrome.setEnabledSystemUIOverlays([]);
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
      ]);
    }

    useEffect(
      () {
        videoPlayer.value.initialize();

        return () {
          videoPlayer.value.pause();
          videoPlayer.value.dispose();
        };
      },
      [],
    );

    return Scaffold(
      body: Center(
          child: AspectRatio(
        aspectRatio: videoPlayer.value.value.aspectRatio,
        child: VideoPlayer(videoPlayer.value),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          videoPlayer.value.value.isPlaying
              ? videoPlayer.value.pause()
              : videoPlayer.value.play();
        },
        child: Icon(
          videoPlayer.value.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}

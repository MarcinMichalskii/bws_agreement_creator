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

    return AspectRatio(
        aspectRatio: 16 / 9,
        child: HtmlElementView(viewType: 'video${id.value}'));
  }
}

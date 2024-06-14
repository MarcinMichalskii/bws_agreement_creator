import 'package:bws_agreement_creator/Model/video_data.dart';
import 'package:bws_agreement_creator/Providers/get_videos_provider.dart';
import 'package:bws_agreement_creator/Providers/snackbar_handler.dart';
import 'package:bws_agreement_creator/Widgets/Components/default_list_element.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class VideosListWidget extends HookConsumerWidget {
  final List<VideoData> videos;
  final String chapterId;
  final ValueSetter<String>? onVideoDelete;
  final ValueSetter<VideoData>? onVideoOpen;
  final bool hasSubtitle;
  final bool isEditing;
  final bool lockUnpassed;
  const VideosListWidget({
    super.key,
    required this.chapterId,
    required this.isEditing,
    required this.videos,
    this.lockUnpassed = false,
    this.onVideoDelete,
    this.hasSubtitle = true,
    this.onVideoOpen,
  });

  @override
  Widget build(BuildContext context, ref) {
    return isEditing
        ? ReordableVideos(
            hasSubtitle: hasSubtitle,
            videos: videos,
            chapterId: chapterId,
          )
        : StandardVideos(
            chapterId: chapterId,
            lockUnpassed: lockUnpassed,
            hasSubtitle: hasSubtitle,
            videos: videos,
            onVideoDelete: onVideoDelete,
            onVideoOpen: onVideoOpen);
  }
}

class StandardVideos extends HookConsumerWidget {
  final String chapterId;
  final bool hasSubtitle;
  final List<VideoData> videos;
  final ValueSetter<String>? onVideoDelete;
  final ValueSetter<VideoData>? onVideoOpen;
  final bool lockUnpassed;

  const StandardVideos(
      {super.key,
      required this.chapterId,
      required this.lockUnpassed,
      required this.hasSubtitle,
      required this.videos,
      this.onVideoDelete,
      required this.onVideoOpen});

  @override
  Widget build(BuildContext context, ref) {
    final videoProvider = getVideosProvider(chapterId);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          if (hasSubtitle)
            Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              child: const Text("Filmy dla szkolenia",
                  style: TextStyle(fontSize: 18, color: CustomColors.gray)),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: videos.map((video) {
                      return DefaultListElement(
                          locked: lockUnpassed &&
                              ref
                                  .read(videoProvider.notifier)
                                  .isVideoLocked(video.id),
                          onElementTapped: () {
                            final isLocked = ref
                                .read(videoProvider.notifier)
                                .isVideoLocked(video.id);
                            if (isLocked && lockUnpassed) {
                              SnackbarHandler.showSnackBar(
                                  "Aby odblokować ten film, musisz najpierw obejrzeć poprzednie filmy.",
                                  color: Colors.red);
                              return;
                            }
                            onVideoOpen?.call(video);
                          },
                          onElementDelete: onVideoDelete != null
                              ? () {
                                  onVideoDelete!(video.id);
                                }
                              : null,
                          passed: video.watched,
                          title: video.name);
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ReordableVideos extends HookConsumerWidget {
  final bool hasSubtitle;
  final List<VideoData> videos;

  final String chapterId;
  const ReordableVideos(
      {super.key,
      required this.hasSubtitle,
      required this.videos,
      required this.chapterId});

  @override
  Widget build(BuildContext context, ref) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          if (hasSubtitle)
            Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              child: const Text("Filmy dla szkolenia",
                  style: TextStyle(fontSize: 18, color: CustomColors.gray)),
            ),
          ReorderableListView(
            shrinkWrap: true,
            buildDefaultDragHandles: false,
            onReorder: (int oldIndex, int newIndex) {
              ref
                  .read(getVideosProvider(chapterId).notifier)
                  .reorderVideos(oldIndex, newIndex);
            },
            children: videos.map((video) {
              return ReorderableDragStartListener(
                key: ValueKey(video.id),
                index: videos.indexOf(video),
                child: DefaultListElement(
                    isReordering: true,
                    title: video.name,
                    passed: video.watched,
                    onElementTapped: () {},
                    onElementDelete: null),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

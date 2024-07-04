import 'dart:js_interop';

import 'package:bws_agreement_creator/Model/video_data.dart';
import 'package:bws_agreement_creator/Widgets/Trainings/VideosList/video_badges_widget.dart';
import 'package:bws_agreement_creator/Widgets/Trainings/VideosList/video_duration_label_widget.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:bws_agreement_creator/utils/int_extension.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class VideoCell extends HookConsumerWidget {
  final VideoData video;
  final bool isEnabled;
  final ValueSetter<VideoData> onVideoOpen;
  final ValueSetter<VideoData> onExamineOpen;

  VideoCell(
      {Key? key,
      required this.video,
      required this.isEnabled,
      required this.onVideoOpen,
      required this.onExamineOpen});

  @override
  Widget build(BuildContext context, ref) {
    final duration = video.duration
        .toInt()
        .formattedAsDuration()
        .toString()
        .split('.')
        .first;

    return GestureDetector(
      onTap: () {
        if (!isEnabled) {
          return;
        }
        onVideoOpen(video);
      },
      child: Opacity(
        opacity: isEnabled ? 1 : 0.5,
        child: Container(
          width: 320, // Adjust this value as needed
          margin: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.network(
                      video.thumbnailUrl,
                      width: double.infinity,
                      height: 180,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: CustomColors.almostBlack,
                          height: 180,
                          child: const Center(
                            child: Icon(
                              Icons.play_circle_outline,
                              color: CustomColors.gray,
                              size: 64,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    right: 8,
                    child: VideoDurationLabelWidget(duration: duration),
                  ),
                  Positioned(
                    bottom: 8,
                    left: 8,
                    child: VideoBadgesWidget(
                      video: video,
                      onExamineOpen: onExamineOpen,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                video.name,
                style: const TextStyle(
                  color: CustomColors.gray,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

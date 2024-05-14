import 'package:bws_agreement_creator/Model/video_data.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/components/touchable_opacity.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class VideosListWidget extends HookConsumerWidget {
  final List<VideoData> videos;
  final ValueSetter<String>? onVideoDelete;
  final ValueSetter<VideoData>? onVideoOpen;
  final bool hasSubtitle;
  const VideosListWidget({
    super.key,
    required this.videos,
    this.onVideoDelete,
    this.hasSubtitle = true,
    this.onVideoOpen,
  });

  @override
  Widget build(BuildContext context, ref) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          if (hasSubtitle)
            Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              child: const Text("Filmy do rozdziału",
                  style: TextStyle(fontSize: 18, color: CustomColors.gray)),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: videos.map((video) {
                      return TouchableOpacity(
                        onTap: () {
                          onVideoOpen?.call(video);
                        },
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(4),
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  color: CustomColors.almostBlack2,
                                  child: Row(
                                    children: [
                                      Icon(Icons.video_camera_back_outlined,
                                          color: video.passed
                                              ? CustomColors.green
                                              : CustomColors.darkGray),
                                      Expanded(
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(left: 8),
                                          child: Text(video.name,
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  color: CustomColors.gray)),
                                        ),
                                      ),
                                      const Spacer(),
                                      if (onVideoDelete != null)
                                        TouchableOpacity(
                                            onTap: () {
                                              onVideoDelete!(video.id);
                                            },
                                            child: const Icon(Icons.delete,
                                                color: CustomColors.darkGray)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
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

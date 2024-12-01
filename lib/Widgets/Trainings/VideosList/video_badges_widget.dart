import 'package:bws_agreement_creator/Model/video_data.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/test/touchable_opacity.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class VideoBadgesWidget extends HookConsumerWidget {
  final VideoData video;
  final ValueSetter<VideoData> onExamineOpen;

  const VideoBadgesWidget(
      {super.key, required this.video, required this.onExamineOpen});

  @override
  Widget build(BuildContext context, ref) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4), color: Colors.black54),
      child: Row(
        children: [
          Icon(
            Icons.domain_verification_outlined,
            color: video.watched ? CustomColors.green : CustomColors.gray,
            size: 32,
          ),
          const SizedBox(width: 4),
          if (video.hasExamine && video.watched)
            TouchableOpacity(
              onTap: () {
                onExamineOpen(video);
              },
              child: Icon(
                Icons.playlist_add_check_outlined,
                color: video.examinePassed
                    ? CustomColors.green
                    : CustomColors.applicationColorMain,
                size: 32,
              ),
            ),
          if (video.hasExamine && !video.watched)
            const Icon(Icons.playlist_add_check_outlined,
                color: CustomColors.gray, size: 32),
        ],
      ),
    );
  }
}

import 'package:bws_agreement_creator/Providers/get_video_user_data_provider.dart';
import 'package:bws_agreement_creator/Providers/update_video_user_data_provider.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:bws_agreement_creator/utils/int_extension.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class VideoProgressStatusWidget extends HookConsumerWidget {
  const VideoProgressStatusWidget({
    super.key,
    required this.videoId,
    required this.secondsLeft,
  });

  final String videoId;
  final int secondsLeft;

  @override
  Widget build(BuildContext context, ref) {
    final videoUpdate = ref.watch(updateVideoUserDataProvider(videoId)).data;
    final getVideoUserData = ref.watch(getVideoUserDataProvider(videoId)).data;
    final videoWatched =
        getVideoUserData?.videoWatched == true || videoUpdate?.passed == true;

    final title = videoWatched
        ? 'Film zaliczony'
        : 'Aby zaliczyć ten filmu, musisz obejrzeć jeszcze: ${secondsLeft.formattedAsDuration()}';

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Text(
              title,
              style: const TextStyle(fontSize: 20, color: CustomColors.gray),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 8),
            child: Icon(
                size: videoWatched ? 30 : 20,
                Icons.check,
                color: videoWatched ? CustomColors.green : CustomColors.gray),
          ),
        ],
      ),
    );
  }
}

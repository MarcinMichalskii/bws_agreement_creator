import 'package:bws_agreement_creator/Providers/api_controller.dart';
import 'package:bws_agreement_creator/Providers/reset_password_provider.dart';
import 'package:bws_agreement_creator/Providers/snackbar_handler.dart';
import 'package:bws_agreement_creator/Widgets/ManageTrainings/add_video_dialog.dart';
import 'package:bws_agreement_creator/utils/base_url.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final updateVideoProvider =
    StateNotifierProvider<EditVideoNotifier, APIResponseState<String?>>((ref) {
  return EditVideoNotifier(ref);
});

class EditVideoNotifier extends StateNotifier<APIResponseState<String?>> {
  StateNotifierProviderRef<EditVideoNotifier, APIResponseState<String?>> ref;
  EditVideoNotifier(this.ref) : super(APIResponseState());

  void updateVideo(String videoTitle, String videoUrl, String chapterId,
      String videoId) async {
    state = APIResponseState(isLoading: true);
    final duration = await VideoDurationFetcher(videoUrl).fetchVideoDuration();
    state = await ApiController(NoDataResponseParser.parse).performPut(params: {
      "videoName": videoTitle,
      'videoUrl': videoUrl,
      'duration': duration,
      'chapterId': chapterId,
      'videoId': videoId
    }, url: "$baseUrl/updateVideo");

    if (state.error != null) {
      SnackbarHandler.showSnackBar(state.error!.message, color: Colors.red);
    }
  }
}

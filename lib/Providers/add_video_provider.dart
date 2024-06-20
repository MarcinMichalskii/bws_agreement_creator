import 'package:bws_agreement_creator/Providers/api_controller.dart';
import 'package:bws_agreement_creator/Providers/reset_password_provider.dart';
import 'package:bws_agreement_creator/Providers/snackbar_handler.dart';
import 'package:bws_agreement_creator/utils/base_url.dart';
import 'package:bws_agreement_creator/utils/video_duration_fetcher.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final addVideoProvider =
    StateNotifierProvider<AddVideoNotifier, APIResponseState<String?>>((ref) {
  return AddVideoNotifier(ref);
});

class AddVideoNotifier extends StateNotifier<APIResponseState<String?>> {
  StateNotifierProviderRef<AddVideoNotifier, APIResponseState<String?>> ref;
  AddVideoNotifier(this.ref) : super(APIResponseState());

  void addVideo(String videoTitle, String videoUrl, bool isOutro,
      String chapterId) async {
    state = APIResponseState(isLoading: true);
    final duration = await VideoDurationFetcher(videoUrl).fetchVideoDuration();
    state =
        await ApiController(NoDataResponseParser.parse).performPost(params: {
      "videoName": videoTitle,
      'videoUrl': videoUrl,
      'duration': duration,
      'chapterId': chapterId,
      'isOutro': isOutro
    }, url: "$baseUrl/addVideo");

    if (state.error != null) {
      SnackbarHandler.showSnackBar(state.error!.message, color: Colors.red);
    }
  }
}

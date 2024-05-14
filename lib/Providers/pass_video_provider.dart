import 'package:bws_agreement_creator/Providers/api_controller.dart';
import 'package:bws_agreement_creator/Providers/get_videos_provider.dart';
import 'package:bws_agreement_creator/Providers/reset_password_provider.dart';
import 'package:bws_agreement_creator/Providers/snackbar_handler.dart';
import 'package:bws_agreement_creator/utils/base_url.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final passVideoProvider = StateNotifierProvider.family<PassVideoNotifier,
    APIResponseState<String?>, String>((ref, chapterId) {
  return PassVideoNotifier(ref, chapterId);
});

class PassVideoNotifier extends StateNotifier<APIResponseState<String?>> {
  final String videoId;
  StateNotifierProviderRef<PassVideoNotifier, APIResponseState<String?>> ref;
  PassVideoNotifier(this.ref, this.videoId) : super(APIResponseState());

  void videoPassed({required String chapterId}) async {
    state = APIResponseState(isLoading: true);

    state = await ApiController(Dupa.elo).performPost(params: {
      "videoId": videoId,
    }, url: "$baseUrl/videoWatched");

    ref.read(getVideosProvider(chapterId).notifier).getVideos();

    if (state.error != null) {
      SnackbarHandler.showSnackBar(state.error!.message, color: Colors.red);
    }
  }
}

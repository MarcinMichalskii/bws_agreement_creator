import 'package:bws_agreement_creator/Providers/api_controller.dart';
import 'package:bws_agreement_creator/Providers/reset_password_provider.dart';
import 'package:bws_agreement_creator/Providers/snackbar_handler.dart';
import 'package:bws_agreement_creator/utils/base_url.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final updateVideosOrderProvider = StateNotifierProvider.family<
    UpdateVideosOrderNotifier,
    APIResponseState<String?>,
    String>((ref, chapterId) {
  return UpdateVideosOrderNotifier(ref, chapterId);
});

class UpdateVideosOrderNotifier
    extends StateNotifier<APIResponseState<String?>> {
  StateNotifierProviderRef<UpdateVideosOrderNotifier, APIResponseState<String?>>
      ref;
  final String chapterId;
  UpdateVideosOrderNotifier(this.ref, this.chapterId)
      : super(APIResponseState());

  void updateVideosOrder(
      {required List<String> chaptersOrderList,
      required String chapterId}) async {
    state = APIResponseState(isLoading: true);

    state = await ApiController(NoDataResponseParser.parse).performPut(
        params: {'chapterId': chapterId, 'videosOrder': chaptersOrderList},
        url: "$baseUrl/updateVideosOrder");

    if (state.error != null) {
      SnackbarHandler.showSnackBar(state.error!.message, color: Colors.red);
    }
  }
}

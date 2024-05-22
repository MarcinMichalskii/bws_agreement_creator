import 'package:bws_agreement_creator/Providers/api_controller.dart';
import 'package:bws_agreement_creator/Providers/reset_password_provider.dart';
import 'package:bws_agreement_creator/Providers/snackbar_handler.dart';
import 'package:bws_agreement_creator/utils/base_url.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final updateChaptersOrderProvider = StateNotifierProvider<
    UpdateChaptersOrderNotifier, APIResponseState<String?>>((ref) {
  return UpdateChaptersOrderNotifier(ref);
});

class UpdateChaptersOrderNotifier
    extends StateNotifier<APIResponseState<String?>> {
  StateNotifierProviderRef<UpdateChaptersOrderNotifier,
      APIResponseState<String?>> ref;
  UpdateChaptersOrderNotifier(this.ref) : super(APIResponseState());

  void updateChaptersOrder({required List<String> chaptersOrderList}) async {
    state = APIResponseState(isLoading: true);

    state = await ApiController(NoDataResponseParser.parse).performPut(
        params: {'chaptersOrder': chaptersOrderList},
        url: "$baseUrl/updateChaptersOrder");

    if (state.error != null) {
      SnackbarHandler.showSnackBar(state.error!.message, color: Colors.red);
    }
  }
}

import 'package:bws_agreement_creator/Providers/api_controller.dart';
import 'package:bws_agreement_creator/Providers/reset_password_provider.dart';
import 'package:bws_agreement_creator/Providers/snackbar_handler.dart';
import 'package:bws_agreement_creator/utils/base_url.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final deleteVideoProvider =
    StateNotifierProvider<DeleteVideoNotifier, APIResponseState<String?>>(
        (ref) {
  return DeleteVideoNotifier(ref);
});

class DeleteVideoNotifier extends StateNotifier<APIResponseState<String?>> {
  StateNotifierProviderRef<DeleteVideoNotifier, APIResponseState<String?>> ref;
  DeleteVideoNotifier(this.ref) : super(APIResponseState());

  void deleteVideo({required String videoId, required String chapterId}) async {
    state = APIResponseState(isLoading: true);

    state = await ApiController(Dupa.elo).performDelete(
        params: {"videoId": videoId, "chapterId": chapterId},
        url: "$baseUrl/deleteVideo");

    if (state.error != null) {
      SnackbarHandler.showSnackBar(state.error!.message, color: Colors.red);
    }
  }
}

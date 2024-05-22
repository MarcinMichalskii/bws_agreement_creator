import 'package:bws_agreement_creator/Providers/api_controller.dart';
import 'package:bws_agreement_creator/Providers/reset_password_provider.dart';
import 'package:bws_agreement_creator/Providers/snackbar_handler.dart';
import 'package:bws_agreement_creator/utils/base_url.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final addChapterProvider =
    StateNotifierProvider<AddChapterNotifier, APIResponseState<String?>>((ref) {
  return AddChapterNotifier(ref);
});

class AddChapterNotifier extends StateNotifier<APIResponseState<String?>> {
  StateNotifierProviderRef<AddChapterNotifier, APIResponseState<String?>> ref;
  AddChapterNotifier(this.ref) : super(APIResponseState());

  void addChapter(String chapterTitle) async {
    state = APIResponseState(isLoading: true);

    state =
        await ApiController(NoDataResponseParser.parse).performPost(params: {
      "name": chapterTitle,
    }, url: "$baseUrl/addChapter");

    if (state.error != null) {
      SnackbarHandler.showSnackBar(state.error!.message, color: Colors.red);
    }
  }
}

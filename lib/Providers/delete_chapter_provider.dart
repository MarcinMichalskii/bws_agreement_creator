import 'package:bws_agreement_creator/Providers/api_controller.dart';
import 'package:bws_agreement_creator/Providers/reset_password_provider.dart';
import 'package:bws_agreement_creator/Providers/snackbar_handler.dart';
import 'package:bws_agreement_creator/utils/base_url.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final deleteChapterProvider =
    StateNotifierProvider<DeleteChapterNotifier, APIResponseState<String?>>(
        (ref) {
  return DeleteChapterNotifier(ref);
});

class DeleteChapterNotifier extends StateNotifier<APIResponseState<String?>> {
  StateNotifierProviderRef<DeleteChapterNotifier, APIResponseState<String?>>
      ref;
  DeleteChapterNotifier(this.ref) : super(APIResponseState());

  void deleteChapter(String chapterId) async {
    state = APIResponseState(isLoading: true);

    state =
        await ApiController(NoDataResponseParser.parse).performDelete(params: {
      "chapterId": chapterId,
    }, url: "$baseUrl/deleteChapter");

    if (state.error != null) {
      SnackbarHandler.showSnackBar(state.error!.message, color: Colors.red);
    }
  }
}

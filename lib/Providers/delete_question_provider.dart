import 'package:bws_agreement_creator/Providers/api_controller.dart';
import 'package:bws_agreement_creator/Providers/reset_password_provider.dart';
import 'package:bws_agreement_creator/Providers/snackbar_handler.dart';
import 'package:bws_agreement_creator/utils/base_url.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final deleteQuestionProvider =
    StateNotifierProvider<DeleteQuestionNotifier, APIResponseState<String?>>(
        (ref) {
  return DeleteQuestionNotifier(ref);
});

class DeleteQuestionNotifier extends StateNotifier<APIResponseState<String?>> {
  StateNotifierProviderRef<DeleteQuestionNotifier, APIResponseState<String?>>
      ref;
  DeleteQuestionNotifier(this.ref) : super(APIResponseState());

  void deleteQuestion(
      {required String questionId, required String chapterId}) async {
    state = APIResponseState(isLoading: true);

    state = await ApiController(NoDataResponseParser.parse).performDelete(
        params: {"questionId": questionId, "chapterId": chapterId},
        url: "$baseUrl/deleteQuestionForChapter");

    if (state.error != null) {
      SnackbarHandler.showSnackBar(state.error!.message, color: Colors.red);
    }
  }
}

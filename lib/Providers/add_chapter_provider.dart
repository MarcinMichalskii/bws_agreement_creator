import 'package:bws_agreement_creator/Providers/api_controller.dart';
import 'package:bws_agreement_creator/Providers/reset_password_provider.dart';
import 'package:bws_agreement_creator/Providers/snackbar_message_provider.dart';
import 'package:bws_agreement_creator/utils/base_url.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final addChapterProvider =
    StateNotifierProvider<ResetPasswordNotifier, APIResponseState<String?>>(
        (ref) {
  return ResetPasswordNotifier(ref);
});

class ResetPasswordNotifier extends StateNotifier<APIResponseState<String?>> {
  StateNotifierProviderRef<ResetPasswordNotifier, APIResponseState<String?>>
      ref;
  ResetPasswordNotifier(this.ref) : super(APIResponseState());

  void addChapter(String chapterTitle) async {
    state = APIResponseState(isLoading: true);

    state = await ApiController(Dupa.elo).performPost(params: {
      "name": chapterTitle,
    }, url: "$baseUrl/addChapter");

    if (state.error != null) {
      ref
          .read(snackbarProvider.notifier)
          .showSnackBar(state.error!.message, color: Colors.red);
    }
  }
}

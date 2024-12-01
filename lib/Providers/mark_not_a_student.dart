import 'package:bws_agreement_creator/Providers/api_controller.dart';
import 'package:bws_agreement_creator/Providers/reset_password_provider.dart';
import 'package:bws_agreement_creator/Providers/snackbar_handler.dart';
import 'package:bws_agreement_creator/utils/base_url.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final markNotAStudentProvider =
    StateNotifierProvider<MarkNotAStudentNotifier, APIResponseState<String?>>(
        (ref) {
  return MarkNotAStudentNotifier(ref);
});

class MarkNotAStudentNotifier extends StateNotifier<APIResponseState<String?>> {
  StateNotifierProviderRef<MarkNotAStudentNotifier, APIResponseState<String?>>
      ref;
  MarkNotAStudentNotifier(this.ref) : super(APIResponseState());

  void markNotAStudent() async {
    state = APIResponseState(isLoading: true);

    state = await ApiController(NoDataResponseParser.parse)
        .performPut(params: {}, url: "$baseUrl/updateNotAStudent");

    if (state.error != null) {
      SnackbarHandler.showSnackBar(state.error!.message, color: Colors.red);
    }
  }
}

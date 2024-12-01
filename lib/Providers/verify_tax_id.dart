import 'package:bws_agreement_creator/Model/company_data.dart';
import 'package:bws_agreement_creator/Providers/api_controller.dart';
import 'package:bws_agreement_creator/Providers/snackbar_handler.dart';
import 'package:bws_agreement_creator/utils/base_url.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final verifyTaxIdProvider = StateNotifierProvider.autoDispose<
    VerifytaxIdNotifier, APIResponseState<CompanyData?>>((ref) {
  return VerifytaxIdNotifier(ref);
});

class VerifytaxIdNotifier
    extends StateNotifier<APIResponseState<CompanyData?>> {
  StateNotifierProviderRef<VerifytaxIdNotifier, APIResponseState<CompanyData?>>
      ref;
  VerifytaxIdNotifier(this.ref) : super(APIResponseState());

  void verify({required String taxId}) async {
    state = APIResponseState(isLoading: true);

    state = await ApiController(CompanyData.fromJson)
        .performPost(params: {"taxId": taxId}, url: "$baseUrl/verifyTaxNumber");

    if (state.error != null) {
      SnackbarHandler.showSnackBar(state.error!.message, color: Colors.red);
    }
  }
}

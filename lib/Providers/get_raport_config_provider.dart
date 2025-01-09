import 'package:bws_agreement_creator/Model/raport_location_data.dart';
import 'package:bws_agreement_creator/Providers/api_controller.dart';
import 'package:bws_agreement_creator/Providers/profile_data_provider.dart';
import 'package:bws_agreement_creator/Providers/snackbar_handler.dart';
import 'package:bws_agreement_creator/utils/base_url.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final getRaportConfigProvider = StateNotifierProvider<GetRaportConfigNotifier,
    APIResponseState<List<RaportLocationData>>>((ref) {
  return GetRaportConfigNotifier(ref);
});

class GetRaportConfigNotifier
    extends StateNotifier<APIResponseState<List<RaportLocationData>>> {
  Ref<APIResponseState<List<RaportLocationData>>> ref;
  GetRaportConfigNotifier(this.ref) : super(APIResponseState()) {
    ref.listen(profileProvider, (previous, next) {
      if (next.data != null && next.data!.isRaportCreator) {
        getConfig();
      }
    });
  }
  void getConfig() async {
    state = APIResponseState(isLoading: true, data: state.data);
    final response = await ApiController(RaportLocationData.listFromJson)
        .performGet(url: "$baseUrl/getRaportConfig");

    if (response.error != null) {
      SnackbarHandler.showSnackBar(state.error!.message, color: Colors.red);
    }

    state = response;
  }
}

import 'package:bws_agreement_creator/Model/user_data.dart';
import 'package:bws_agreement_creator/Providers/api_controller.dart';
import 'package:bws_agreement_creator/Providers/snackbar_handler.dart';
import 'package:bws_agreement_creator/utils/base_url.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final getUsersProvider =
    StateNotifierProvider<GetUsersNotifier, APIResponseState<List<UserData>>>(
        (ref) {
  return GetUsersNotifier(ref);
});

class GetUsersNotifier extends StateNotifier<APIResponseState<List<UserData>>> {
  StateNotifierProviderRef<GetUsersNotifier, APIResponseState<List<UserData>>>
      ref;
  GetUsersNotifier(this.ref) : super(APIResponseState());
  void getUsers() async {
    state = APIResponseState(isLoading: true, data: state.data);

    final response = await ApiController(UserData.listFromJson)
        .performGet(url: "$baseUrl/getUsers");

    if (response.error != null) {
      SnackbarHandler.showSnackBar(state.error!.message, color: Colors.red);
    }

    state = response;
  }
}

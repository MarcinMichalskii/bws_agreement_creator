import 'package:bws_agreement_creator/FormUI/Providers/api_controller.dart';
import 'package:bws_agreement_creator/FormUI/Providers/new_form_data_provider.dart';
import 'package:bws_agreement_creator/Model/login_data.dart';
import 'package:bws_agreement_creator/utils/base_url.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final loginProvider =
    StateNotifierProvider<LoginNotifier, ParsedResponseState<LoginData>>((ref) {
  return LoginNotifier(ref);
});

class LoginNotifier extends StateNotifier<ParsedResponseState<LoginData>> {
  StateNotifierProviderRef<LoginNotifier, ParsedResponseState<LoginData>> ref;
  LoginNotifier(this.ref) : super(ParsedResponseState());

  void login(String login, String password) async {
    state = ParsedResponseState(isLoading: true);
    final response = await ApiController().fetchData(params: {
      "login": login,
      "password": password,
    }, url: "$baseUrl/login");

    if (response.error != null) {
      state = ParsedResponseState(error: response.error);
      return;
    }

    try {
      final loginData = LoginData.fromJson(response.data);
      if (loginData.validationError != null) {
        state = ParsedResponseState(
            error: CostRegisterError(loginData.validationError!));
        return;
      }
      state = ParsedResponseState.fromAPIResponseState(response, loginData);
      ref.read(newFormDataProvider.notifier).setLoginData(loginData);
    } catch (error) {
      state = ParsedResponseState(
          error: CostRegisterError("Nie udało się zalogować"));
    }
  }
}

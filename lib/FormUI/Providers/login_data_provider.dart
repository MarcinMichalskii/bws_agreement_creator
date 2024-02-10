import 'package:bws_agreement_creator/FormUI/Providers/api_controller.dart';
import 'package:bws_agreement_creator/Model/login_data.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final loginProvider =
    StateNotifierProvider<LoginNotifier, ParsedResponseState<LoginData>>((ref) {
  return LoginNotifier();
});

class LoginNotifier extends StateNotifier<ParsedResponseState<LoginData>> {
  LoginNotifier() : super(ParsedResponseState());

  void login(String login, String password) async {
    state = ParsedResponseState(isLoading: true);
    final response = await ApiController().fetchData(params: {
      "login": login,
      "password": password,
    }, url: "http://localhost:3000/login");
    try {
      final loginData = LoginData.fromJson(response.data);
      if (loginData.validationError != null) {
        state = ParsedResponseState(
            error: CostRegisterError(loginData.validationError!));
        return;
      }
      state = ParsedResponseState.fromAPIResponseState(response, loginData);
    } catch (error) {
      state = ParsedResponseState(
          error: CostRegisterError("Nie udało się zalogować"));
    }
  }
}

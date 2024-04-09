import 'package:bws_agreement_creator/Model/authorization_data.dart';
import 'package:bws_agreement_creator/Providers/api_controller.dart';
import 'package:bws_agreement_creator/utils/base_url.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authProvider =
    StateNotifierProvider<AuthNotifier, ParsedResponseState<AuthorizationData>>(
        (ref) {
  return AuthNotifier(ref);
});

class AuthNotifier
    extends StateNotifier<ParsedResponseState<AuthorizationData>> {
  StateNotifierProviderRef<AuthNotifier, ParsedResponseState<AuthorizationData>>
      ref;
  AuthNotifier(this.ref) : super(ParsedResponseState());

  void login(String login, String password) async {
    state = ParsedResponseState(isLoading: true);
    final response = await ApiController().performPost(params: {
      "login": login,
      "password": password,
    }, url: "$baseUrl/login");

    if (response.error != null) {
      state = ParsedResponseState(error: response.error);
      return;
    }

    try {
      final cookie = AuthorizationData.fromJson(response.data);

      state = ParsedResponseState(data: cookie);
    } catch (error) {
      state = ParsedResponseState(
          error: CostRegisterError("Nie udało się zalogować"));
    }
  }

  void loginWithGoogleToken(String idToken) async {
    state = ParsedResponseState(isLoading: true);
    final response = await ApiController().performPost(
        params: {"idToken": idToken}, url: "$baseUrl/loginWithGoogle");

    if (response.error != null) {
      state = ParsedResponseState(error: response.error);
      return;
    }

    try {
      final cookie = AuthorizationData.fromJson(response.data);

      state = ParsedResponseState(data: cookie);
    } catch (error) {
      state = ParsedResponseState(
          error: CostRegisterError("Nie udało się zalogować"));
    }
  }
}

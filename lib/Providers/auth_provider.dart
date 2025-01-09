import 'package:bws_agreement_creator/Model/authorization_data.dart';
import 'package:bws_agreement_creator/Providers/api_controller.dart';
import 'package:bws_agreement_creator/utils/base_url.dart';
import 'package:bws_agreement_creator/utils/user_data_helper.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authProvider =
    StateNotifierProvider<AuthNotifier, APIResponseState<AuthorizationData>>(
        (ref) {
  return AuthNotifier(ref);
});

class AuthNotifier extends StateNotifier<APIResponseState<AuthorizationData>> {
  Ref<APIResponseState<AuthorizationData>> ref;
  AuthNotifier(this.ref) : super(APIResponseState());

  void login(String login, String password) async {
    final helper = UserDataHelper();
    state = APIResponseState(isLoading: true);
    final response =
        await ApiController(AuthorizationData.fromJson).performPost(params: {
      "login": login,
      "password": password,
    }, url: "$baseUrl/login");
    if (response.data != null) {
      await helper.storeTokens(response.data!);
    }
    state = response;
  }

  void loginWithGoogleToken(String idToken) async {
    final helper = UserDataHelper();
    state = APIResponseState(isLoading: true);
    final response = await ApiController(AuthorizationData.fromJson)
        .performPost(
            params: {"idToken": idToken}, url: "$baseUrl/loginWithGoogle");

    if (response.data != null) {
      await helper.storeTokens(response.data!);
    }
    state = response;
  }
}

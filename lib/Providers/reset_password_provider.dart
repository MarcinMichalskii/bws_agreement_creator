import 'package:bws_agreement_creator/Providers/api_controller.dart';
import 'package:bws_agreement_creator/utils/base_url.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final resetPasswordProvider =
    StateNotifierProvider<ResetPasswordNotifier, ParsedResponseState<String?>>(
        (ref) {
  return ResetPasswordNotifier(ref);
});

class ResetPasswordNotifier
    extends StateNotifier<ParsedResponseState<String?>> {
  StateNotifierProviderRef<ResetPasswordNotifier, ParsedResponseState<String?>>
      ref;
  ResetPasswordNotifier(this.ref) : super(ParsedResponseState());

  void resetPassword(String email) async {
    state = ParsedResponseState(isLoading: true);

    final response = await ApiController().performPost(params: {
      "email": email,
    }, url: "$baseUrl/resetPassword");
    state = ParsedResponseState(data: "Hasło zresetowane, sprawdź email");
    if (response.error != null) {
      state = ParsedResponseState(
          error: CostRegisterError(
              "Nie udało się zresetować hasła, sprawdź wprowadzony email"),
          params: response.params,
          isLoading: false);
    } else {
      state = ParsedResponseState(data: "Hasło zresetowane, sprawdź email");
    }
  }
}

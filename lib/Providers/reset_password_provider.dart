import 'package:bws_agreement_creator/Providers/api_controller.dart';
import 'package:bws_agreement_creator/utils/base_url.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final resetPasswordProvider =
    StateNotifierProvider<ResetPasswordNotifier, APIResponseState<String?>>(
        (ref) {
  return ResetPasswordNotifier(ref);
});

class ResetPasswordNotifier extends StateNotifier<APIResponseState<String?>> {
  StateNotifierProviderRef<ResetPasswordNotifier, APIResponseState<String?>>
      ref;
  ResetPasswordNotifier(this.ref) : super(APIResponseState());

  void resetPassword(String email) async {
    state = APIResponseState(isLoading: true);

    await ApiController(NoDataResponseParser.parse).performPost(params: {
      "email": email,
    }, url: "$baseUrl/resetPassword");
    state = APIResponseState(data: "Hasło zresetowane, sprawdź email");
  }
}

class NoDataResponseParser {
  static String? parse(Map<String, dynamic> elo) {
    return "empty";
  }
}

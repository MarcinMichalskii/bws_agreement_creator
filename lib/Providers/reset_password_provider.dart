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

    await ApiController(Dupa.elo).performPost(params: {
      "email": email,
    }, url: "$baseUrl/resetPassword");
    state = APIResponseState(data: "Hasło zresetowane, sprawdź email");
  }
}

class Dupa {
  static String? elo(Map<String, dynamic> elo) {
    return "jebacpis";
  }
}

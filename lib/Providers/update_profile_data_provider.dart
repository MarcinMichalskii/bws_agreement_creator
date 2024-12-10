import 'package:bws_agreement_creator/Providers/api_controller.dart';
import 'package:bws_agreement_creator/Providers/reset_password_provider.dart';
import 'package:bws_agreement_creator/utils/base_url.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:bws_agreement_creator/utils/string_extensions.dart';

final updateProfileDataProvider =
    StateNotifierProvider<UpdateProfileDataNotifier, APIResponseState<String?>>(
        (ref) {
  return UpdateProfileDataNotifier(ref);
});

class UpdateProfileDataNotifier
    extends StateNotifier<APIResponseState<String?>> {
  StateNotifierProviderRef<UpdateProfileDataNotifier, APIResponseState<String?>>
      ref;
  UpdateProfileDataNotifier(this.ref) : super(APIResponseState());

  void updateProfile(String? idNumber, String? passportNumber, String? pesel,
      String? street) async {
    state = APIResponseState(isLoading: true);

    state =
        await ApiController(NoDataResponseParser.parse).performPatch(params: {
      "idNumber": idNumber?.emptyAsNull(),
      "passportNumber": passportNumber?.emptyAsNull(),
      "pesel": pesel?.emptyAsNull(),
      "street": street?.emptyAsNull(),
    }, url: "$baseUrl/updateSinchProfileData");
  }
}

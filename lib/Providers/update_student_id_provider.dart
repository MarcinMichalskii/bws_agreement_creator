import 'package:bws_agreement_creator/Providers/api_controller.dart';
import 'package:bws_agreement_creator/Providers/auth_provider.dart';
import 'package:bws_agreement_creator/Providers/profile_data_provider.dart';
import 'package:bws_agreement_creator/Providers/reset_password_provider.dart';
import 'package:bws_agreement_creator/utils/base_url.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final updateStudentIdProvider =
    StateNotifierProvider<UpdateStudentIdNotifier, APIResponseState<String?>>(
        (ref) {
  return UpdateStudentIdNotifier(ref);
});

class UpdateStudentIdNotifier extends StateNotifier<APIResponseState<String?>> {
  StateNotifierProviderRef<UpdateStudentIdNotifier, APIResponseState<String?>>
      ref;
  UpdateStudentIdNotifier(this.ref) : super(APIResponseState());

  void updateStudentId(String studentId) async {
    state = APIResponseState(isLoading: true);
    final accessToken = ref.read(authProvider.notifier).state.data?.accessToken;

    final response =
        await ApiController(NoDataResponseParser.parse).performPost(params: {
      "studentId": studentId,
    }, url: "$baseUrl/updateStudentId");

    if (response.error == null) {
      ref.read(profileProvider.notifier).getProfile();
    }
  }
}

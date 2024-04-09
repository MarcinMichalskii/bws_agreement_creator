import 'package:bws_agreement_creator/Providers/api_controller.dart';
import 'package:bws_agreement_creator/Providers/auth_provider.dart';
import 'package:bws_agreement_creator/Providers/profile_data_provider.dart';
import 'package:bws_agreement_creator/utils/base_url.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final updateStudentIdProvider = StateNotifierProvider<UpdateStudentIdNotifier,
    ParsedResponseState<String?>>((ref) {
  return UpdateStudentIdNotifier(ref);
});

class UpdateStudentIdNotifier
    extends StateNotifier<ParsedResponseState<String?>> {
  StateNotifierProviderRef<UpdateStudentIdNotifier,
      ParsedResponseState<String?>> ref;
  UpdateStudentIdNotifier(this.ref) : super(ParsedResponseState());

  void updateStudentId(String studentId) async {
    state = ParsedResponseState(isLoading: true);
    final accessToken = ref.read(authProvider.notifier).state.data?.accessToken;

    final response = await ApiController().performPost(params: {
      "studentId": studentId,
    }, url: "$baseUrl/updateStudentId", accessToken: accessToken);
    if (response.error != null) {
      state = ParsedResponseState(
          error: CostRegisterError("Coś poszło nie tak"),
          params: response.params,
          isLoading: false);
    } else {
      ParsedResponseState(isLoading: false);
      ref.read(profileProvider.notifier).getProfile();
    }
  }
}

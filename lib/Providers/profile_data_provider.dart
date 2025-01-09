import 'package:bws_agreement_creator/Model/profile_data.dart';
import 'package:bws_agreement_creator/Providers/api_controller.dart';
import 'package:bws_agreement_creator/Providers/auth_provider.dart';
import 'package:bws_agreement_creator/Providers/get_raport_config_provider.dart';
import 'package:bws_agreement_creator/Providers/mark_not_a_student.dart';
import 'package:bws_agreement_creator/Providers/agreement_generator_data_provider.dart';
import 'package:bws_agreement_creator/Providers/selected_page_provider.dart';
import 'package:bws_agreement_creator/utils/app_state_provider.dart';
import 'package:bws_agreement_creator/utils/base_url.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final profileProvider =
    StateNotifierProvider<ProfileNotifier, APIResponseState<ProfileData>>(
        (ref) {
  return ProfileNotifier(ref);
});

final appInitializerProvider = StateProvider<bool>((ref) {
  return false;
});

class ProfileNotifier extends StateNotifier<APIResponseState<ProfileData>> {
  Ref<APIResponseState<ProfileData>> ref;
  ProfileNotifier(this.ref) : super(APIResponseState()) {
    ref.listen(authProvider, (previous, next) {
      if (next.data?.accessToken != null) {
        getProfile();
      }
    });

    ref.listen(markNotAStudentProvider, (previous, next) {
      if (next.data != null) {
        getProfile();
      }
    });
    return;
  }

  void getProfile() async {
    state = APIResponseState(isLoading: true);
    final response = await ApiController(ProfileData.fromJson).performGet(
      url: "$baseUrl/getProfileData",
    );

    if (response.error != null) {
      state = APIResponseState(error: response.error);
      return;
    }

    final loginData = response.data!;

    if (loginData.validationError != null) {
      state = APIResponseState(
          error: CostRegisterError(loginData.validationError!));
      return;
    }
    state = response;

    ref.read(agreementGeneratorDataProvider.notifier).setLoginData(loginData);
    ref.read(appStateProvider.notifier).setIsLoggedIn(true);
    ref.read(appInitializerProvider.notifier).state = false;

    var page = state.data?.pageBasedOnData();
    if (page != null) {
      ref.read(selectedPageProvider.notifier).state = page;
    }
  }

  void setDefaultState() {
    state = APIResponseState();
  }
}

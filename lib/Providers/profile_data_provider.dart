import 'package:bws_agreement_creator/Providers/api_controller.dart';
import 'package:bws_agreement_creator/Providers/auth_provider.dart';
import 'package:bws_agreement_creator/Providers/new_form_data_provider.dart';
import 'package:bws_agreement_creator/Model/login_data.dart';
import 'package:bws_agreement_creator/utils/app_state_provider.dart';
import 'package:bws_agreement_creator/utils/base_url.dart';
import 'package:bws_agreement_creator/utils/date_extensions.dart';
import 'package:bws_agreement_creator/utils/string_extensions.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final notAStudentTapped = StateProvider((ref) {
  return false;
});

final profileProvider =
    StateNotifierProvider<ProfileNotifier, APIResponseState<ProfileData>>(
        (ref) {
  return ProfileNotifier(ref);
});

class ProfileNotifier extends StateNotifier<APIResponseState<ProfileData>> {
  StateNotifierProviderRef<ProfileNotifier, APIResponseState<ProfileData>> ref;
  ProfileNotifier(this.ref) : super(APIResponseState()) {
    ref.listen(authProvider, (previous, next) {
      if (next.data?.accessToken != null) {
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

    ref.read(newFormDataProvider.notifier).setLoginData(loginData);
    ref.read(appStateProvider.notifier).setIsLoggedIn(true);
    final studentIdUpdate = shouldUpdateStudentIdNumber(loginData);
    ref
        .read(appStateProvider.notifier)
        .setShouldUpdateStudentIdNumber(studentIdUpdate);
  }

  bool shouldUpdateStudentIdNumber(ProfileData profileData) {
    if (ref.read(notAStudentTapped.notifier).state) {
      return false;
    }
    final hasPhotoWithoutNumber = profileData.hasStudentIdPhoto &&
        profileData.studentId?.emptyAsNull() == null;
    final isPotentialStudent =
        (profileData.birthDateParsed?.isBelow26() == true) &&
            profileData.studentId?.emptyAsNull() == null;

    final invalidStudentId =
        RegExp(r'[^0-9\/\s]').hasMatch(profileData.studentId ?? '');
    return hasPhotoWithoutNumber || isPotentialStudent || invalidStudentId;
  }

  void setDefaultState() {
    state = APIResponseState();
  }
}

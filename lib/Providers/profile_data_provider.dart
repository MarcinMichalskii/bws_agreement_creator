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
    StateNotifierProvider<ProfileNotifier, ParsedResponseState<ProfileData>>(
        (ref) {
  return ProfileNotifier(ref);
});

class ProfileNotifier extends StateNotifier<ParsedResponseState<ProfileData>> {
  StateNotifierProviderRef<ProfileNotifier, ParsedResponseState<ProfileData>>
      ref;
  ProfileNotifier(this.ref) : super(ParsedResponseState()) {
    ref.listen(authProvider, (previous, next) {
      if (next.data?.cookie != null) {
        getProfile();
      }
    });
    return;
  }

  void getProfile() async {
    state = ParsedResponseState(isLoading: true);
    final response = await ApiController().performGet(
        url: "$baseUrl/getProfileData",
        cookie: ref.read(authProvider.notifier).state.data?.cookie ?? '');

    if (response.error != null) {
      state = ParsedResponseState(error: response.error);
      return;
    }

    try {
      final loginData = ProfileData.fromJson(response.data);
      if (loginData.validationError != null) {
        state = ParsedResponseState(
            error: CostRegisterError(loginData.validationError!));
        return;
      }
      state = ParsedResponseState.fromAPIResponseState(response, loginData);
      ref.read(newFormDataProvider.notifier).setLoginData(loginData);
      ref.read(appStateProvider.notifier).setIsLoggedIn(true);
      final studentIdUpdate = shouldUpdateStudentIdNumber(loginData);
      ref
          .read(appStateProvider.notifier)
          .setShouldUpdateStudentIdNumber(studentIdUpdate);
    } catch (error) {
      state = ParsedResponseState(
          isLoading: false,
          error: CostRegisterError("Wystąpił problem z pobraniem profilu"));
    }
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
}

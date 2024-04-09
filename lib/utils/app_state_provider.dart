import 'package:bws_agreement_creator/Providers/auth_provider.dart';
import 'package:bws_agreement_creator/main.dart';
import 'package:bws_agreement_creator/utils/app_state.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final appStateProvider = StateNotifierProvider<AppStateNotifier, AppState>(
    (ref) => AppStateNotifier(ref.read));

class AppStateNotifier extends StateNotifier<AppState> {
  Reader read;
  AppStateNotifier(this.read) : super(AppState()) {
    googleSignIn.onCurrentUserChanged.listen((event) async {
      print("JAJEBe");
      final dupa = await event?.authentication;
      print("------------------------------------");
      print(dupa?.idToken);
      print("jebać pis");
      read(authProvider.notifier).loginWithGoogleToken(dupa?.idToken ?? "");
    });
  }

  void setIsLoggedIn(bool value) {
    state = state.copyWith(isLoggedIn: value);
  }

  void setShouldUpdateStudentIdNumber(bool value) {
    state = state.copyWith(shouldUpdateStudentIdNumber: value);
  }

  void setSentAgreement(bool value) {
    state = state.copyWith(sentAgreement: value);
  }
}

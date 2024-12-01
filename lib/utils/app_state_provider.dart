import 'package:bws_agreement_creator/Providers/auth_provider.dart';
import 'package:bws_agreement_creator/google_sign_in.dart';
import 'package:bws_agreement_creator/utils/app_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final appStateProvider = StateNotifierProvider<AppStateNotifier, AppState>(
    (ref) => AppStateNotifier(ref));

class AppStateNotifier extends StateNotifier<AppState> {
  final Ref ref;
  AppStateNotifier(this.ref) : super(AppState()) {
    googleSignIn.onCurrentUserChanged.listen((event) async {
      final googleSignIn = await event?.authentication;
      ref
          .read(authProvider.notifier)
          .loginWithGoogleToken(googleSignIn?.idToken ?? "");
    });
  }

  void setIsLoggedIn(bool value) {
    state = state.copyWith(isLoggedIn: value);
  }

  void setSentAgreement(bool value) {
    state = state.copyWith(sentAgreement: value);
  }

  void setDefaultState() {
    state = AppState();
  }

  void shouldRedirectToTrainingsAfterLogin() {
    state = state.copyWith(shouldRedirectToTrainingsAfterLogin: true);
  }
}

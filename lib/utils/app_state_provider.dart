import 'package:bws_agreement_creator/utils/app_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final appStateProvider = StateNotifierProvider<AppStateNotifier, AppState>(
    (ref) => AppStateNotifier(ref.read));

class AppStateNotifier extends StateNotifier<AppState> {
  Reader read;
  AppStateNotifier(this.read) : super(AppState());

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

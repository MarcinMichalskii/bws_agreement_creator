import 'package:copy_with_extension/copy_with_extension.dart';
part 'app_state.g.dart';

@CopyWith()
class AppState {
  final bool isLoggedIn;
  final bool sentAgreement;
  final bool shouldRedirectToTrainingsAfterLogin;

  AppState({
    this.isLoggedIn = false,
    this.sentAgreement = false,
    this.shouldRedirectToTrainingsAfterLogin = false,
  });
}

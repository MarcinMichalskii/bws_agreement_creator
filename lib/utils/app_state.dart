import 'package:copy_with_extension/copy_with_extension.dart';
part 'app_state.g.dart';

@CopyWith()
class AppState {
  final bool isLoggedIn;
  final bool shouldUpdateStudentIdNumber;
  final bool sentAgreement;

  AppState({
    this.isLoggedIn = false,
    this.shouldUpdateStudentIdNumber = false,
    this.sentAgreement = false,
  });
}

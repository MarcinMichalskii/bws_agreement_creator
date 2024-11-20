import 'package:bws_agreement_creator/app_config_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in_platform_interface/google_sign_in_platform_interface.dart';
import 'package:google_sign_in_web/google_sign_in_web.dart';

import 'firebase_options_development.dart' as dev;
import 'firebase_options_production.dart' as prod;

class GoogleServicesHelper {
  final GoogleSignInPlugin _plugin =
      GoogleSignInPlatform.instance as GoogleSignInPlugin;

  Future<void> initialize() async {
    final clientId = isProd
        ? '${prod.DefaultFirebaseOptions.currentPlatform.messagingSenderId}.apps.googleusercontent.com'
        : '${dev.DefaultFirebaseOptions.currentPlatform.messagingSenderId}.apps.googleusercontent.com';
    await Firebase.initializeApp(
      name: isProd ? 'production' : 'development',
      options: isProd
          ? prod.DefaultFirebaseOptions.currentPlatform
          : dev.DefaultFirebaseOptions.currentPlatform,
    );

    await _plugin.initWithParams(SignInInitParameters(scopes: [
      'email',
    ], signInOption: SignInOption.standard, clientId: clientId));
  }
}

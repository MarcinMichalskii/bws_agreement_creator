import 'package:bws_agreement_creator/app_config_helper.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options_development.dart' as dev;
import 'firebase_options_production.dart' as prod;

class GoogleServicesHelper {
  Future<void> initialize() async {
    await Firebase.initializeApp(
      name: isProd ? 'production' : 'development',
      options: isProd
          ? prod.DefaultFirebaseOptions.currentPlatform
          : dev.DefaultFirebaseOptions.currentPlatform,
    );
  }
}

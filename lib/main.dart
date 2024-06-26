import 'package:bws_agreement_creator/router.dart';
import 'package:bws_agreement_creator/utils/Fonts.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_sign_in_platform_interface/google_sign_in_platform_interface.dart';
import 'package:google_sign_in_web/google_sign_in_web.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'firebase_options.dart';

GoogleSignIn googleSignIn = GoogleSignIn(
  clientId:
      '715847619144-cc8fj2fml7pj820n3p89qg5blcqutkgv.apps.googleusercontent.com',
);

Future<void> main() async {
  final GoogleSignInPlugin _plugin =
      GoogleSignInPlatform.instance as GoogleSignInPlugin;
  WidgetsFlutterBinding.ensureInitialized();
  await defaultFonts.loadFonts();
  await EasyLocalization.ensureInitialized();
  await initializeDateFormatting();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await _plugin.initWithParams(const SignInInitParameters(
    scopes: [
      'email',
    ],
    signInOption: SignInOption.standard,
    clientId:
        '715847619144-cc8fj2fml7pj820n3p89qg5blcqutkgv.apps.googleusercontent.com',
  ));
  runApp(EasyLocalization(
      supportedLocales: const [Locale('pl')],
      path: 'assets/translations',
      fallbackLocale: const Locale('pl'),
      child: const ProviderScope(child: MyApp())));
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(routerConfig: router);
  }
}

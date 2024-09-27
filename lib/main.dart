import 'package:bws_agreement_creator/Providers/api_controller.dart';
import 'package:bws_agreement_creator/Providers/profile_data_provider.dart';
import 'package:bws_agreement_creator/Providers/token_refresh_interceptor.dart';
import 'package:bws_agreement_creator/router.dart';
import 'package:bws_agreement_creator/utils/Fonts.dart';
import 'package:bws_agreement_creator/utils/user_data_helper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:google_sign_in_platform_interface/google_sign_in_platform_interface.dart';
// import 'package:google_sign_in_web/google_sign_in_web.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'firebase_options.dart';

// GoogleSignIn googleSignIn = GoogleSignIn(
//   clientId:
//       '715847619144-cc8fj2fml7pj820n3p89qg5blcqutkgv.apps.googleusercontent.com',
// );
GoogleSignIn googleSignIn = GoogleSignIn(
  clientId:
      '214270827161-8ne85ca8cu35faf3e0cv9mc7h5802f8d.apps.googleusercontent.com',
);

Future<void> main() async {
  if (kIsWeb) {
    GoRouter.optionURLReflectsImperativeAPIs = true;
  }

  // final GoogleSignInPlugin _plugin =
  // GoogleSignInPlatform.instance as GoogleSignInPlugin;
  WidgetsFlutterBinding.ensureInitialized();
  final access = await UserDataHelper().getAccessToken();

  final container = ProviderContainer();
  dio.interceptors.add(TokenInterceptor(container.read));
  if (access != null) {
    container.read(profileProvider.notifier).getProfile();
  }
  await defaultFonts.loadFonts();
  await EasyLocalization.ensureInitialized();
  await initializeDateFormatting();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await _plugin.initWithParams(const SignInInitParameters(
  //   scopes: [
  //     'email',
  //   ],
  //   signInOption: SignInOption.standard,
  //   clientId:
  //       '715847619144-cc8fj2fml7pj820n3p89qg5blcqutkgv.apps.googleusercontent.com',
  // ));
  runApp(EasyLocalization(
      supportedLocales: const [Locale('pl')],
      path: 'assets/translations',
      fallbackLocale: const Locale('pl'),
      child: UncontrolledProviderScope(
          container: container, child: const MyApp())));
}

final GlobalKey<ScaffoldMessengerState> scaffoldKey = GlobalKey();

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      routerConfig: router,
      scaffoldMessengerKey: scaffoldKey,
    );
  }
}

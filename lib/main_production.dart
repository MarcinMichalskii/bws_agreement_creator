import 'package:bws_agreement_creator/Providers/api_controller.dart';
import 'package:bws_agreement_creator/Providers/profile_data_provider.dart';
import 'package:bws_agreement_creator/Providers/token_refresh_interceptor.dart';
import 'package:bws_agreement_creator/app_config_helper.dart';
import 'package:bws_agreement_creator/app_widget.dart';
import 'package:bws_agreement_creator/google_services_helper_web.dart'
    if (dart.library.io) 'package:bws_agreement_creator/google_services_helper_mobile.dart';
import 'package:bws_agreement_creator/utils/Fonts.dart';
import 'package:bws_agreement_creator/utils/user_data_helper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  isProd = true;
  if (kIsWeb) {
    GoRouter.optionURLReflectsImperativeAPIs = true;
  }

  WidgetsFlutterBinding.ensureInitialized();
  final access = await UserDataHelper().getAccessToken();

  final container = ProviderContainer();
  dio.interceptors.add(TokenInterceptor(container));
  if (access != null) {
    container.read(profileProvider.notifier).getProfile();
  }
  await defaultFonts.loadFonts();
  await pdfImages.loadImages();
  await initializeDateFormatting();

  await GoogleServicesHelper().initialize();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales: const [Locale('pl')],
      path: 'assets/translations',
      fallbackLocale: const Locale('pl'),
      child: UncontrolledProviderScope(
          container: container, child: const MyApp())));
}

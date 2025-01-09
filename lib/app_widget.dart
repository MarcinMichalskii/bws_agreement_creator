import 'package:bws_agreement_creator/Providers/get_raport_config_provider.dart';
import 'package:bws_agreement_creator/router.dart';
import 'package:bws_agreement_creator/scaffold_key.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    ref.read(getRaportConfigProvider);
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      routerConfig: router,
      scaffoldMessengerKey: scaffoldKey,
      localizationsDelegates: [
        ...context.localizationDelegates,
      ],
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}

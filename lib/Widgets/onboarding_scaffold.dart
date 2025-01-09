import 'package:bws_agreement_creator/Widgets/GenerateAgreement/Components/bws_logo.dart';
import 'package:bws_agreement_creator/Widgets/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OnboardingScaffold extends HookConsumerWidget {
  const OnboardingScaffold({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppScaffold(
      body: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 64),
          constraints: const BoxConstraints(maxHeight: 100),
          child: BwsLogo()),
    );
  }
}

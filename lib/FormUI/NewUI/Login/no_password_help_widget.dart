import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:bws_agreement_creator/utils/consts.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class NoPasswordHelpWidget extends HookConsumerWidget {
  const NoPasswordHelpWidget({super.key});
  @override
  Widget build(BuildContext context, ref) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 32),
        constraints: const BoxConstraints(maxWidth: Consts.defaultMaxWidth),
        child: Column(children: [
          const Text(
              'Jeśli nie masz hasła, zresetuj je i ustaw przy użyciu swojego adresu e-mail.',
              style: TextStyle(color: CustomColors.gray, fontSize: 20)),
          TextButton(
              onPressed: () {
                launchUrl(
                  Uri.parse('https://bws.onsinch.com'),
                );
              },
              child: const Text('RESET HASŁA',
                  style: TextStyle(color: CustomColors.gray, fontSize: 20)))
        ]),
      ),
    );
  }
}

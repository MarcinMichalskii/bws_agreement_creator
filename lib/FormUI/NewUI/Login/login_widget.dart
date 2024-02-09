import 'package:bws_agreement_creator/FormUI/components/bordered_input.dart';
import 'package:bws_agreement_creator/FormUI/components/bws_logo.dart';
import 'package:bws_agreement_creator/FormUI/components/generate_pdf_button.dart';
import 'package:bws_agreement_creator/utils/consts.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginWidget extends HookConsumerWidget {
  final VoidCallback onLoginTapped;
  const LoginWidget({super.key, required this.onLoginTapped});
  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: Consts.defaultMaxWidth),
          child: Column(children: [
            Container(
                margin: const EdgeInsets.only(top: 64),
                constraints: const BoxConstraints(maxHeight: 100),
                child: BwsLogo()),
            const BorderedInput(placeholder: 'Sinch Email'),
            const BorderedInput(
              placeholder: 'Password',
              isSecure: true,
            ),
            // login button
            DefaultBorderedButton(onTap: onLoginTapped, text: 'Login')
          ]),
        ),
      ),
    );
  }
}

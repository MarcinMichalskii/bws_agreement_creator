import 'package:bws_agreement_creator/FormUI/components/bws_logo.dart';
import 'package:bws_agreement_creator/FormUI/components/generate_pdf_button.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:bws_agreement_creator/utils/consts.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class AgreementSentWidget extends HookConsumerWidget {
  const AgreementSentWidget({super.key});
  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: Consts.defaultMaxWidth),
            child: Column(children: [
              Container(
                  margin: const EdgeInsets.fromLTRB(0, 64, 0, 24),
                  constraints: const BoxConstraints(maxHeight: 100),
                  child: BwsLogo()),
              const Text(
                  'Umowa została podpisana i wysłana do Twojego profilu w sinchu',
                  style: TextStyle(color: CustomColors.gray, fontSize: 20)),

              // go to sinch button
              DefaultBorderedButton(
                onTap: () {
                  launchUrl(
                    Uri.parse('https://bws.onsinch.com'),
                    webOnlyWindowName: '_self',
                  );
                },
                text: 'Powrót do sincha',
              )
            ]),
          ),
        ),
      ),
    );
  }
}

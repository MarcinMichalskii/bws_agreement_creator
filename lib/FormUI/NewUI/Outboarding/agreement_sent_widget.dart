import 'package:bws_agreement_creator/FormUI/components/bws_logo.dart';
import 'package:bws_agreement_creator/FormUI/outbording_information_sign.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:bws_agreement_creator/utils/consts.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
                  textAlign: TextAlign.center,
                  'Umowa została podpisana i dodana do Twojego profilu, a jej kopia wraz z Twoim podpisem została pobrana na Twoje urządzenie!',
                  style: TextStyle(
                    color: CustomColors.gray,
                    fontSize: 20,
                  )),
              const Text(
                  textAlign: TextAlign.center,
                  'Nie musisz już nic robić, administrator zweryfikuje Twój profil najszybciej jak to możliwe (do 48h).',
                  style: TextStyle(
                    color: CustomColors.gray,
                    fontSize: 20,
                  )),
              Container(
                margin: const EdgeInsets.only(top: 24),
                child: const TextWithLink(
                    textAlign: TextAlign.center,
                    fontSize: 20,
                    left:
                        'W razie pytań możesz się z nami skontaktować - dane znajdziesz ',
                    link: 'tutaj',
                    right: '',
                    url:
                        'https://bws.onsinch.com/react/page/contacts-for-workers'),
              ),
              Container(
                margin: const EdgeInsets.only(top: 24),
                child: const TextWithLink(
                    textAlign: TextAlign.center,
                    fontSize: 20,
                    left: '',
                    link: 'Powrót do SINCH',
                    right: '',
                    url: 'https://bws.onsinch.com'),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

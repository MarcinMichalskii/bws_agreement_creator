import 'package:bws_agreement_creator/FormUI/Providers/login_data_provider.dart';
import 'package:bws_agreement_creator/FormUI/components/generate_pdf_button.dart';
import 'package:bws_agreement_creator/FormUI/onboarding_point_widget.dart';
import 'package:bws_agreement_creator/FormUI/outbording_information_sign.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OnboardingInformation extends StatelessWidget {
  const OnboardingInformation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            width: double.infinity,
            child: Container(
              decoration: BoxDecoration(
                  color: CustomColors.almostBlack2,
                  borderRadius: BorderRadius.circular(8)),
              padding: const EdgeInsets.all(16.0),
              child: const _OnboardingInformationContainer(),
            )),
      ),
    );
  }
}

class _OnboardingInformationContainer extends HookConsumerWidget {
  const _OnboardingInformationContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.read(loginProvider.notifier).state.data?.name ?? '';
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Witaj $name!',
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: CustomColors.gray,
              fontSize: 26,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'W BWS wszyscy pracują legalnie, zatem podpisują umowy zlecenie. Ta strona przygotuje dla Ciebie wszystkie wymagane dokumenty. ZANIM PODPISZESZ, PRZYCZYTAJ TE 3 PUNKTY:',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: CustomColors.gray,
                fontSize: 18,
              ),
            ),
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OnboardingPointWidget(
                  pointNumber: '1. ',
                  pointTextBold: 'Szanujemy swój czas',
                  poinText:
                      ' - za zapisanie się do pracy i nieobecność bez L4 grozi kara 300zł.'),
              OnboardingPointWidget(
                  pointNumber: '2. ',
                  pointTextBold: 'Jesteśmy uczciwi',
                  poinText:
                      ' - informujemy Cię, że kwoty na bws.onsinch.com to kwoty brutto (netto tylko dla JDG/Spółek)'),
              OnboardingPointWidget(
                  pointNumber: '3. ',
                  pointTextBold: 'Jesteśmy porządni',
                  poinText:
                      ' - wypełnij formularz zgodnie z prawdą. Za podanie fałszywych danych grozi kara 500zł.'),
              OnboardingPointWidget(
                  pointNumber: '4. ',
                  pointTextBold:
                      'Za chwilę będziesz mógł przejrzeć i podpisać umowę z BWS',
                  poinText:
                      ' - wypełnij formularz zgodnie z prawdą. Za podanie fałszywych danych grozi kara 500zł.'),
              OnboardingPointWidget(
                  pointNumber: '5. ',
                  pointTextBold:
                      'Umowa nie zobowiązuje Cię do podejmowania zleceń ani nie wiąże się z żadnymi opłatami.',
                  poinText:
                      ' - Tylko zapis na zlecenie przez Sinch jest wiążący.'),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: TextWithLink(
                      left:
                          'Umowa którą za chwilę podpiszesz, będzie wiążąca. O formie dokumentowej możesz przeczytać',
                      link: ' tutaj',
                      right: '',
                      url:
                          'https://sip.lex.pl/akty-prawne/dzu-dziennik-ustaw/kodeks-cywilny-16785996/art-77-2')),
            ],
          ),
          DefaultBorderedButton(
            onTap: () {
              Navigator.pop(context);
            },
            text: 'ROZUMIEM',
          )
        ],
      ),
    );
  }
}

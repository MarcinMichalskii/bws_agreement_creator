import 'package:bws_agreement_creator/FormUI/components/generate_pdf_button.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/material.dart';

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
            width: 480,
            height: 340,
            constraints: const BoxConstraints(maxWidth: 380),
            child: Container(
              decoration: BoxDecoration(
                  color: CustomColors.almostBlack2,
                  borderRadius: BorderRadius.circular(8)),
              padding: const EdgeInsets.all(16.0),
              child: _OnboardingInformationContainer(),
            )),
      ),
    );
  }
}

class _OnboardingInformationContainer extends StatelessWidget {
  const _OnboardingInformationContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Witaj!',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: CustomColors.gray,
            fontSize: 16,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            'W BWS wszyscy pracują legalnie, zatem podpisują umowy zlecenie. Ta strona przygotuje dla Ciebie wszystkie wymagane dokumenty. ZANIM PODPISZESZ, PRZYCZYTAJ TE 3 PUNKTY:',
            style: TextStyle(
              color: CustomColors.gray,
              fontSize: 13,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            '1. Szanujemy swój czas - za zapisanie się do pracy i nieobecność bez L4 grozi kara 300zł.',
            style: TextStyle(
              color: CustomColors.gray,
              fontSize: 13,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            '2. Jesteśmy uczciwi - informujemy Cię, że kwoty na bws.onsinch.com to kwoty brutto (netto tylko dla JDG/Spółek)',
            style: TextStyle(
              color: CustomColors.gray,
              fontSize: 13,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            '3. Jesteśmy porządni - wypełnij umowę faktycznymi danymi, które również wpisałeś w profilu na bws.onsinch.com. Za podanie fałszywych danych grozi kara 500zł.',
            style: TextStyle(
              color: CustomColors.gray,
              fontSize: 13,
            ),
          ),
        ),
        DefaultBorderedButton(
          onTap: () {
            Navigator.pop(context);
          },
          text: 'OK!',
        )
      ],
    );
  }
}

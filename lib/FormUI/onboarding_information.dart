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
            margin: EdgeInsets.symmetric(horizontal: 16),
            width: double.infinity,
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
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Witaj!',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: CustomColors.gray,
            fontSize: 26,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            'W BWS wszyscy pracują legalnie, zatem podpisują umowy zlecenie. Ta strona przygotuje dla Ciebie wszystkie wymagane dokumenty. ZANIM PODPISZESZ, PRZYCZYTAJ TE 3 PUNKTY:',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: CustomColors.gray,
              fontSize: 18,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: CustomColors.gray,
                    fontSize: 18,
                  ),
                  children: [
                    TextSpan(
                      text: '1. ',
                    ),
                    TextSpan(
                      text: 'Szanujemy swój czas',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text:
                          ' - za zapisanie się do pracy i nieobecność bez L4 grozi kara 300zł.',
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: CustomColors.gray,
                    fontSize: 18,
                  ),
                  children: [
                    TextSpan(
                      text: '2. ',
                    ),
                    TextSpan(
                      text: 'Jesteśmy uczciwi',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text:
                          ' - informujemy Cię, że kwoty na bws.onsinch.com to kwoty brutto (netto tylko dla JDG/Spółek)',
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: CustomColors.gray,
                    fontSize: 18,
                  ),
                  children: [
                    TextSpan(
                      text: '3. ',
                    ),
                    TextSpan(
                      text: 'Jesteśmy porządni',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text:
                          ' - wypełnij umowę faktycznymi danymi, które również wpisałeś/aś w profilu na bws.onsinch.com. Za podanie fałszywych danych grozi kara 500zł.',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        DefaultBorderedButton(
          onTap: () {
            Navigator.pop(context);
          },
          text: 'ROZUMIEM',
        )
      ],
    );
  }
}

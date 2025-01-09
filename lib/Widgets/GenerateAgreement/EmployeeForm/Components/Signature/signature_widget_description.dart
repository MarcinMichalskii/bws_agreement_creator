import 'package:bws_agreement_creator/Widgets/GenerateAgreement/text_with_link_widget.dart';
import 'package:flutter/material.dart';

class SignatureWidgetDescription extends StatelessWidget {
  const SignatureWidgetDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: const TextWithLinkWidget(
          left:
              "Ten rodzaj podpisu, to forma dokumentowa - jest pełnoprawnym podpisem w formie online. \nChcesz dowiedzieć się więcej na temat formy dokumentowej? ",
          link: "Przeczytaj ten artykuł.",
          right: "",
          url: "https://eurocert.pl/formy-zawierania-umow-rodzaje-i-roznice"),
    );
  }
}

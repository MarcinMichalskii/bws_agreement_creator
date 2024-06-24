import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/material.dart';

class ContentNoAvailableWidget extends StatelessWidget {
  const ContentNoAvailableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: const Text(
        textAlign: TextAlign.center,
        "Szkolenia są dostępne tylko dla zweryfikowanych użytkowników. \nWygeneruj umowę i poczekaj na weryfikację",
        style: TextStyle(color: CustomColors.gray, fontSize: 28),
      ),
    );
  }
}

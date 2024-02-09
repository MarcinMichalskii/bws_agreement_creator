import 'package:bws_agreement_creator/FormUI/components/bordered_input.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:hand_signature/signature.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LegalGuardianQuestionsWidget extends HookConsumerWidget {
  LegalGuardianQuestionsWidget({super.key});

  final guardianControl = HandSignatureControl(
    threshold: 3.0,
    smoothRatio: 0.65,
    velocityRange: 2.0,
  );

  final employeeControl = HandSignatureControl(
    threshold: 3.0,
    smoothRatio: 0.65,
    velocityRange: 2.0,
  );
  @override
  Widget build(BuildContext context, ref) {
    return Column(children: [
      const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Dane opiekuna prawnego:",
                  style: TextStyle(color: CustomColors.gray, fontSize: 20)),
            ],
          ),
        ],
      ),
      Container(height: 20),
      BorderedInput(
        placeholder: "Imię i nazwisko",
        onChanged: (value) {},
      ),
      BorderedInput(placeholder: "Pesel", onChanged: (value) {}),
      BorderedInput(placeholder: "Numer dowodu", onChanged: (value) {}),
      BorderedInput(placeholder: "Adres", onChanged: (value) {}),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: const Text("Podpis opiekuna",
                style: TextStyle(color: CustomColors.gray, fontSize: 20)),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: CustomColors.applicationColorMain,
                  foregroundColor: CustomColors.almostBlack),
              onPressed: () {
                guardianControl.clear();
              },
              child: const Text("Wyczyść"),
            ),
          ),
        ],
      ),
      Container(
        height: 160,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: CustomColors.almostBlack, // You can set the border color
            width: 2.0, // You can set the border width
          ),
        ),
        child: HandSignature(
          control: guardianControl,
          width: 0.8,
          type: SignatureDrawType.line,
          color: CustomColors.applicationColorMain,
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: const Text("Twój podpis",
                style: TextStyle(color: CustomColors.gray, fontSize: 20)),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: CustomColors.applicationColorMain,
                  foregroundColor: CustomColors.almostBlack),
              onPressed: () {
                employeeControl.clear();
              },
              child: const Text("Wyczyść"),
            ),
          ),
        ],
      ),
      Container(
        height: 160,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: CustomColors.almostBlack, // You can set the border color
            width: 2.0, // You can set the border width
          ),
        ),
        child: HandSignature(
          control: employeeControl,
          width: 0.8,
          type: SignatureDrawType.line,
          color: CustomColors.applicationColorMain,
        ),
      )
    ]);
  }
}

import 'package:bws_agreement_creator/FormUI/components/bordered_input.dart';
import 'package:bws_agreement_creator/FormUI/components/bws_logo.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:hand_signature/signature.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class B2bContractQuestionWidget extends HookConsumerWidget {
  final control = HandSignatureControl(
    threshold: 3.0,
    smoothRatio: 0.65,
    velocityRange: 2.0,
  );
  B2bContractQuestionWidget({super.key});
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
              Text("Dane twojej firmy",
                  style: TextStyle(color: CustomColors.gray, fontSize: 20)),
            ],
          ),
        ],
      ),
      BorderedInput(placeholder: "Nazwa", onChanged: (value) {}),
      BorderedInput(placeholder: "NIP", onChanged: (value) {}),
      BorderedInput(placeholder: "Adres", onChanged: (value) {}),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: const Text("Twój Podpis",
                style: TextStyle(color: CustomColors.gray, fontSize: 20)),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: CustomColors.applicationColorMain,
                  foregroundColor: CustomColors.almostBlack),
              onPressed: () {
                control.clear();
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
          control: control,
          width: 0.8,
          type: SignatureDrawType.line,
          color: CustomColors.applicationColorMain,
        ),
      )
    ]);
  }
}

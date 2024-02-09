import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:hand_signature/signature.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignatureWidget extends HookConsumerWidget {
  final control = HandSignatureControl(
    threshold: 3.0,
    smoothRatio: 0.65,
    velocityRange: 2.0,
  );
  SignatureWidget({super.key});
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
              Text("Podpis",
                  style: TextStyle(color: CustomColors.gray, fontSize: 20)),
            ],
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

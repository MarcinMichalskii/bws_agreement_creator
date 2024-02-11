import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hand_signature/signature.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignatureWidget extends HookConsumerWidget {
  final Function(Uint8List?) onSignatureChanged;
  final String label;
  final control = HandSignatureControl(
    threshold: 3.0,
    smoothRatio: 0.65,
    velocityRange: 2.0,
  );

  SignatureWidget(
      {super.key, required this.onSignatureChanged, this.label = 'Podpis'});
  @override
  Widget build(BuildContext context, ref) {
    return Column(children: [
      Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(label,
                    style: const TextStyle(
                        color: CustomColors.gray, fontSize: 20)),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: CustomColors.applicationColorMain,
                    foregroundColor: CustomColors.almostBlack),
                onPressed: () {
                  control.clear();
                  onSignatureChanged(null);
                },
                child: const Text("Wyczyść"),
              ),
            ),
          ],
        ),
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
          onPointerUp: () async {
            final data = await control.toImage();
            final uint8Data = data?.buffer.asUint8List();
            onSignatureChanged(uint8Data);
          },
          width: 0.8,
          type: SignatureDrawType.line,
          color: CustomColors.applicationColorMain,
        ),
      )
    ]);
  }
}

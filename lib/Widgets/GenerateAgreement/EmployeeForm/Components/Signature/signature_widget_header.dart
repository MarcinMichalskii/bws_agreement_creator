import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hand_signature/signature.dart';

class SignatureWidgetHeader extends StatelessWidget {
  const SignatureWidgetHeader({
    super.key,
    required this.label,
    required this.control,
    required this.onSignatureChanged,
  });

  final String label;
  final ValueNotifier<HandSignatureControl> control;
  final Function(Uint8List? p1) onSignatureChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(label,
                  style:
                      const TextStyle(color: CustomColors.gray, fontSize: 20)),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: CustomColors.applicationColorMain,
                  foregroundColor: CustomColors.almostBlack),
              onPressed: () {
                control.value.clear();

                onSignatureChanged(null);
              },
              child: const Text("Wyczyść"),
            ),
          ),
        ],
      ),
    );
  }
}

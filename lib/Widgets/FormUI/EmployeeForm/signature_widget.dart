import 'package:bws_agreement_creator/Widgets/FormUI/EmployeeForm/form_widget.dart';
import 'package:bws_agreement_creator/Widgets/FormUI/text_with_link_widget.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hand_signature/signature.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:bws_agreement_creator/utils/svg_extension.dart';

class SignatureWidget extends HookConsumerWidget {
  final Function(Uint8List?) onSignatureChanged;
  final String label;

  const SignatureWidget(
      {super.key,
      required this.onSignatureChanged,
      this.label = 'Narysuj swój podpis:'});
  @override
  Widget build(BuildContext context, ref) {
    final control = useState(HandSignatureControl(
      threshold: 3.0,
      smoothRatio: 0.65,
      velocityRange: 2.0,
    ));

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
                  control.value.clear();
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
          control: control.value,
          onPointerDown: () {
            ref.read(scrollEnabled.notifier).state = false;
          },
          onPointerUp: () async {
            final data = control.value.toSvg();

            final uint8Data = await data?.asPng();
            onSignatureChanged(uint8Data);
            ref.read(scrollEnabled.notifier).state = true;
          },
          width: 0.8,
          type: SignatureDrawType.line,
          color: CustomColors.applicationColorMain,
        ),
      ),
      Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: const TextWithLinkWidget(
            left:
                "Ten rodzaj podpisu, to forma dokumentowa - jest pełnoprawnym podpisem w formie online. \nChcesz dowiedzieć się więcej na temat formy dokumentowej? ",
            link: "Przeczytaj ten artykuł.",
            right: "",
            url: "https://eurocert.pl/formy-zawierania-umow-rodzaje-i-roznice"),
      )
    ]);
  }
}

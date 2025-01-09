import 'package:bws_agreement_creator/Widgets/GenerateAgreement/EmployeeForm/form_widget.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:bws_agreement_creator/utils/svg_extension.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hand_signature/signature.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignatureWidgetBox extends HookConsumerWidget {
  const SignatureWidgetBox({
    super.key,
    required this.control,
    required this.onSignatureChanged,
  });

  final ValueNotifier<HandSignatureControl> control;
  final Function(Uint8List? p1) onSignatureChanged;

  @override
  Widget build(BuildContext context, ref) {
    return Container(
      height: 160,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: CustomColors.almostBlack,
          width: 2.0,
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
    );
  }
}

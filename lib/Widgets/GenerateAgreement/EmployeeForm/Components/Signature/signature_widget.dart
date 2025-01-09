import 'dart:typed_data';

import 'package:bws_agreement_creator/Widgets/GenerateAgreement/EmployeeForm/Components/Signature/signature_widget_header.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/EmployeeForm/Components/Signature/signature_widget_box.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/EmployeeForm/Components/Signature/signature_widget_description.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hand_signature/signature.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignatureWidget extends HookConsumerWidget {
  final Function(Uint8List?) onSignatureChanged;

  final String label;
  final bool showDescriptionLabel;

  final ValueNotifier<HandSignatureControl>? initialControl;

  const SignatureWidget({
    super.key,
    required this.onSignatureChanged,
    this.label = 'Narysuj swój podpis:',
    this.showDescriptionLabel = true,
    this.initialControl,
  });

  @override
  Widget build(BuildContext context, ref) {
    final control = initialControl ??
        useState<HandSignatureControl>(
          HandSignatureControl(
            threshold: 3.0,
            smoothRatio: 0.65,
            velocityRange: 2.0,
          ),
        );

    return Column(children: [
      SignatureWidgetHeader(
        label: label,
        control: control,
        onSignatureChanged: onSignatureChanged,
      ),
      SignatureWidgetBox(
        control: control,
        onSignatureChanged: onSignatureChanged,
      ),
      if (showDescriptionLabel) SignatureWidgetDescription(),
    ]);
  }
}

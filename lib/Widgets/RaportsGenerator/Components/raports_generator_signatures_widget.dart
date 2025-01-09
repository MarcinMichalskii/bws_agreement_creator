import 'dart:convert';

import 'package:bws_agreement_creator/Widgets/GenerateAgreement/EmployeeForm/Components/Signature/signature_widget.dart';
import 'package:bws_agreement_creator/Widgets/RaportsGenerator/Providers/raport_generator_provider.dart';
import 'package:bws_agreement_creator/router.dart';
import 'package:bws_agreement_creator/utils/use_build_effect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hand_signature/signature.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RaportsGeneratorSignaturesWidget extends HookConsumerWidget {
  const RaportsGeneratorSignaturesWidget({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final bwsSignatureControl = useState(HandSignatureControl(
      threshold: 3.0,
      smoothRatio: 0.65,
      velocityRange: 2.0,
    ));

    final clientSignatureControl = useState(HandSignatureControl(
      threshold: 3.0,
      smoothRatio: 0.65,
      velocityRange: 2.0,
    ));

    useBuildEffect(() {
      final data = ref.read(raportGeneratorProvider);
      if (data.signatureBws.isNotEmpty) {
        final decoded = jsonDecode(data.signatureBws);
        bwsSignatureControl.value = HandSignatureControl.fromMap(decoded);
      }

      if (data.signatureClient.isNotEmpty) {
        final decoded = jsonDecode(data.signatureClient);
        clientSignatureControl.value = HandSignatureControl.fromMap(decoded);
      }
      return null;
    }, []);

    final bwsSignature = SignatureWidget(
      label: "Podpis BWS",
      initialControl: bwsSignatureControl,
      onSignatureChanged: (v) {
        ref
            .read(raportGeneratorProvider.notifier)
            .setSignatureBws(bwsSignatureControl.value.toMap());
      },
      showDescriptionLabel: false,
    );
    final clientSignature = SignatureWidget(
      label: "Podpis Klienta",
      initialControl: clientSignatureControl,
      onSignatureChanged: (v) {
        ref
            .read(raportGeneratorProvider.notifier)
            .setSignatureClient(clientSignatureControl.value.toMap());
      },
      showDescriptionLabel: false,
    );

    return isDekstop(context)
        ? Row(
            children: [
              Expanded(child: bwsSignature),
              Container(
                width: 16,
              ),
              Expanded(child: clientSignature)
            ],
          )
        : Column(
            children: [
              bwsSignature,
              Container(
                width: 16,
              ),
              clientSignature
            ],
          );
  }
}

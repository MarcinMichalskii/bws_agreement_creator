import 'package:bws_agreement_creator/Providers/agreement_generator_data_provider.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/EmployeeForm/Components/Signature/signature_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AgreementCreatorSignatureWidget extends HookConsumerWidget {
  const AgreementCreatorSignatureWidget({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return SignatureWidget(onSignatureChanged: (data) {
      ref.read(agreementGeneratorDataProvider.notifier).setSignature(data);
    });
  }
}

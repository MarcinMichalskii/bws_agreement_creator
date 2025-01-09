import 'package:bws_agreement_creator/Widgets/GenerateAgreement/EmployeeForm/Components/Signature/signature_widget.dart';
import 'package:bws_agreement_creator/Providers/agreement_generator_data_provider.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/Components/bordered_input.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:bws_agreement_creator/utils/user_data_validator.dart';
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
        onChanged: (value) {
          ref
              .read(agreementGeneratorDataProvider.notifier)
              .setLegalGuardianName(value);
        },
      ),
      BorderedInput(
          placeholder: "Pesel",
          validator: PeselValidator.validate,
          onChanged: (value) {
            ref
                .read(agreementGeneratorDataProvider.notifier)
                .setLegalGuardianPesel(value);
          }),
      BorderedInput(
          placeholder: "Numer dowodu",
          onChanged: (value) {
            ref
                .read(agreementGeneratorDataProvider.notifier)
                .setLegalGuardianIdNumber(value);
          }),
      BorderedInput(
          placeholder: "Adres",
          onChanged: (value) {
            ref
                .read(agreementGeneratorDataProvider.notifier)
                .setLegalGuardianAddress(value);
          }),
      SignatureWidget(
          label: 'Podpis opiekuna',
          onSignatureChanged: (data) {
            ref
                .read(agreementGeneratorDataProvider.notifier)
                .setLegalGuardianSignature(data);
          }),
      SignatureWidget(onSignatureChanged: (data) {
        ref.read(agreementGeneratorDataProvider.notifier).setSignature(data);
      }),
    ]);
  }
}

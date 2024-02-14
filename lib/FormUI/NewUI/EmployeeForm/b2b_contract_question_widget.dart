import 'package:bws_agreement_creator/FormUI/NewUI/EmployeeForm/default_signature_widget.dart';
import 'package:bws_agreement_creator/FormUI/NewUI/EmployeeForm/form_widget.dart';
import 'package:bws_agreement_creator/FormUI/Providers/new_form_data_provider.dart';
import 'package:bws_agreement_creator/FormUI/components/bordered_input.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:bws_agreement_creator/utils/nip_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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
    final initialAddress = useState(
        ref.read(newFormDataProvider.notifier).state.b2bCompanyAddress);

    void updateAddress(String text) {
      ref.read(newFormDataProvider.notifier).setB2bAddress(text);
    }

    void updateNip(String text) {
      ref.read(newFormDataProvider.notifier).setNip(text);
    }

    void updateCompanyName(String text) {
      ref.read(newFormDataProvider.notifier).updateCompanyName(text);
    }

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
      BorderedInput(
          placeholder: "Nazwa",
          onChanged: (value) {
            updateCompanyName(value ?? '');
          }),
      BorderedInput(
          validator: NipValidator.validate,
          placeholder: "NIP",
          onChanged: (value) {
            updateNip(value ?? '');
          }),
      BorderedInput(
          initialValue: initialAddress.value,
          placeholder: "Adres",
          onChanged: (value) {
            updateAddress(value ?? '');
          }),
      const DefaultSignatureWidget()
    ]);
  }
}

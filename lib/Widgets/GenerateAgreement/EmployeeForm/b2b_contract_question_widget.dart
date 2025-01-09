import 'package:bws_agreement_creator/Providers/agreement_generator_data_provider.dart';
import 'package:bws_agreement_creator/Providers/verify_tax_id.dart';
import 'package:bws_agreement_creator/Widgets/Components/action_button.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/Components/bordered_input.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/EmployeeForm/Components/Signature/agreement_creator_signature_widget.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:bws_agreement_creator/utils/use_build_effect.dart';
import 'package:bws_agreement_creator/utils/user_data_validator.dart';
import 'package:flutter/material.dart';
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
    void updateAddress(String text) {
      ref.read(agreementGeneratorDataProvider.notifier).setB2bAddress(text);
    }

    void updateNip(String text) {
      ref.read(agreementGeneratorDataProvider.notifier).setNip(text);
    }

    void updateCompanyName(String text) {
      ref.read(agreementGeneratorDataProvider.notifier).updateCompanyName(text);
    }

    void checkNip() {
      final taxId =
          ref.read(agreementGeneratorDataProvider.notifier).state.b2bCompanyNip;
      ref.read(verifyTaxIdProvider.notifier).verify(taxId: taxId ?? '');
    }

    final companyDataFetched = ref.watch(verifyTaxIdProvider).data != null;
    final fetchedData = ref.watch(verifyTaxIdProvider).data;

    useBuildEffect(() {
      updateAddress(fetchedData?.address ?? '');
      updateCompanyName(fetchedData?.name ?? '');
    }, [fetchedData]);

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: BorderedInput(
                validator: NipValidator.validate,
                margin: EdgeInsets.fromLTRB(0, 4, 8, 4),
                placeholder: "NIP",
                onChanged: (value) {
                  updateNip(value ?? '');
                }),
          ),
          ActionButton(
            isDisabled: false,
            isLoading: ref.watch(verifyTaxIdProvider).isLoading,
            icon: Icons.download,
            onTap: checkNip,
          )
        ],
      ),
      if (companyDataFetched)
        Text(fetchedData!.name,
            style: TextStyle(
              color: CustomColors.gray,
            )),
      if (companyDataFetched)
        Text(fetchedData!.address,
            style: TextStyle(
              color: CustomColors.gray,
            )),
      const AgreementCreatorSignatureWidget()
    ]);
  }
}

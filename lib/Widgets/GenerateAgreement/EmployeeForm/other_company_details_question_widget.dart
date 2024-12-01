import 'package:bws_agreement_creator/Widgets/GenerateAgreement/EmployeeForm/default_signature_widget.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/EmployeeForm/form_widget.dart';
import 'package:bws_agreement_creator/Providers/new_form_data_provider.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/Components/bordered_input.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/Components/form_toggle.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/Components/select_date_button.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:bws_agreement_creator/utils/nip_validator.dart';
import 'package:bws_agreement_creator/utils/use_build_effect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OtherCompanyDetailsQuestionWidget extends HookConsumerWidget {
  const OtherCompanyDetailsQuestionWidget({super.key});
  @override
  Widget build(BuildContext context, ref) {
    useBuildEffect(() {
      ref
          .read(newFormDataProvider.notifier)
          .updateOtherCompanyContractStartDate(DateTime.now());
      ref
          .read(newFormDataProvider.notifier)
          .updateOtherCompanyContractEndDate(DateTime.now());
      return;
    }, []);
    final contractWithoutTime = useState(false);

    return Column(children: [
      const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Dane drugiego pracodawcy:",
                  style: TextStyle(color: CustomColors.gray, fontSize: 20)),
            ],
          ),
        ],
      ),
      BorderedInput(
        placeholder: "Nazwa firmy",
        onChanged: (value) {
          ref
              .read(newFormDataProvider.notifier)
              .updateOtherCompanyName(value ?? '');
        },
      ),
      BorderedInput(
          placeholder: "NIP firmy",
          validator: NipValidator.validate,
          onChanged: (value) {
            ref
                .read(newFormDataProvider.notifier)
                .updateOtherCompanyNip(value ?? '');
          }),
      BorderedInput(
          placeholder: "Adres firmy",
          onChanged: (value) {
            ref
                .read(newFormDataProvider.notifier)
                .updateOtherCompanyAddress(value ?? '');
          }),
      FormToggle(
        isOn: contractWithoutTime.value,
        onChanged: (toggleValue) {
          contractWithoutTime.value = toggleValue;
          if (toggleValue) {
            ref
                .read(newFormDataProvider.notifier)
                .updateOtherCompanyContractEndDate(null);
          }
        },
        title: "Umowa na czas nieokreślony",
      ),
      Row(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(right: 8),
              child: SelectDateButton(
                dateText:
                    ref.watch(newFormDataProvider).otherCompanyStartDate ??
                        DateTime.now(),
                headerText: 'Data rozpoczęcia umowy',
                onDateSelected: (date) {
                  ref
                      .read(newFormDataProvider.notifier)
                      .updateOtherCompanyContractStartDate(date);
                },
              ),
            ),
          ),
          if (!contractWithoutTime.value)
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 8),
                child: SelectDateButton(
                    dateText:
                        ref.watch(newFormDataProvider).otherCompanyEndDate ??
                            DateTime.now(),
                    headerText: 'Data zakończenia umowy',
                    onDateSelected: (date) {
                      ref
                          .read(newFormDataProvider.notifier)
                          .updateOtherCompanyContractEndDate(date);
                    }),
              ),
            ),
        ],
      ),
      Container(height: 20),
      const DefaultSignatureWidget(),
    ]);
  }
}

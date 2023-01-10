import 'package:bws_agreement_creator/FormUI/components/bordered_input.dart';
import 'package:bws_agreement_creator/FormUI/components/form_toggle.dart';
import 'package:bws_agreement_creator/FormUI/components/select_date_button.dart';
import 'package:bws_agreement_creator/form.dart';
import 'package:bws_agreement_creator/utils/string_extensions.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WorksInOtherCompanyQuestions extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, ref) {
    final provider = FormNotifier.provider;
    final otherCompanyNip = ref.watch(provider).otherCompanyNip;
    final agreementWithTime = ref.watch(provider).agreementWithTime;
    final earnsMoreThanMinimalWage =
        ref.watch(provider).earnsMoreThanMinimalWage;
    return Column(children: [
      FormToggle(
        isOn: agreementWithTime,
        onChanged: ref.read(provider.notifier).setAgreementWithTime,
        title: "Umowa na czas określony",
      ),
      FormToggle(
        isOn: earnsMoreThanMinimalWage,
        onChanged: ref.read(provider.notifier).setEarnsMoreThanMinimalWage,
        title: "Osiągam dochód wyższy niż pensja minimalna (3490 zł brutto)",
      ),
      if (agreementWithTime)
        Row(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(right: 8),
                child: SelectDateButton(
                  dateText: DateTime.now(),
                  headerText: 'Data rozpoczęcia umowy',
                  onDateSelected:
                      ref.read(provider.notifier).setAgreementWithTimeStart,
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 8),
                child: SelectDateButton(
                  dateText: DateTime.now(),
                  headerText: 'Data zakończenia umowy',
                  onDateSelected:
                      ref.read(provider.notifier).setAgreementWithTimeEnd,
                ),
              ),
            )
          ],
        ),
      BorderedInput(
        placeholder: "Nazwa firmy pracodawcy",
        validator: ref.read(FormNotifier.provider.notifier).isEmptyValidator,
        onChanged: (value) {
          ref.read(provider.notifier).setOtherCompanyName(value ?? '');
        },
      ),
      BorderedInput(
        placeholder: 'NIP pracodawcy',
        errorText: otherCompanyNip.isValidNip() ? null : "Nieprawidłowy nip",
        onChanged: (value) {
          ref.read(provider.notifier).setOtherCompanyNip(value ?? '');
        },
      ),
    ]);
  }
}

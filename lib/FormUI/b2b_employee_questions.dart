import 'package:bws_agreement_creator/FormUI/b2b_additional_people.dart';
import 'package:bws_agreement_creator/FormUI/components/bordered_input.dart';
import 'package:bws_agreement_creator/additional_employee_data.dart';
import 'package:bws_agreement_creator/form.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:bws_agreement_creator/utils/string_extensions.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class B2BEmployeeQuestions extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, ref) {
    final provider = FormNotifier.provider;
    final nip = ref.watch(provider).nip;

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      BorderedInput(
        placeholder: "Nazwa firmy",
        onChanged: (value) {
          ref.read(provider.notifier).setCompanyName(value ?? '');
        },
      ),
      BorderedInput(
        placeholder: "NIP",
        errorText: nip.isValidNip() ? null : "Nieprawidłowy nip",
        onChanged: (value) {
          ref.read(provider.notifier).setCompanyNip(value ?? '');
        },
      ),
      BorderedInput(
        placeholder: "Miejscowość",
        onChanged: (value) {
          ref.read(provider.notifier).setCompanyCity(value ?? '');
        },
      ),
      BorderedInput(
        placeholder: "Adres firmy",
        onChanged: (value) {
          ref.read(provider.notifier).setCompanyAddress(value ?? '');
        },
      ),
      BorderedInput(
        placeholder: "Nazwa komunikatora internetowego",
        onChanged: (value) {
          ref.read(provider.notifier).setInternetComunicator(value ?? '');
        },
      ),
      BorderedInput(
        placeholder: "KRS (tylko spółki)",
        onChanged: (value) {
          ref.read(provider.notifier).setKrs(value ?? '');
        },
      ),
      Container(
        margin: const EdgeInsets.only(top: 12),
        child: Row(
          children: [
            const Text(
              'Dodatkowi pracownicy',
              style: TextStyle(color: CustomColors.gray),
            ),
            if (ref.watch(provider).additionalEmployees.length < 5)
              TextButton(
                  onPressed: () {
                    ref.read(provider.notifier).setAdditionalEmployee(
                        AdditionalEmployeeData(
                            id: UniqueKey().toString(),
                            name: '',
                            address: '',
                            pesel: ''));
                  },
                  child: const Icon(
                    Icons.add,
                    color: CustomColors.gray,
                  ))
          ],
        ),
      ),
      ...ref
          .watch(provider)
          .additionalEmployees
          .map(
            (e) => B2BAdditionalPeople(e),
          )
          .toList()
    ]);
  }
}

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
        validator: ref.read(provider.notifier).isEmptyValidator,
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
        validator: ref.read(provider.notifier).isEmptyValidator,
        onChanged: (value) {
          ref.read(provider.notifier).setCompanyCity(value ?? '');
        },
      ),
      BorderedInput(
        placeholder: "Adres firmy",
        validator: ref.read(provider.notifier).isEmptyValidator,
        onChanged: (value) {
          ref.read(provider.notifier).setCompanyAddress(value ?? '');
        },
      ),
      BorderedInput(
        placeholder: "Nazwa komunikatora internetowego",
        validator: ref.read(provider.notifier).isEmptyValidator,
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
      if (ref.watch(provider).areYouB2b)
        BorderedInput(
          placeholder: "Spółka reprezentowana przez (tylko spółki)",
          onChanged: (value) {
            ref.read(provider.notifier).setRepresentedBy(value ?? '');
          },
        ),
      if (ref.watch(provider).areYouB2b)
        BorderedInput(
          placeholder: "Rola reprezentanta spółki (tylko spółki)",
          onChanged: (value) {
            ref.read(provider.notifier).setRoleOfRepresentant(value ?? '');
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
                  )),
          ],
        ),
      ),
      Text(
        '(*Jeśli masz podwykonawcę, który razem z Tobą będzie świadczył usługi na rzecz BWS i będzie rozliczany przez Twoją działalność/spółkę, wpisz jego dane tutaj.)',
        style: TextStyle(color: CustomColors.gray, fontSize: 11),
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

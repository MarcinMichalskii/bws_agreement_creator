import 'package:bws_agreement_creator/FormUI/components/bordered_input.dart';
import 'package:bws_agreement_creator/address_data.dart';
import 'package:bws_agreement_creator/form.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddressDataQuestions extends HookConsumerWidget {
  final String header;
  final void Function(AdressData) onAddressDataChanged;
  final AdressData currentAddressData;

  const AddressDataQuestions(
      {super.key,
      required this.header,
      required this.onAddressDataChanged,
      required this.currentAddressData});
  @override
  Widget build(BuildContext context, ref) {
    return Column(children: [
      Container(
        padding: const EdgeInsets.only(top: 24),
        child: Row(
          children: [
            Text(
              header,
              style: TextStyle(
                  color: CustomColors.applicationColorMain.withOpacity(0.7)),
            )
          ],
        ),
      ),
      Row(children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(right: 8),
            child: BorderedInput(
              placeholder: "Ulica",
              validator:
                  ref.read(FormNotifier.provider.notifier).isEmptyValidator,
              onChanged: (value) {
                onAddressDataChanged(
                    currentAddressData.copyWith(street: value ?? ''));
              },
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            child: BorderedInput(
              placeholder: "Numer domu",
              validator:
                  ref.read(FormNotifier.provider.notifier).isEmptyValidator,
              onChanged: (value) {
                onAddressDataChanged(
                    currentAddressData.copyWith(houseNumber: value ?? ''));
              },
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            child: BorderedInput(
              placeholder: "Numer mieszkania",
              onChanged: (value) {
                onAddressDataChanged(
                    currentAddressData.copyWith(flatNumber: value ?? ''));
              },
            ),
          ),
        ),
      ]),
      Row(children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(right: 8),
            child: BorderedInput(
              placeholder: "Kod pocztowy",
              validator:
                  ref.read(FormNotifier.provider.notifier).isValidZipCode,
              onChanged: (value) {
                onAddressDataChanged(
                    currentAddressData.copyWith(zipCode: value ?? ''));
              },
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 8),
            child: BorderedInput(
              placeholder: "Miejscowość",
              validator:
                  ref.read(FormNotifier.provider.notifier).isEmptyValidator,
              onChanged: (value) {
                onAddressDataChanged(
                    currentAddressData.copyWith(city: value ?? ''));
              },
            ),
          ),
        ),
      ]),
      Row(children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(right: 8),
            child: BorderedInput(
              placeholder: "Kraj",
              validator:
                  ref.read(FormNotifier.provider.notifier).isEmptyValidator,
              onChanged: (value) {
                onAddressDataChanged(
                    currentAddressData.copyWith(country: value ?? ''));
              },
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 8),
            child: BorderedInput(
              placeholder: "Obywatelstwo",
              validator:
                  ref.read(FormNotifier.provider.notifier).isEmptyValidator,
              onChanged: (value) {
                onAddressDataChanged(
                    currentAddressData.copyWith(citizenship: value ?? ''));
              },
            ),
          ),
        ),
      ]),
    ]);
  }
}

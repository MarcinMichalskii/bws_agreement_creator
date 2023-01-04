import 'package:bws_agreement_creator/FormUI/components/bordered_input.dart';
import 'package:bws_agreement_creator/address_data.dart';
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
      BorderedInput(
        placeholder: "Gmina / Dzielnica",
        onChanged: (value) {
          onAddressDataChanged(
              currentAddressData.copyWith(district: value ?? ''));
        },
      ),
      Row(children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(right: 8),
            child: BorderedInput(
              placeholder: "Ulica",
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

import 'package:bws_agreement_creator/FormUI/components/bordered_input.dart';
import 'package:bws_agreement_creator/additional_employee_data.dart';
import 'package:bws_agreement_creator/form.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class B2BAdditionalPeople extends HookConsumerWidget {
  final AdditionalEmployeeData data;

  B2BAdditionalPeople(this.data);
  @override
  Widget build(BuildContext context, ref) {
    final provider = FormNotifier.provider;
    return Column(children: [
      Row(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(right: 8),
              child: BorderedInput(
                placeholder: "Imię i Nazwisko",
                validator: ref.read(provider.notifier).isEmptyValidator,
                onChanged: (value) {
                  ref
                      .read(provider.notifier)
                      .setAdditionalEmployee(data.copyWith(name: value ?? ''));
                },
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: BorderedInput(
                placeholder: "Adres",
                validator: ref.read(provider.notifier).isEmptyValidator,
                onChanged: (value) {
                  ref.read(provider.notifier).setAdditionalEmployee(
                      data.copyWith(address: value ?? ''));
                },
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 8),
                    child: BorderedInput(
                      placeholder: "Pesel/nr. paszportu (obcokrajowcy)",
                      validator: ref.read(provider.notifier).isEmptyValidator,
                      onChanged: (value) {
                        ref.read(provider.notifier).setAdditionalEmployee(
                            data.copyWith(pesel: value ?? ''));
                      },
                    ),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      ref
                          .read(FormNotifier.provider.notifier)
                          .removeAdditionalEmployee(data.id);
                    },
                    child: const Icon(
                      Icons.delete_outline,
                      color: CustomColors.gray,
                    ))
              ],
            ),
          ),
        ],
      ),
    ]);
  }
}

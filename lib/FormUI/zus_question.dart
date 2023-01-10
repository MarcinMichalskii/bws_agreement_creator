import 'package:bws_agreement_creator/FormUI/components/bordered_input.dart';
import 'package:bws_agreement_creator/FormUI/components/select_date_button.dart';
import 'package:bws_agreement_creator/form.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ZusQuestions extends HookConsumerWidget {
  ZusQuestions(this.onDateSelected, this.selectedDate, this.onSignatureChanged);
  final void Function(DateTime) onDateSelected;
  final DateTime selectedDate;
  final void Function(String) onSignatureChanged;
  @override
  Widget build(BuildContext context, ref) {
    return Row(children: [
      Expanded(
        child: Container(
          margin: const EdgeInsets.only(right: 4),
          child: SelectDateButton(
            dateText: selectedDate,
            headerText: 'Data decyzji',
            onDateSelected: onDateSelected,
          ),
        ),
      ),
      Expanded(
        child: Container(
          margin: const EdgeInsets.fromLTRB(4, 12, 0, 0),
          child: BorderedInput(
            placeholder: "Sygnatura",
            validator:
                ref.read(FormNotifier.provider.notifier).isEmptyValidator,
            onChanged: (value) {
              onSignatureChanged(value ?? '');
            },
          ),
        ),
      ),
    ]);
  }
}

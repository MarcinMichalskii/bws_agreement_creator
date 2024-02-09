import 'package:bws_agreement_creator/FormUI/NewUI/EmployeeForm/signature_widget.dart';
import 'package:bws_agreement_creator/FormUI/components/bordered_input.dart';
import 'package:bws_agreement_creator/FormUI/components/form_toggle.dart';
import 'package:bws_agreement_creator/FormUI/components/select_date_button.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OtherCompanyDetailsQuestionWidget extends HookConsumerWidget {
  const OtherCompanyDetailsQuestionWidget({super.key});
  @override
  Widget build(BuildContext context, ref) {
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
        onChanged: (value) {},
        initialValue: "",
      ),
      BorderedInput(placeholder: "NIP firmy", onChanged: (value) {}),
      BorderedInput(placeholder: "Adres firmy", onChanged: (value) {}),
      FormToggle(
        isOn: contractWithoutTime.value,
        onChanged: (toggleValue) {
          contractWithoutTime.value = toggleValue;
        },
        title: "Umowa na czas nieokreślony",
      ),
      Row(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(right: 8),
              child: SelectDateButton(
                dateText: DateTime.now(),
                headerText: 'Data rozpoczęcia umowy',
                onDateSelected: (t) {},
              ),
            ),
          ),
          if (!contractWithoutTime.value)
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 8),
                child: SelectDateButton(
                    dateText: DateTime.now(),
                    headerText: 'Data zakończenia umowy',
                    onDateSelected: (t) {}),
              ),
            ),
        ],
      ),
      Container(height: 20),
      SignatureWidget()
    ]);
  }
}

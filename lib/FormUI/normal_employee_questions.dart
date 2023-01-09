import 'package:bws_agreement_creator/FormUI/adress_data_questions.dart';
import 'package:bws_agreement_creator/FormUI/components/bordered_input.dart';
import 'package:bws_agreement_creator/FormUI/components/form_toggle.dart';
import 'package:bws_agreement_creator/FormUI/components/select_date_button.dart';
import 'package:bws_agreement_creator/FormUI/components/student_id_row.dart';
import 'package:bws_agreement_creator/FormUI/works_in_other_company_questions.dart';
import 'package:bws_agreement_creator/FormUI/zus_question.dart';
import 'package:bws_agreement_creator/form.dart';
import 'package:bws_agreement_creator/utils/date_extensions.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NormalEmployeeQuestions extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, ref) {
    final provider = FormNotifier.provider;
    final isStudent = ref.watch(provider).isStudent;
    final hasTwoAdresses = ref.watch(provider).hasTwoAdresses;
    final worksInOtherCompany = ref.watch(provider).worksInOtherCompany;
    final selectedBirthday = ref.watch(provider).birthday;
    final hasRetiring = ref.watch(provider).hasRetiring;
    final hasRent = ref.watch(provider).hasRent;
    final retiringDate = ref.watch(provider).retiringDecizionDate;
    final rentDate = ref.watch(provider).retiringDecizionDate;
    final sickInsurance = ref.watch(provider).sickInsurance;
    final isInvalid = ref.watch(provider).invalidStatus;
    return Column(children: [
      SelectDateButton(
          dateText: selectedBirthday,
          headerText: "Data urodzenia",
          onDateSelected: ref.read(provider.notifier).setBirthDay),
      if (!selectedBirthday.isAdult())
        BorderedInput(
          placeholder: "Imię i nazwisko opiekuna",
          onChanged: (value) {
            ref.read(provider.notifier).setParentName(value ?? '');
          },
        ),
      if (!selectedBirthday.isAdult())
        BorderedInput(
          placeholder: "Adres opiekuna",
          onChanged: (value) {
            ref.read(provider.notifier).setParentAdres(value ?? '');
          },
        ),
      if (!selectedBirthday.isAdult())
        BorderedInput(
          placeholder: "Pesel opiekuna",
          onChanged: (value) {
            ref.read(provider.notifier).setParentPesel(value ?? '');
          },
        ),
      if (!selectedBirthday.isAdult())
        BorderedInput(
          placeholder: "Numer dokumentu opiekuna",
          onChanged: (value) {
            ref.read(provider.notifier).setParentIdNumber(value ?? '');
          },
        ),
      AddressDataQuestions(
        header: 'Miejsce zameldowania',
        currentAddressData: ref.watch(provider).placeOfDomicile,
        onAddressDataChanged: ref.read(provider.notifier).setPlaceOfDomicile,
      ),
      FormToggle(
        isOn: hasTwoAdresses,
        onChanged: ref.read(provider.notifier).setHasTwoAdresses,
        title: 'Miejsce zamieszkania inne niż zameldowania?',
      ),
      if (hasTwoAdresses)
        AddressDataQuestions(
          header: 'Miejsce zamieszkania',
          currentAddressData: ref.watch(provider).placeOfLiving,
          onAddressDataChanged: ref.read(provider.notifier).setPlaceOfLiving,
        ),
      FormToggle(
        isOn: isStudent,
        onChanged: ref.read(provider.notifier).setAreYouStudent,
        title: "Jestem studentem lub uczniem",
      ),
      if (isStudent) const StudentIdRow(),
      if (isStudent)
        BorderedInput(
          placeholder: "Nazwa szkoły lub uczelni",
          onChanged: (value) {
            ref.read(provider.notifier).setSchoolName(value ?? '');
          },
        ),
      FormToggle(
        isOn: hasRetiring,
        onChanged: ref.read(provider.notifier).setHasRetiring,
        title: "Jestem uprawniony do emerytury",
      ),
      if (hasRetiring)
        ZusQuestions(ref.read(provider.notifier).setRetiringDecisionDate,
            retiringDate, ref.read(provider.notifier).setRetiringSignature),
      FormToggle(
        isOn: hasRent,
        onChanged: ref.read(provider.notifier).setHasRent,
        title: "Jestem uprawniony do renty",
      ),
      if (hasRent)
        ZusQuestions(ref.read(provider.notifier).setRentDecisionDate, rentDate,
            ref.read(provider.notifier).setRentSignature),
      FormToggle(
        isOn: worksInOtherCompany,
        onChanged: ref.read(provider.notifier).setWorksInOtherCompany,
        title: "Pracuję równocześnie dla innego pracodawcy",
      ),
      if (worksInOtherCompany) WorksInOtherCompanyQuestions(),
      FormToggle(
        isOn: isInvalid,
        onChanged: ref.read(provider.notifier).setInvalidStatus,
        title: "Posiadam orzeczony stopień niezdolności do pracy ",
      ),
      // FormToggle(
      //   isOn: sickInsurance,
      //   onChanged: ref.read(provider.notifier).setSickInsurance,
      //   title: "Wnoszę o objęcie mnie dobrowolnym ubezpieczeniem chorobowym",
      // ),
    ]);
  }
}

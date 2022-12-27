import 'package:bws_agreement_creator/bordered_input.dart';
import 'package:bws_agreement_creator/bws_logo.dart';
import 'package:bws_agreement_creator/consts.dart';
import 'package:bws_agreement_creator/generate_pdf_button.dart';
import 'package:bws_agreement_creator/is_student_toggle.dart';
import 'package:bws_agreement_creator/select_date_button.dart';
import 'package:bws_agreement_creator/select_photo_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TestPdf extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Imię: '),
      Text('Nazwisko: '),
      Text('Miasto:'),
      Text('Data urodzenia: ')
    ]);
  }
}

class EmployeeForm extends HookWidget {
  const EmployeeForm(
      {required this.selectedDate,
      required this.generateButtonTapped,
      required this.nameSet,
      required this.lastNameSet,
      required this.citySet,
      required this.onBirthDateSet,
      required this.areYouAStudent,
      required this.onStudentStatusChanged,
      required this.onSelectStudentIdSelected,
      this.studentIdImage,
      required this.onStudentIdRemoveTapped,
      super.key});

  final DateTime selectedDate;
  final Function(String) nameSet;
  final Function(String) lastNameSet;
  final Function(String) citySet;
  final Function(DateTime) onBirthDateSet;
  final VoidCallback generateButtonTapped;
  final bool areYouAStudent;
  final void Function(bool) onStudentStatusChanged;
  final VoidCallback onSelectStudentIdSelected;
  final Image? studentIdImage;
  final VoidCallback onStudentIdRemoveTapped;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: Consts.defaultMaxWidth),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: const EdgeInsets.only(top: 64),
                    constraints: const BoxConstraints(maxHeight: 100),
                    child: BwsLogo()),
              ],
            ),
            BorderedInput(
              placeholder: "Imię",
              onChanged: (value) {
                nameSet(value ?? '');
              },
            ),
            BorderedInput(
              placeholder: "Nazwisko",
              onChanged: (value) {
                lastNameSet(value ?? '');
              },
            ),
            BorderedInput(
              placeholder: "Miasto",
              onChanged: (value) {
                citySet(value ?? '');
              },
            ),
            SelectDateButton(
                dateText: selectedDate,
                headerText: "Data urodzenia",
                onDateSelected: onBirthDateSet),
            IsStudentToggle(
                areYouAStudent: areYouAStudent,
                onChanged: onStudentStatusChanged),
            if (areYouAStudent)
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  studentIdImage == null
                      ? SelectPhotoButton(onTap: onSelectStudentIdSelected)
                      : GestureDetector(
                          onTap: onStudentIdRemoveTapped,
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5)),
                            constraints: const BoxConstraints(
                                maxHeight: 100, maxWidth: 140),
                            child: studentIdImage!,
                          ),
                        ),
                ],
              ),
            GeneratePdfButton(
              onTap: generateButtonTapped,
            ),
          ]),
        ),
      ),
    );
  }
}

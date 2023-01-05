import 'package:bws_agreement_creator/FormUI/b2b_employee_questions.dart';
import 'package:bws_agreement_creator/FormUI/components/bordered_input.dart';
import 'package:bws_agreement_creator/FormUI/components/bws_logo.dart';
import 'package:bws_agreement_creator/FormUI/components/generate_pdf_button.dart';
import 'package:bws_agreement_creator/FormUI/components/is_student_toggle.dart';
import 'package:bws_agreement_creator/FormUI/normal_employee_questions.dart';
import 'package:bws_agreement_creator/form.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:bws_agreement_creator/utils/consts.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EmployeeForm extends HookConsumerWidget {
  const EmployeeForm(
      {required this.generateButtonTapped, required this.isLoading, super.key});
  final VoidCallback generateButtonTapped;
  final bool isLoading;

  @override
  Widget build(BuildContext context, ref) {
    final provider = FormNotifier.provider;
    final areYouB2B = ref.watch(provider).areYouB2b;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Center(
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
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(right: 8),
                      child: BorderedInput(
                        placeholder: "Imię",
                        onChanged: (value) {
                          ref.read(provider.notifier).setName(value ?? '');
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      child: BorderedInput(
                        placeholder: "Drugie imię",
                        onChanged: (value) {
                          ref
                              .read(provider.notifier)
                              .setSecondName(value ?? '');
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 8),
                      child: BorderedInput(
                        placeholder: "Nazwisko",
                        onChanged: (value) {
                          ref.read(provider.notifier).setLastName(value ?? '');
                        },
                      ),
                    ),
                  ),
                ],
              ),
              if (!areYouB2B)
                BorderedInput(
                  placeholder: "Pesel",
                  onChanged: (value) {
                    ref.read(provider.notifier).setPesel(value ?? '');
                  },
                ),
              if (!areYouB2B)
                BorderedInput(
                  placeholder: "Nazwisko rodowe",
                  onChanged: (value) {
                    ref.read(provider.notifier).setFamilyName(value ?? '');
                  },
                ),
              BorderedInput(
                placeholder: "Numer dowodu lub paszportu",
                onChanged: (value) {
                  ref.read(provider.notifier).setPassportOrId(value ?? '');
                },
              ),
              BorderedInput(
                placeholder: "Numer telefonu",
                onChanged: (value) {
                  ref.read(provider.notifier).setPhoneNumber(value ?? '');
                },
              ),
              BorderedInput(
                placeholder: "Adres email",
                onChanged: (value) {
                  ref.read(provider.notifier).setEmailAddress(value ?? '');
                },
              ),
              FormToggle(
                isOn: ref.watch(provider).areYouB2b,
                onChanged: ref.read(provider.notifier).setAreYouB2B,
                title: "Czy prowadzisz działalność B2B?",
              ),
              if (areYouB2B) B2BEmployeeQuestions(),
              if (!areYouB2B) NormalEmployeeQuestions(),
              Container(
                padding: const EdgeInsets.only(bottom: 64),
                child: !isLoading
                    ? GeneratePdfButton(
                        onTap: generateButtonTapped,
                      )
                    : Container(
                        constraints:
                            BoxConstraints(maxHeight: 16, maxWidth: 16),
                        child: CircularProgressIndicator(
                          color: CustomColors.applicationColorMain,
                        ),
                      ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

import 'package:bws_agreement_creator/FormUI/b2b_employee_questions.dart';
import 'package:bws_agreement_creator/FormUI/components/bordered_input.dart';
import 'package:bws_agreement_creator/FormUI/components/bws_logo.dart';
import 'package:bws_agreement_creator/FormUI/components/generate_pdf_button.dart';
import 'package:bws_agreement_creator/FormUI/components/form_toggle.dart';
import 'package:bws_agreement_creator/FormUI/components/select_photo_button.dart';
import 'package:bws_agreement_creator/FormUI/id_row.dart';
import 'package:bws_agreement_creator/FormUI/normal_employee_questions.dart';
import 'package:bws_agreement_creator/FormUI/onboarding_information.dart';
import 'package:bws_agreement_creator/FormUI/outbording_information.dart';
import 'package:bws_agreement_creator/form.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:bws_agreement_creator/utils/consts.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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

    final onSelectedPermissionTapped = useCallback(() async {
      FilePickerResult? result =
          await FilePicker.platform.pickFiles(type: FileType.image);
      final image = result?.files.first.bytes;
      if (image != null) {
        ref.read(FormNotifier.provider.notifier).setPermissionData(image);
        ref
            .read(FormNotifier.provider.notifier)
            .setPermissionImage(Image.memory(image));
      }
    }, []);

    final onRemovePermissionTapped = useCallback(() {
      ref.read(FormNotifier.provider.notifier).setPermissionData(null);
      ref.read(FormNotifier.provider.notifier).setPermissionImage(null);
    }, []);

    final permissionImage = ref.watch(provider).permissionImage;

    useBuildEffect(() {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) => OnboardingInformation());
    }, []);

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: Consts.defaultMaxWidth),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Column(children: [
                Text(ref.watch(provider).name,
                    style: TextStyle(fontSize: 16, color: Colors.white)),
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
                          validator:
                              ref.read(provider.notifier).isEmptyValidator,
                          onChanged: (value) {
                            ref.read(provider.notifier).setName(value ?? '');
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 8),
                        child: BorderedInput(
                          placeholder: "Nazwisko",
                          validator:
                              ref.read(provider.notifier).isEmptyValidator,
                          onChanged: (value) {
                            ref
                                .read(provider.notifier)
                                .setLastName(value ?? '');
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                BorderedInput(
                  placeholder: "Pesel",
                  onChanged: (value) {
                    ref.read(provider.notifier).setPesel(value ?? '');
                  },
                ),
                if (!ref.watch(provider).areYouB2b)
                  FormToggle(
                    isOn: ref.watch(provider).dontHavePesel,
                    onChanged: ref.read(provider.notifier).setDontHavePesel,
                    title: "Nie mam numeru pesel",
                  ),
                // if (ref.watch(provider).dontHavePesel &&
                //     !ref.watch(provider).areYouB2b)
                BorderedInput(
                  placeholder: "Numer dowodu lub paszportu",
                  onChanged: (value) {
                    ref.read(provider.notifier).setPassportOrId(value ?? '');
                  },
                ),
                // if (ref.watch(provider).dontHavePesel &&
                //     !ref.watch(provider).areYouB2b)
                Row(
                  children: [
                    const IdRow(),
                    if (ref.watch(provider).dontHavePesel &&
                        !ref.watch(provider).areYouB2b)
                      permissionImage == null
                          ? Container(
                              margin: EdgeInsets.only(left: 16),
                              child: SelectPhotoButton(
                                onTap: onSelectedPermissionTapped,
                                title: 'Pozwolenie na pobyt',
                              ),
                            )
                          : GestureDetector(
                              onTap: onRemovePermissionTapped,
                              child: Container(
                                margin: const EdgeInsets.only(left: 16),
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5)),
                                constraints: const BoxConstraints(
                                    maxHeight: 100, maxWidth: 140),
                                child: permissionImage,
                              ),
                            ),
                  ],
                ),
                Container(
                  child: BorderedInput(
                    placeholder: "Numer telefonu (Podany w aplikacji sinch)",
                    validator: ref.read(provider.notifier).isValidPhoneNumber,
                    onChanged: (value) {
                      ref.read(provider.notifier).setPhoneNumber(value ?? '');
                    },
                  ),
                ),
                BorderedInput(
                  placeholder: "Adres email (Podany w aplikacji sinch)",
                  validator: ref.read(provider.notifier).isValidEmail,
                  onChanged: (value) {
                    ref.read(provider.notifier).setEmailAddress(value ?? '');
                  },
                ),
                FormToggle(
                  isOn: ref.watch(provider).areYouB2b,
                  onChanged: ref.read(provider.notifier).setAreYouB2B,
                  title: "Czy prowadzisz działalność B2B?",
                ),
                if (ref.watch(provider).areYouB2b)
                  BorderedInput(
                    placeholder: "Numer dowodu lub paszportu",
                    onChanged: (value) {
                      ref.read(provider.notifier).setPassportOrId(value ?? '');
                    },
                  ),
                if (areYouB2B) B2BEmployeeQuestions(),
                if (!areYouB2B) NormalEmployeeQuestions(),
                Container(
                  padding: const EdgeInsets.only(bottom: 64),
                  child: !isLoading
                      ? DefaultBorderedButton(
                          text: "Generuj dokument",
                          onTap: generateButtonTapped,
                        )
                      : Container(
                          constraints:
                              const BoxConstraints(maxHeight: 16, maxWidth: 16),
                          child: const CircularProgressIndicator(
                            color: CustomColors.applicationColorMain,
                          ),
                        ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

void useBuildEffect(Dispose? Function() effect, [List<Object?>? keys]) {
  useEffect(() {
    Dispose? disposeCallback;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      disposeCallback = effect();
    });

    return () {
      if (disposeCallback != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          disposeCallback!();
        });
      }
    };
  }, keys);
}

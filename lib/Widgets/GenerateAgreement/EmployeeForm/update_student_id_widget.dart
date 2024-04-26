import 'package:bws_agreement_creator/Providers/profile_data_provider.dart';
import 'package:bws_agreement_creator/Providers/update_student_id_provider.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/components/bordered_input.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/components/bws_logo.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/components/generate_pdf_button.dart';
import 'package:bws_agreement_creator/Widgets/app_scaffold.dart';
import 'package:bws_agreement_creator/utils/app_state_provider.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:bws_agreement_creator/utils/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UpdateStudentIdWidget extends HookConsumerWidget {
  const UpdateStudentIdWidget({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final text = ref.watch(profileProvider).data?.updateStudentIdReason();
    final idNumber = useState('');
    final isLoading = ref.watch(updateStudentIdProvider).isLoading ||
        ref.watch(profileProvider).isLoading;

    bool invalidStudentId() {
      return RegExp(r'[^0-9\/\s]').hasMatch(idNumber.value) ||
          idNumber.value.isEmpty;
    }

    ref.listen(updateStudentIdProvider, (previous, next) {
      if (next.error != null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              next.error!.message,
            )));

        ref.read(appStateProvider.notifier).setIsLoggedIn(false);
      }
    });

    ref.listen(profileProvider, (previous, next) {
      if (next.error != null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              next.error!.message,
            )));

        ref.read(appStateProvider.notifier).setIsLoggedIn(false);
      }
    });

    return AppScaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            constraints: const BoxConstraints(maxWidth: Consts.defaultMaxWidth),
            child: Column(children: [
              Container(
                  margin: const EdgeInsets.only(top: 64),
                  constraints: const BoxConstraints(maxHeight: 100),
                  child: BwsLogo()),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 24, 0, 12),
                child: Text(
                  text ?? '',
                  style:
                      const TextStyle(color: CustomColors.gray, fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
              BorderedInput(
                placeholder: 'Numer legitymacji studenckiej',
                onChanged: (text) {
                  idNumber.value = text ?? '';
                },
              ),
              isLoading
                  ? Container(
                      margin: const EdgeInsets.only(top: 8),
                      child: const CircularProgressIndicator(
                        color: CustomColors.applicationColorMain,
                      ))
                  : Column(
                      children: [
                        DefaultBorderedButton(
                            borderColor: invalidStudentId()
                                ? CustomColors.gray
                                : CustomColors.applicationColorMain,
                            onTap: invalidStudentId()
                                ? null
                                : () {
                                    ref
                                        .read(updateStudentIdProvider.notifier)
                                        .updateStudentId(idNumber.value);
                                  },
                            text: 'Wyślij'),
                        Container(
                          margin: const EdgeInsets.only(top: 16),
                          child: TextButton(
                            onPressed: () {
                              ref
                                  .read(updateStudentIdProvider.notifier)
                                  .updateStudentId("");
                              ref.read(notAStudentTapped.notifier).state = true;
                            },
                            child: const Text(
                              "Nie jestem studentem",
                              style: TextStyle(
                                  color: CustomColors.red,
                                  fontSize: 16,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                        ),
                      ],
                    )
            ]),
          ),
        ),
      ),
    );
  }
}

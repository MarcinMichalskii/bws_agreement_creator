import 'package:bws_agreement_creator/Providers/profile_data_provider.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/Components/default_bordered_button.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/EmployeeForm/Components/onboarding_point_widget.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:bws_agreement_creator/utils/user_data_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TrainingsOnboardingInformation extends StatelessWidget {
  const TrainingsOnboardingInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            width: double.infinity,
            child: Container(
              decoration: BoxDecoration(
                  color: CustomColors.almostBlack2,
                  borderRadius: BorderRadius.circular(8)),
              padding: const EdgeInsets.all(16.0),
              child: const _TrainingsOnboardingInformationContainer(),
            )),
      ),
    );
  }
}

class _TrainingsOnboardingInformationContainer extends HookConsumerWidget {
  const _TrainingsOnboardingInformationContainer();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onConfirm = useCallback(() async {
      Navigator.pop(context);
      await UserDataHelper().markTrainingsPopup();
    }, []);
    final name = ref.read(profileProvider.notifier).state.data?.name ?? '';
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Witaj na platformie szkoleniowej BWSu!',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: CustomColors.gray,
              fontSize: 26,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'W tej zakładce znajdziesz szkolenia video oraz quizy, które pomogą Ci w zdobyciu wiedzy i umiejętności potrzebnych do pracy w BWS.\n Poniżej znajdziesz kilka kluczowych informacji:',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: CustomColors.gray,
                fontSize: 18,
              ),
            ),
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OnboardingPointWidget(
                  pointNumber: '1. ',
                  pointTextBold: '',
                  poinText:
                      'Aby zaliczyć rozdział musisz obejrzeć film i zdać quiz'),
              OnboardingPointWidget(
                  pointNumber: '2. ',
                  pointTextBold: '',
                  poinText:
                      'Aby przejść do kolejnego rozdziału musisz zaliczyć poprzedni'),
              OnboardingPointWidget(
                  pointNumber: '3. ',
                  pointTextBold: 'To samo tyczy się poszczególnych szkoleń',
                  poinText:
                      ' - aby przejść do kolejnego musisz zaliczyć poprzednie'),
              OnboardingPointWidget(
                  pointNumber: '4. ',
                  pointTextBold: '',
                  poinText:
                      'Każde szkolenie zakończone jest quizem ze wszystkich rozdziałów'),
              OnboardingPointWidget(
                  pointNumber: '5. ',
                  pointTextBold: '',
                  poinText:
                      'Po zakończeniu szkolenia otrzymasz odznakę na swoim profilu SINCH'),
            ],
          ),
          DefaultBorderedButton(
            onTap: () {
              onConfirm();
            },
            text: 'ROZUMIEM',
          )
        ],
      ),
    );
  }
}

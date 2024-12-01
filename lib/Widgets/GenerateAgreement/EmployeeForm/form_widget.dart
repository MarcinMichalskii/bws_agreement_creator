import 'package:bws_agreement_creator/Model/selected_page_data.dart';
import 'package:bws_agreement_creator/Providers/new_form_data_provider.dart';
import 'package:bws_agreement_creator/Providers/selected_page_provider.dart';
import 'package:bws_agreement_creator/Providers/upload_pdf_provider.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/test/bws_logo.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/EmployeeForm/Components/exapmle_agreement_button.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/EmployeeForm/Components/form_navigation_widget.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/EmployeeForm/Components/generate_agreement_button.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/EmployeeForm/onboarding_information.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/EmployeeForm/send_agreement_confirmation.dart';
import 'package:bws_agreement_creator/Widgets/app_scaffold.dart';
import 'package:bws_agreement_creator/utils/app_state_provider.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:bws_agreement_creator/utils/consts.dart';
import 'package:bws_agreement_creator/utils/preview_pdf_generator.dart';
import 'package:bws_agreement_creator/utils/use_build_effect.dart';
import 'package:bws_agreement_creator/utils/user_data_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final scrollEnabled = StateProvider<bool>((ref) {
  return true;
});

class EmployeeFormWidget extends HookConsumerWidget {
  const EmployeeFormWidget({super.key});
  @override
  Widget build(BuildContext context, ref) {
    final showWelcomeMessage = useCallback(() async {
      final seenAgreementPopup = await UserDataHelper().seenTrainingsPopup();
      if (!seenAgreementPopup) {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const OnboardingInformation());
      }
    }, []);

    useBuildEffect(() {
      showWelcomeMessage();
      return null;
    }, []);

    final onError = useCallback((String error) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(backgroundColor: Colors.red, content: Text(error)));
    }, []);

    ref.listen(uploadPdfProvider, (previous, next) {
      if (next.error != null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              next.error!.message,
            )));
      }
    });

    ref.listen(appStateProvider, (previous, next) {
      if (next.sentAgreement) {
        context.pushNamed('outboarding');
      }
    });

    void onAgreementSend() {
      final formData = ref.read(newFormDataProvider.notifier).state;

      final SelectedPage page = ref.read(selectedPageProvider.notifier).state;

      final validationError = formData.validationError(page);
      if (validationError != null) {
        onError(validationError);
        return;
      }
      ref.read(uploadPdfProvider.notifier).uploadPdf();
    }

    void onGeneratePress() {
      final isStudent = ref.read(newFormDataProvider).isStudent;
      final isB2b = ref.read(selectedPageProvider.notifier).state ==
          SelectedPage.b2bContract;

      if (isStudent || isB2b) {
        onAgreementSend();
        return;
      }
      showDialog(
          context: context,
          builder: (context) => SendAgreementConfirmation(
                onConfirm: () {
                  Navigator.pop(context);
                  onAgreementSend();
                },
              ));
    }

    void onPreviewSelected() {
      final SelectedPage page = ref.read(selectedPageProvider.notifier).state;

      PreviewPdfGenerator.generatePreview(page);
    }

    return AppScaffold(
      body: SingleChildScrollView(
        physics: ref.watch(scrollEnabled)
            ? const AlwaysScrollableScrollPhysics()
            : const NeverScrollableScrollPhysics(),
        child: Center(
          child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              constraints:
                  const BoxConstraints(maxWidth: Consts.defaultMaxWidth),
              child: Column(
                children: [
                  Container(
                      margin: const EdgeInsets.only(top: 64),
                      constraints: const BoxConstraints(maxHeight: 100),
                      child: BwsLogo()),
                  Container(height: 32),
                  ref.watch(selectedPageProvider).page,
                  FormNavigationWidget(),
                  if (ref.read(selectedPageProvider).isFinalPage)
                    ExampleAgreementButton(
                        onPreviewSelected: onPreviewSelected),
                  if (ref.watch(selectedPageProvider).isFinalPage)
                    ref.watch(uploadPdfProvider).isLoading
                        ? const CircularProgressIndicator(
                            color: CustomColors.applicationColorMain,
                          )
                        : GenerateAgreementButton(
                            onGeneratePress: onGeneratePress,
                          )
                ],
              )),
        ),
      ),
    );
  }
}

import 'package:bws_agreement_creator/FormUI/Providers/new_form_data_provider.dart';
import 'package:bws_agreement_creator/FormUI/Providers/selected_page_provider.dart';
import 'package:bws_agreement_creator/FormUI/Providers/upload_pdf_provider.dart';
import 'package:bws_agreement_creator/FormUI/components/bws_logo.dart';
import 'package:bws_agreement_creator/FormUI/components/select_date_button.dart';
import 'package:bws_agreement_creator/FormUI/onboarding_information.dart';
import 'package:bws_agreement_creator/Model/selected_page_data.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:bws_agreement_creator/utils/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final scrollEnabled = StateProvider<bool>((ref) {
  return true;
});

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

class EmployeeFormWidget extends HookConsumerWidget {
  const EmployeeFormWidget({super.key});
  @override
  Widget build(BuildContext context, ref) {
    useBuildEffect(() {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) => const OnboardingInformation());
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

    void onGeneratePress() {
      final formData = ref.read(newFormDataProvider.notifier).state;
      final SelectedPage page = ref.read(selectedPageProvider.notifier).state;

      final validationError = formData.validationError(page);
      if (validationError != null) {
        onError(validationError);
        return;
      }
      ref.read(uploadPdfProvider.notifier).uploadPdf();
    }

    return Scaffold(
      backgroundColor: Colors.black,
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
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (ref.watch(selectedPageProvider).previousPage !=
                            null)
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    CustomColors.applicationColorMain,
                                foregroundColor: CustomColors.almostBlack),
                            onPressed: () {
                              final previousPage =
                                  ref.read(selectedPageProvider).previousPage!;

                              ref
                                  .read(selectedPageProvider.notifier)
                                  .setPage(previousPage);
                            },
                            child: const Text("Wstecz"),
                          ),
                      ],
                    ),
                  ),
                  if (ref.watch(selectedPageProvider).isFinalPage)
                    ref.watch(uploadPdfProvider).isLoading
                        ? const CircularProgressIndicator(
                            color: CustomColors.applicationColorMain,
                          )
                        : Container(
                            margin: const EdgeInsets.only(bottom: 16),
                            child: FormButtonUI(
                              hasHeader: false,
                              title: "Generuj umowę",
                              headerText: "",
                              fontWeight: FontWeight.w600,
                              textSize: 18,
                              textColor: CustomColors.darkGray,
                              onPress: onGeneratePress,
                              icon: const Icon(
                                Icons.send_and_archive_outlined,
                                color: CustomColors.almostBlack,
                                size: 32,
                              ),
                            ),
                          )
                ],
              )),
        ),
      ),
    );
  }
}

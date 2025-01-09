import 'package:bws_agreement_creator/Providers/profile_data_provider.dart';
import 'package:bws_agreement_creator/Providers/upload_raport_provider.dart';
import 'package:bws_agreement_creator/Widgets/Components/action_button.dart';
import 'package:bws_agreement_creator/Widgets/Components/loading_indicator.dart';
import 'package:bws_agreement_creator/Widgets/RaportsGenerator/Components/acceptance_widget.dart';
import 'package:bws_agreement_creator/Widgets/RaportsGenerator/Components/ordered_services_details_widget.dart';
import 'package:bws_agreement_creator/Widgets/RaportsGenerator/Components/raports_generator_order_details_widget.dart';
import 'package:bws_agreement_creator/Widgets/RaportsGenerator/Components/raports_generator_signatures_widget.dart';
import 'package:bws_agreement_creator/Widgets/RaportsGenerator/Pdf/raport_pdf_generator.dart';
import 'package:bws_agreement_creator/Widgets/RaportsGenerator/Providers/raport_generator_provider.dart';
import 'package:bws_agreement_creator/utils/preview_pdf_generator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RaportsGeneratorWidget extends HookConsumerWidget {
  const RaportsGeneratorWidget({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final isLoading = ref.watch(uploadRaportProvider).isLoading;
    final generateDisabled =
        ref.watch(raportGeneratorProvider.notifier).generateDisabled;
    final raportData = ref.watch(raportGeneratorProvider);
    final onPreviewTapped = useCallback(() async {
      final profile = ref.read(profileProvider).data;
      if (profile == null) return;
      final raport = await createPdfWithTable(raportData, profile);
      if (kIsWeb) {
        PreviewPdfGenerator.generatePreviewForData(data: raport);
      } else {
        PreviewPdfGenerator.showPreviewForMobile(context, raport);
      }
    }, [raportData]);

    final onSendTapped = useCallback(() async {
      final profile = ref.read(profileProvider).data;
      if (profile == null) return;
      final raport = await createPdfWithTable(raportData, profile);
      ref
          .read(uploadRaportProvider.notifier)
          .uploadPdf(raport, raportData.location!.client, raportData.startDate);
    }, [raportData]);

    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          RaportsGeneratorOrderDetailsWidget(),
          Container(
            height: 16,
          ),
          OrderedServicesDetailsWidget(),
          Container(
            height: 16,
          ),
          AcceptanceWidget(),
          Container(height: 16),
          RaportsGeneratorSignaturesWidget(
            key: key,
          ),
          Container(height: 32),
          if (!isLoading)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ActionButton(
                    isDisabled: generateDisabled,
                    text: 'preview'.tr(),
                    onTap: onPreviewTapped,
                    icon: Icons.pageview_outlined,
                  ),
                ),
              ],
            ),
          Container(height: 4),
          if (isLoading) LoadingIndicator(),
          if (!isLoading)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ActionButton(
                    isDisabled: generateDisabled,
                    text: 'generateAndSendRaport'.tr(),
                    onTap: onSendTapped,
                    icon: Icons.send_outlined,
                  ),
                ),
              ],
            ),
          Container(
            height: 120,
          )
        ],
      ),
    );
  }
}

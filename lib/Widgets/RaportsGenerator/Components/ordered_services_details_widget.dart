import 'package:bws_agreement_creator/Widgets/GenerateAgreement/Components/bordered_input.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/Components/select_date_button.dart';
import 'package:bws_agreement_creator/Widgets/RaportsGenerator/Components/raports_generator_header_widget.dart';
import 'package:bws_agreement_creator/Widgets/RaportsGenerator/Components/raports_generator_toggle_widget.dart';
import 'package:bws_agreement_creator/Widgets/RaportsGenerator/Providers/raport_generator_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OrderedServicesDetailsWidget extends ConsumerWidget {
  const OrderedServicesDetailsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    return Column(
      children: [
        RaportsGeneratorHeaderWidget(
          text: 'orderedServices'.tr(),
        ),
        RaportsGeneratorToggleWidget(
          text: 'ropeSuspensionsIntalation'.tr(),
          isOn: ref.watch(raportGeneratorProvider).ropeSuspensionsIntalation,
          onToggle: (isOn) {
            ref
                .read(raportGeneratorProvider.notifier)
                .setRopeSuspensionsIntalation(isOn);
          },
        ),
        Container(
          height: 8,
        ),
        RaportsGeneratorToggleWidget(
          text: 'ropeSuspensionsUninstalation'.tr(),
          isOn: ref.watch(raportGeneratorProvider).ropeSuspensionsUninstalation,
          onToggle: (isOn) {
            ref
                .read(raportGeneratorProvider.notifier)
                .setRopeSuspensionsUninstalation(isOn);
          },
        ),
        Container(
          height: 8,
        ),
        RaportsGeneratorToggleWidget(
          text: 'otherServices'.tr(),
          isOn: ref.watch(raportGeneratorProvider).otherServices,
          onToggle: (isOn) {
            ref.read(raportGeneratorProvider.notifier).setOtherServices(isOn);
          },
        ),
        BorderedInput(
          initialValue:
              ref.watch(raportGeneratorProvider).otherServicesDescription,
          placeholder: "otherServicesDescription".tr(),
          maxLines: 3,
          onChanged: (value) {
            ref
                .read(raportGeneratorProvider.notifier)
                .setOtherServicesDescription(value ?? '');
          },
        ),
        BorderedInput(
          initialValue: ref.watch(raportGeneratorProvider).hall,
          placeholder: "hall".tr(),
          onChanged: (value) {
            ref.read(raportGeneratorProvider.notifier).setHall(value ?? '');
          },
        ),
        BorderedInput(
          initialValue: ref.watch(raportGeneratorProvider).stand,
          placeholder: "stand".tr(),
          onChanged: (value) {
            ref.read(raportGeneratorProvider.notifier).setStand(value ?? '');
          },
        ),
        BorderedInput(
          initialValue: ref.watch(raportGeneratorProvider).exhibitor,
          placeholder: "exhibitor".tr(),
          onChanged: (value) {
            ref
                .read(raportGeneratorProvider.notifier)
                .setExhibitor(value ?? '');
          },
        ),
        Row(
          children: [
            Expanded(
              child: SelectDateTimeButton(
                  exactDate: ref.watch(raportGeneratorProvider).completionTime,
                  headerText: "completionTime".tr(),
                  onDateAndTimeSelected: (date) {
                    ref
                        .read(raportGeneratorProvider.notifier)
                        .setCompletionTime(date);
                  }),
            ),
            Container(
              width: 10,
            ),
            Expanded(
              child: SelectDateTimeButton(
                  exactDate: ref.watch(raportGeneratorProvider).disassemblyDate,
                  headerText: "disassemblyStartTime".tr(),
                  onDateAndTimeSelected: (date) {
                    ref
                        .read(raportGeneratorProvider.notifier)
                        .setDisassemblyDate(date);
                  }),
            ),
          ],
        ),
      ],
    );
  }
}

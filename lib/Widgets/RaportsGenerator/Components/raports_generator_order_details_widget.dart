import 'package:bws_agreement_creator/Providers/get_raport_config_provider.dart';
import 'package:bws_agreement_creator/Widgets/Components/menu_button.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/Components/bordered_input.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/Components/select_date_button.dart';
import 'package:bws_agreement_creator/Widgets/RaportsGenerator/Components/raports_generator_header_widget.dart';
import 'package:bws_agreement_creator/Widgets/RaportsGenerator/Providers/raport_generator_provider.dart';
import 'package:bws_agreement_creator/utils/string_extensions.dart';
import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RaportsGeneratorOrderDetailsWidget extends ConsumerWidget {
  const RaportsGeneratorOrderDetailsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    final raport = ref.watch(raportGeneratorProvider);
    final raportConfig = ref.watch(getRaportConfigProvider).data!;

    return Column(children: [
      RaportsGeneratorHeaderWidget(
        text: 'orderDetails'.tr(),
      ),
      MenuButton(
          items: raportConfig.map((e) => e.location).toList(),
          dropdownValue: raport.location?.location.emptyAsNull(),
          header: "price/location".tr(),
          onChanged: (value) {
            final selectedLocation = raportConfig
                .firstWhereOrNull((element) => element.location == value);
            ref
                .read(raportGeneratorProvider.notifier)
                .setLocation(selectedLocation);
            ref.read(raportGeneratorProvider.notifier).setProjectManager('');
          }),
      Container(height: 8),
      MenuButton(
          items: raport.location?.managers ?? [],
          dropdownValue: raport.projectManager.emptyAsNull(),
          header: "Menadżer projektu",
          onChanged: (value) {
            ref
                .read(raportGeneratorProvider.notifier)
                .setProjectManager(value ?? '');
          }),
      BorderedInput(
        placeholder: "Targi",
        initialValue: raport.tradeFair,
        onChanged: (value) {
          ref.read(raportGeneratorProvider.notifier).setTradeFair(value ?? '');
        },
      ),
      Row(
        children: [
          Expanded(
            child: SelectDateButton(
                dateText: raport.startDate,
                headerText: "Data rozpoczęcia",
                onDateSelected: (date) {
                  ref.read(raportGeneratorProvider.notifier).setStartDate(date);
                }),
          ),
          Container(
            width: 10,
          ),
          Expanded(
            child: SelectDateButton(
                dateText: raport.endDate,
                headerText: "Data zakończenia",
                onDateSelected: (date) {
                  ref.read(raportGeneratorProvider.notifier).setEndDate(date);
                }),
          ),
        ],
      )
    ]);
  }
}

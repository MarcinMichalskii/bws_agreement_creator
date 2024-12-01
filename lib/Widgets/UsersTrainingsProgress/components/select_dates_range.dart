import 'package:bws_agreement_creator/Widgets/GenerateAgreement/Components/select_date_button.dart';
import 'package:bws_agreement_creator/Widgets/UsersTrainingsProgress/user_statistics_filter_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserStatisticsSelectDateRange extends HookConsumerWidget {
  const UserStatisticsSelectDateRange({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    final from = ref.watch(userStatisticsFilterProvider).fromDate;
    final to = ref.watch(userStatisticsFilterProvider).toDate;

    return Row(
      children: [
        Container(
            width: 160,
            margin: const EdgeInsets.only(right: 16),
            child: SelectDateButton(
                dateText: from,
                headerText: "",
                onDateSelected: (date) {
                  ref
                      .read(userStatisticsFilterProvider.notifier)
                      .updateFromDate(date);
                })),
        Container(
            width: 160,
            margin: const EdgeInsets.only(right: 16),
            child: SelectDateButton(
                dateText: to,
                headerText: "",
                onDateSelected: (date) {
                  ref
                      .read(userStatisticsFilterProvider.notifier)
                      .updateToDate(date);
                })),
      ],
    );
  }
}

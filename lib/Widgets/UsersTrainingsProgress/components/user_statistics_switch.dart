import 'package:bws_agreement_creator/Widgets/UsersTrainingsProgress/user_statistics_filter_provider.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserStatisticsSwitch extends HookConsumerWidget {
  const UserStatisticsSwitch({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Row(
        children: [
          const Text('Sortuj po ostatniej aktywności',
              style: TextStyle(color: CustomColors.gray)),
          const Spacer(),
          Container(
            margin: const EdgeInsets.only(left: 16),
            child: Switch(
              value: ref.watch(userStatisticsFilterProvider).sortByDate,
              activeTrackColor: CustomColors.applicationColorMain,
              onChanged: (value) {
                ref
                    .read(userStatisticsFilterProvider.notifier)
                    .toggleSortByDate();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class TurnFiltersOnSwitch extends HookConsumerWidget {
  const TurnFiltersOnSwitch({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Row(
        children: [
          const Text('Użyj filtrów',
              style: TextStyle(color: CustomColors.gray)),
          const Spacer(),
          Container(
            margin: const EdgeInsets.only(left: 16),
            child: Switch(
              value: ref.watch(userStatisticsFilterProvider).filtersOn,
              activeTrackColor: CustomColors.applicationColorMain,
              onChanged: (value) {
                ref
                    .read(userStatisticsFilterProvider.notifier)
                    .toggleFiltersOn();
              },
            ),
          ),
        ],
      ),
    );
  }
}

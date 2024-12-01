import 'package:bws_agreement_creator/Model/user_data.dart';
import 'package:bws_agreement_creator/Providers/get_chapters_provider.dart';
import 'package:bws_agreement_creator/Providers/get_users_provider.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/EmployeeForm/form_widget.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/Components/bordered_input.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/Components/touchable_opacity.dart';
import 'package:bws_agreement_creator/Widgets/UsersTrainingsProgress/user_statistics_cell.dart';
import 'package:bws_agreement_creator/Widgets/UsersTrainingsProgress/user_statistics_details_widget.dart';
import 'package:bws_agreement_creator/Widgets/UsersTrainingsProgress/user_statistics_filter_provider.dart';
import 'package:bws_agreement_creator/Widgets/UsersTrainingsProgress/user_statistics_filter_widget.dart';
import 'package:bws_agreement_creator/Widgets/app_scaffold.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:bws_agreement_creator/utils/date_extensions.dart';
import 'package:bws_agreement_creator/utils/use_build_effect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UsersStatisticsScaffold extends HookConsumerWidget {
  const UsersStatisticsScaffold({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final users = ref.watch(getUsersProvider).data ?? [];

    useBuildEffect(() {
      ref.read(getUsersProvider.notifier).getUsers();
      ref.read(getChaptersProvider.notifier).getChapters();
      return null;
    }, []);

    final filterText = useState('');
    final selectedChapters =
        ref.watch(userStatisticsFilterProvider).selectedChapters;
    final fromDate = ref.watch(userStatisticsFilterProvider).fromDate;
    final toDate = ref.watch(userStatisticsFilterProvider).toDate;
    final sortByDate = ref.watch(userStatisticsFilterProvider).sortByDate;

    final filteredUsers = users.where((user) {
      if (filterText.value.isEmpty) return true;
      return user.name.toLowerCase().contains(filterText.value.toLowerCase());
    }).where((user) {
      if (selectedChapters.isEmpty) return true;
      return user.passedChapterExams.any((chapter) =>
          selectedChapters.map((e) => e.id).contains(chapter.chapterId));
    }).where((user) {
      return user.passedChapterExams.any((chapter) {
        return chapter.date.isAfter(fromDate) && chapter.date.isBefore(toDate);
      });
    }).toList();

    filteredUsers.sort((a, b) {
      if (sortByDate) {
        return b.lastActivity.compareTo(a.lastActivity);
      } else {
        return a.name.compareTo(b.name);
      }
    });

    final showFilter = useCallback(() {
      showDialog(
          context: context,
          builder: (builder) {
            return const UserStatisticsFilterWidget();
          });
    }, []);

    final showDetails = useCallback((UserData user) {
      showDialog(
          context: context,
          builder: (builder) {
            return UserStatisticsDetailsWidget(
              user: user,
            );
          });
    }, []);

    final filtersOn = ref.watch(userStatisticsFilterProvider).filtersOn;
    final usersToMap = filtersOn ? filteredUsers : users;

    return AppScaffold(
      title: 'Postępy w szkoleniach',
      actions: [
        Container(
            margin: const EdgeInsets.fromLTRB(0, 8, 8, 0),
            child: TouchableOpacity(
                child: const Icon(Icons.filter_alt_outlined,
                    color: CustomColors.gray, size: 30),
                onTap: () {
                  showFilter();
                })),
        Container(
          margin: const EdgeInsets.only(right: 16),
          width: 200,
          child: BorderedInput(
            placeholder: 'Szukaj użytkownika',
            onChanged: (text) {
              filterText.value = text ?? '';
            },
          ),
        ),
      ],
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.topCenter,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...usersToMap.map((user) {
                return UserStatisticsCell(
                  name: user.name,
                  email: user.email,
                  finishedExams: user.passedChapterExams.length,
                  finishedQuizzes: user.passedVideoExams.length,
                  watchedVideos: user.completedVideos.length,
                  lastActivity: user.lastActivity.toReadableDate(),
                  onTap: () {
                    showDetails(user);
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:bws_agreement_creator/Providers/get_users_provider.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/EmployeeForm/form_widget.dart';
import 'package:bws_agreement_creator/Widgets/GenerateAgreement/components/bordered_input.dart';
import 'package:bws_agreement_creator/Widgets/UsersTrainingsProgress/user_statistics_cell.dart';
import 'package:bws_agreement_creator/Widgets/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UsersStatisticsScaffold extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, ref) {
    final users = ref.watch(getUsersProvider).data ?? [];
    useBuildEffect(() {
      ref.read(getUsersProvider.notifier).getUsers();
    }, []);

    final filterText = useState('');
    final filteredUsers = users.where((user) {
      if (filterText.value.isEmpty) return true;
      return user.name.toLowerCase().contains(filterText.value.toLowerCase());
    }).toList();

    return AppScaffold(
      title: 'Postępy w szkoleniach',
      actions: [
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
              ...filteredUsers.map((user) {
                return UserStatisticsCell(
                  name: user.name,
                  email: user.email,
                  finishedExams: user.passedChapterExams.length,
                  finishedQuizzes: user.passedVideoExams.length,
                  watchedVideos: user.completedVideos.length,
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}

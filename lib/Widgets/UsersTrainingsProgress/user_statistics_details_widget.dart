import 'package:bws_agreement_creator/Model/user_data.dart';
import 'package:bws_agreement_creator/Providers/get_chapters_provider.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:bws_agreement_creator/utils/date_extensions.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserStatisticsDetailsWidget extends HookConsumerWidget {
  const UserStatisticsDetailsWidget({
    super.key,
    required this.user,
  });

  final UserData user;

  @override
  Widget build(BuildContext context, ref) {
    return Dialog(
      backgroundColor: CustomColors.almostBlack3,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Text(
                'Zaliczone egzaminy',
                style: TextStyle(color: CustomColors.gray, fontSize: 20),
              ),
            ),
            ...user.passedChapterExams.map((exam) {
              return PassedExamRowWidget(
                examName: ref
                        .read(getChaptersProvider.notifier)
                        .getChapterForId(exam.chapterId)
                        ?.name ??
                    '',
                date: exam.date.toReadableDate(),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}

class PassedExamRowWidget extends HookConsumerWidget {
  const PassedExamRowWidget({
    super.key,
    required this.examName,
    required this.date,
  });

  final String examName;
  final String date;

  @override
  Widget build(BuildContext context, ref) {
    return Row(
      children: [
        const Icon(
          Icons.workspace_premium_outlined,
          color: CustomColors.applicationColorMain,
          size: 30,
        ),
        const SizedBox(width: 4.0),
        Text(
          examName,
          style: const TextStyle(fontSize: 14, color: CustomColors.gray),
        ),
        const Spacer(),
        Text(
          date,
          style: const TextStyle(fontSize: 12, color: CustomColors.gray),
        ),
      ],
    );
  }
}

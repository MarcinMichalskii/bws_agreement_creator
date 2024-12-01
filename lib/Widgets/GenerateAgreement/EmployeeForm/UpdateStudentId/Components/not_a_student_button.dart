import 'package:bws_agreement_creator/Providers/mark_not_a_student.dart';
import 'package:bws_agreement_creator/Providers/update_student_id_provider.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotAStudentButton extends HookConsumerWidget {
  const NotAStudentButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: TextButton(
        onPressed: () {
          ref.read(updateStudentIdProvider.notifier).updateStudentId("");
          ref.read(markNotAStudentProvider.notifier).markNotAStudent();
        },
        child: const Text(
          "Nie jestem studentem",
          style: TextStyle(
              color: CustomColors.red,
              fontSize: 16,
              decoration: TextDecoration.underline),
        ),
      ),
    );
  }
}

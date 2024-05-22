import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/material.dart';

enum ExamAccessState { passed, notPassed, cannotStart }

extension ExamAccessStateExtension on ExamAccessState {
  static ExamAccessState getExamAccessState(
      bool chapterPassed, bool canStartExamine) {
    if (chapterPassed) {
      return ExamAccessState.passed;
    } else if (canStartExamine) {
      return ExamAccessState.notPassed;
    } else {
      return ExamAccessState.cannotStart;
    }
  }

  String get buttonText {
    switch (this) {
      case ExamAccessState.passed:
        return 'Sprawdź się ponownie';
      case ExamAccessState.notPassed:
        return 'Rozpocznij test';
      case ExamAccessState.cannotStart:
        return 'Aby rozpocząć test, musisz najpierw obejrzeć wszystkie filmy';
    }
  }

  Color get buttonColor {
    switch (this) {
      case ExamAccessState.passed:
        return CustomColors.green;
      case ExamAccessState.notPassed:
        return CustomColors.applicationColorMain;
      case ExamAccessState.cannotStart:
        return CustomColors.gray;
    }
  }
}

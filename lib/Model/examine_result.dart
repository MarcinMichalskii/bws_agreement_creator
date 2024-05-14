import 'package:copy_with_extension/copy_with_extension.dart';

@CopyWith()
class ExamineResultData {
  final bool passed;
  final int correctAnswers;
  ExamineResultData({required this.passed, required this.correctAnswers});

  factory ExamineResultData.fromJson(Map<String, dynamic> json) {
    return ExamineResultData(
      passed: json['passed'],
      correctAnswers: json['correctAnswers'],
    );
  }
}

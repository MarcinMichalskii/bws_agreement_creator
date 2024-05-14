import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';
part 'answer_draft.g.dart';

//@copy with
@CopyWith()
class AnswerDraft {
  final String text;
  final bool isCorrect;
  final String id = UniqueKey().toString();

  AnswerDraft({required this.text, required this.isCorrect});
}

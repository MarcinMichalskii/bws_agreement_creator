// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter_question_data.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$QuestionDataCWProxy {
  QuestionData id(String id);

  QuestionData questionText(String questionText);

  QuestionData answers(List<String> answers);

  QuestionData chapterId(String chapterId);

  QuestionData correctAnswer(String correctAnswer);

  QuestionData videos(List<String> videos);

  QuestionData passed(bool passed);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `QuestionData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// QuestionData(...).copyWith(id: 12, name: "My name")
  /// ````
  QuestionData call({
    String? id,
    String? questionText,
    List<String>? answers,
    String? chapterId,
    String? correctAnswer,
    List<String>? videos,
    bool? passed,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfQuestionData.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfQuestionData.copyWith.fieldName(...)`
class _$QuestionDataCWProxyImpl implements _$QuestionDataCWProxy {
  const _$QuestionDataCWProxyImpl(this._value);

  final QuestionData _value;

  @override
  QuestionData id(String id) => this(id: id);

  @override
  QuestionData questionText(String questionText) =>
      this(questionText: questionText);

  @override
  QuestionData answers(List<String> answers) => this(answers: answers);

  @override
  QuestionData chapterId(String chapterId) => this(chapterId: chapterId);

  @override
  QuestionData correctAnswer(String correctAnswer) =>
      this(correctAnswer: correctAnswer);

  @override
  QuestionData videos(List<String> videos) => this(videos: videos);

  @override
  QuestionData passed(bool passed) => this(passed: passed);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `QuestionData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// QuestionData(...).copyWith(id: 12, name: "My name")
  /// ````
  QuestionData call({
    Object? id = const $CopyWithPlaceholder(),
    Object? questionText = const $CopyWithPlaceholder(),
    Object? answers = const $CopyWithPlaceholder(),
    Object? chapterId = const $CopyWithPlaceholder(),
    Object? correctAnswer = const $CopyWithPlaceholder(),
    Object? videos = const $CopyWithPlaceholder(),
    Object? passed = const $CopyWithPlaceholder(),
  }) {
    return QuestionData(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      questionText:
          questionText == const $CopyWithPlaceholder() || questionText == null
              ? _value.questionText
              // ignore: cast_nullable_to_non_nullable
              : questionText as String,
      answers: answers == const $CopyWithPlaceholder() || answers == null
          ? _value.answers
          // ignore: cast_nullable_to_non_nullable
          : answers as List<String>,
      chapterId: chapterId == const $CopyWithPlaceholder() || chapterId == null
          ? _value.chapterId
          // ignore: cast_nullable_to_non_nullable
          : chapterId as String,
      correctAnswer:
          correctAnswer == const $CopyWithPlaceholder() || correctAnswer == null
              ? _value.correctAnswer
              // ignore: cast_nullable_to_non_nullable
              : correctAnswer as String,
      videos: videos == const $CopyWithPlaceholder() || videos == null
          ? _value.videos
          // ignore: cast_nullable_to_non_nullable
          : videos as List<String>,
      passed: passed == const $CopyWithPlaceholder() || passed == null
          ? _value.passed
          // ignore: cast_nullable_to_non_nullable
          : passed as bool,
    );
  }
}

extension $QuestionDataCopyWith on QuestionData {
  /// Returns a callable class that can be used as follows: `instanceOfQuestionData.copyWith(...)` or like so:`instanceOfQuestionData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$QuestionDataCWProxy get copyWith => _$QuestionDataCWProxyImpl(this);
}

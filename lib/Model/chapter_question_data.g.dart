// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter_question_data.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ChapterQuestionDataCWProxy {
  ChapterQuestionData answers(List<String> answers);

  ChapterQuestionData chapterId(String chapterId);

  ChapterQuestionData correctAnswer(String correctAnswer);

  ChapterQuestionData id(String id);

  ChapterQuestionData passed(bool passed);

  ChapterQuestionData questionText(String questionText);

  ChapterQuestionData videos(List<String> videos);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ChapterQuestionData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ChapterQuestionData(...).copyWith(id: 12, name: "My name")
  /// ````
  ChapterQuestionData call({
    List<String>? answers,
    String? chapterId,
    String? correctAnswer,
    String? id,
    bool? passed,
    String? questionText,
    List<String>? videos,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfChapterQuestionData.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfChapterQuestionData.copyWith.fieldName(...)`
class _$ChapterQuestionDataCWProxyImpl implements _$ChapterQuestionDataCWProxy {
  final ChapterQuestionData _value;

  const _$ChapterQuestionDataCWProxyImpl(this._value);

  @override
  ChapterQuestionData answers(List<String> answers) => this(answers: answers);

  @override
  ChapterQuestionData chapterId(String chapterId) => this(chapterId: chapterId);

  @override
  ChapterQuestionData correctAnswer(String correctAnswer) =>
      this(correctAnswer: correctAnswer);

  @override
  ChapterQuestionData id(String id) => this(id: id);

  @override
  ChapterQuestionData passed(bool passed) => this(passed: passed);

  @override
  ChapterQuestionData questionText(String questionText) =>
      this(questionText: questionText);

  @override
  ChapterQuestionData videos(List<String> videos) => this(videos: videos);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ChapterQuestionData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ChapterQuestionData(...).copyWith(id: 12, name: "My name")
  /// ````
  ChapterQuestionData call({
    Object? answers = const $CopyWithPlaceholder(),
    Object? chapterId = const $CopyWithPlaceholder(),
    Object? correctAnswer = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? passed = const $CopyWithPlaceholder(),
    Object? questionText = const $CopyWithPlaceholder(),
    Object? videos = const $CopyWithPlaceholder(),
  }) {
    return ChapterQuestionData(
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
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      passed: passed == const $CopyWithPlaceholder() || passed == null
          ? _value.passed
          // ignore: cast_nullable_to_non_nullable
          : passed as bool,
      questionText:
          questionText == const $CopyWithPlaceholder() || questionText == null
              ? _value.questionText
              // ignore: cast_nullable_to_non_nullable
              : questionText as String,
      videos: videos == const $CopyWithPlaceholder() || videos == null
          ? _value.videos
          // ignore: cast_nullable_to_non_nullable
          : videos as List<String>,
    );
  }
}

extension $ChapterQuestionDataCopyWith on ChapterQuestionData {
  /// Returns a callable class that can be used as follows: `instanceOfChapterQuestionData.copyWith(...)` or like so:`instanceOfChapterQuestionData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ChapterQuestionDataCWProxy get copyWith =>
      _$ChapterQuestionDataCWProxyImpl(this);
}

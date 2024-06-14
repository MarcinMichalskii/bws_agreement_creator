// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_chapter_question_data.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AddChapterQuestionDataCWProxy {
  AddChapterQuestionData answers(List<String> answers);

  AddChapterQuestionData chapterId(String chapterId);

  AddChapterQuestionData correctAnswer(String correctAnswer);

  AddChapterQuestionData questionText(String questionText);

  AddChapterQuestionData videos(List<String> videos);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AddChapterQuestionData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AddChapterQuestionData(...).copyWith(id: 12, name: "My name")
  /// ````
  AddChapterQuestionData call({
    List<String>? answers,
    String? chapterId,
    String? correctAnswer,
    String? questionText,
    List<String>? videos,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAddChapterQuestionData.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAddChapterQuestionData.copyWith.fieldName(...)`
class _$AddChapterQuestionDataCWProxyImpl
    implements _$AddChapterQuestionDataCWProxy {
  final AddChapterQuestionData _value;

  const _$AddChapterQuestionDataCWProxyImpl(this._value);

  @override
  AddChapterQuestionData answers(List<String> answers) =>
      this(answers: answers);

  @override
  AddChapterQuestionData chapterId(String chapterId) =>
      this(chapterId: chapterId);

  @override
  AddChapterQuestionData correctAnswer(String correctAnswer) =>
      this(correctAnswer: correctAnswer);

  @override
  AddChapterQuestionData questionText(String questionText) =>
      this(questionText: questionText);

  @override
  AddChapterQuestionData videos(List<String> videos) => this(videos: videos);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AddChapterQuestionData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AddChapterQuestionData(...).copyWith(id: 12, name: "My name")
  /// ````
  AddChapterQuestionData call({
    Object? answers = const $CopyWithPlaceholder(),
    Object? chapterId = const $CopyWithPlaceholder(),
    Object? correctAnswer = const $CopyWithPlaceholder(),
    Object? questionText = const $CopyWithPlaceholder(),
    Object? videos = const $CopyWithPlaceholder(),
  }) {
    return AddChapterQuestionData(
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

extension $AddChapterQuestionDataCopyWith on AddChapterQuestionData {
  /// Returns a callable class that can be used as follows: `instanceOfAddChapterQuestionData.copyWith(...)` or like so:`instanceOfAddChapterQuestionData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AddChapterQuestionDataCWProxy get copyWith =>
      _$AddChapterQuestionDataCWProxyImpl(this);
}

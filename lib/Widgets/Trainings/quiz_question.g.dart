// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_question.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$QuizQuestionCWProxy {
  QuizQuestion markedAnswer(String? markedAnswer);

  QuizQuestion question(ChapterQuestionData question);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `QuizQuestion(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// QuizQuestion(...).copyWith(id: 12, name: "My name")
  /// ````
  QuizQuestion call({
    String? markedAnswer,
    ChapterQuestionData? question,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfQuizQuestion.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfQuizQuestion.copyWith.fieldName(...)`
class _$QuizQuestionCWProxyImpl implements _$QuizQuestionCWProxy {
  final QuizQuestion _value;

  const _$QuizQuestionCWProxyImpl(this._value);

  @override
  QuizQuestion markedAnswer(String? markedAnswer) =>
      this(markedAnswer: markedAnswer);

  @override
  QuizQuestion question(ChapterQuestionData question) =>
      this(question: question);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `QuizQuestion(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// QuizQuestion(...).copyWith(id: 12, name: "My name")
  /// ````
  QuizQuestion call({
    Object? markedAnswer = const $CopyWithPlaceholder(),
    Object? question = const $CopyWithPlaceholder(),
  }) {
    return QuizQuestion(
      markedAnswer: markedAnswer == const $CopyWithPlaceholder()
          ? _value.markedAnswer
          // ignore: cast_nullable_to_non_nullable
          : markedAnswer as String?,
      question: question == const $CopyWithPlaceholder() || question == null
          ? _value.question
          // ignore: cast_nullable_to_non_nullable
          : question as ChapterQuestionData,
    );
  }
}

extension $QuizQuestionCopyWith on QuizQuestion {
  /// Returns a callable class that can be used as follows: `instanceOfQuizQuestion.copyWith(...)` or like so:`instanceOfQuizQuestion.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$QuizQuestionCWProxy get copyWith => _$QuizQuestionCWProxyImpl(this);
}

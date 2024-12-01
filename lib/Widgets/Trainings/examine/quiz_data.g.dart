// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_data.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$QuizDataCWProxy {
  QuizData questions(List<QuizQuestion> questions);

  QuizData selectedIndex(int selectedIndex);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `QuizData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// QuizData(...).copyWith(id: 12, name: "My name")
  /// ````
  QuizData call({
    List<QuizQuestion>? questions,
    int? selectedIndex,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfQuizData.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfQuizData.copyWith.fieldName(...)`
class _$QuizDataCWProxyImpl implements _$QuizDataCWProxy {
  const _$QuizDataCWProxyImpl(this._value);

  final QuizData _value;

  @override
  QuizData questions(List<QuizQuestion> questions) =>
      this(questions: questions);

  @override
  QuizData selectedIndex(int selectedIndex) =>
      this(selectedIndex: selectedIndex);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `QuizData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// QuizData(...).copyWith(id: 12, name: "My name")
  /// ````
  QuizData call({
    Object? questions = const $CopyWithPlaceholder(),
    Object? selectedIndex = const $CopyWithPlaceholder(),
  }) {
    return QuizData(
      questions: questions == const $CopyWithPlaceholder() || questions == null
          ? _value.questions
          // ignore: cast_nullable_to_non_nullable
          : questions as List<QuizQuestion>,
      selectedIndex:
          selectedIndex == const $CopyWithPlaceholder() || selectedIndex == null
              ? _value.selectedIndex
              // ignore: cast_nullable_to_non_nullable
              : selectedIndex as int,
    );
  }
}

extension $QuizDataCopyWith on QuizData {
  /// Returns a callable class that can be used as follows: `instanceOfQuizData.copyWith(...)` or like so:`instanceOfQuizData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$QuizDataCWProxy get copyWith => _$QuizDataCWProxyImpl(this);
}

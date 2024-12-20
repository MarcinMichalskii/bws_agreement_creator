// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer_draft.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AnswerDraftCWProxy {
  AnswerDraft text(String text);

  AnswerDraft isCorrect(bool isCorrect);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AnswerDraft(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AnswerDraft(...).copyWith(id: 12, name: "My name")
  /// ````
  AnswerDraft call({
    String? text,
    bool? isCorrect,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAnswerDraft.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAnswerDraft.copyWith.fieldName(...)`
class _$AnswerDraftCWProxyImpl implements _$AnswerDraftCWProxy {
  const _$AnswerDraftCWProxyImpl(this._value);

  final AnswerDraft _value;

  @override
  AnswerDraft text(String text) => this(text: text);

  @override
  AnswerDraft isCorrect(bool isCorrect) => this(isCorrect: isCorrect);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AnswerDraft(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AnswerDraft(...).copyWith(id: 12, name: "My name")
  /// ````
  AnswerDraft call({
    Object? text = const $CopyWithPlaceholder(),
    Object? isCorrect = const $CopyWithPlaceholder(),
  }) {
    return AnswerDraft(
      text: text == const $CopyWithPlaceholder() || text == null
          ? _value.text
          // ignore: cast_nullable_to_non_nullable
          : text as String,
      isCorrect: isCorrect == const $CopyWithPlaceholder() || isCorrect == null
          ? _value.isCorrect
          // ignore: cast_nullable_to_non_nullable
          : isCorrect as bool,
    );
  }
}

extension $AnswerDraftCopyWith on AnswerDraft {
  /// Returns a callable class that can be used as follows: `instanceOfAnswerDraft.copyWith(...)` or like so:`instanceOfAnswerDraft.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AnswerDraftCWProxy get copyWith => _$AnswerDraftCWProxyImpl(this);
}

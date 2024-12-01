// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'finished_chapter_data.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$FinishedChapterDataCWProxy {
  FinishedChapterData chapterId(String chapterId);

  FinishedChapterData date(DateTime date);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FinishedChapterData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FinishedChapterData(...).copyWith(id: 12, name: "My name")
  /// ````
  FinishedChapterData call({
    String? chapterId,
    DateTime? date,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfFinishedChapterData.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfFinishedChapterData.copyWith.fieldName(...)`
class _$FinishedChapterDataCWProxyImpl implements _$FinishedChapterDataCWProxy {
  const _$FinishedChapterDataCWProxyImpl(this._value);

  final FinishedChapterData _value;

  @override
  FinishedChapterData chapterId(String chapterId) => this(chapterId: chapterId);

  @override
  FinishedChapterData date(DateTime date) => this(date: date);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `FinishedChapterData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// FinishedChapterData(...).copyWith(id: 12, name: "My name")
  /// ````
  FinishedChapterData call({
    Object? chapterId = const $CopyWithPlaceholder(),
    Object? date = const $CopyWithPlaceholder(),
  }) {
    return FinishedChapterData(
      chapterId: chapterId == const $CopyWithPlaceholder() || chapterId == null
          ? _value.chapterId
          // ignore: cast_nullable_to_non_nullable
          : chapterId as String,
      date: date == const $CopyWithPlaceholder() || date == null
          ? _value.date
          // ignore: cast_nullable_to_non_nullable
          : date as DateTime,
    );
  }
}

extension $FinishedChapterDataCopyWith on FinishedChapterData {
  /// Returns a callable class that can be used as follows: `instanceOfFinishedChapterData.copyWith(...)` or like so:`instanceOfFinishedChapterData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FinishedChapterDataCWProxy get copyWith =>
      _$FinishedChapterDataCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FinishedChapterData _$FinishedChapterDataFromJson(Map<String, dynamic> json) =>
    FinishedChapterData(
      chapterId: json['chapterId'] as String,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$FinishedChapterDataToJson(
        FinishedChapterData instance) =>
    <String, dynamic>{
      'chapterId': instance.chapterId,
      'date': instance.date.toIso8601String(),
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exact_date.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ExactDateCWProxy {
  ExactDate date(DateTime date);

  ExactDate time(TimeOfDay time);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ExactDate(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ExactDate(...).copyWith(id: 12, name: "My name")
  /// ````
  ExactDate call({
    DateTime? date,
    TimeOfDay? time,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfExactDate.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfExactDate.copyWith.fieldName(...)`
class _$ExactDateCWProxyImpl implements _$ExactDateCWProxy {
  const _$ExactDateCWProxyImpl(this._value);

  final ExactDate _value;

  @override
  ExactDate date(DateTime date) => this(date: date);

  @override
  ExactDate time(TimeOfDay time) => this(time: time);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ExactDate(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ExactDate(...).copyWith(id: 12, name: "My name")
  /// ````
  ExactDate call({
    Object? date = const $CopyWithPlaceholder(),
    Object? time = const $CopyWithPlaceholder(),
  }) {
    return ExactDate(
      date == const $CopyWithPlaceholder() || date == null
          ? _value.date
          // ignore: cast_nullable_to_non_nullable
          : date as DateTime,
      time == const $CopyWithPlaceholder() || time == null
          ? _value.time
          // ignore: cast_nullable_to_non_nullable
          : time as TimeOfDay,
    );
  }
}

extension $ExactDateCopyWith on ExactDate {
  /// Returns a callable class that can be used as follows: `instanceOfExactDate.copyWith(...)` or like so:`instanceOfExactDate.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ExactDateCWProxy get copyWith => _$ExactDateCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExactDate _$ExactDateFromJson(Map<String, dynamic> json) => ExactDate(
      DateTime.parse(json['date'] as String),
      ExactDate._timeOfDayFromJson(json['time'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ExactDateToJson(ExactDate instance) => <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'time': ExactDate._timeOfDayToJson(instance.time),
    };

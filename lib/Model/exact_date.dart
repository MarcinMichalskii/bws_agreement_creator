import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
part 'exact_date.g.dart';

@JsonSerializable()
@CopyWith()
class ExactDate {
  final DateTime date;
  @JsonKey(
      fromJson: ExactDate._timeOfDayFromJson,
      toJson: ExactDate._timeOfDayToJson)
  final TimeOfDay time;

  ExactDate(this.date, this.time);

  factory ExactDate.fromJson(Map<String, dynamic> json) =>
      _$ExactDateFromJson(json);

  Map<String, dynamic> toJson() => _$ExactDateToJson(this);

  static Map<String, int> _timeOfDayToJson(TimeOfDay time) =>
      {'hour': time.hour, 'minute': time.minute};

  static TimeOfDay _timeOfDayFromJson(Map<String, dynamic> json) =>
      TimeOfDay(hour: json['hour'] as int, minute: json['minute'] as int);

  String toReadableDate() {
    return '${date.day.toString().padLeft(2, '0')}.${date.month.toString().padLeft(2, '0')}.${date.year.toString().padLeft(4, '0')} ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
  }
}

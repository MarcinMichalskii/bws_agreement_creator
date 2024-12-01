// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_statistics_filter_provider.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UserStatisticsFilterStateCWProxy {
  UserStatisticsFilterState fromDate(DateTime fromDate);

  UserStatisticsFilterState toDate(DateTime toDate);

  UserStatisticsFilterState selectedChapters(
      List<ChapterData> selectedChapters);

  UserStatisticsFilterState sortByDate(bool sortByDate);

  UserStatisticsFilterState filtersOn(bool filtersOn);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UserStatisticsFilterState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UserStatisticsFilterState(...).copyWith(id: 12, name: "My name")
  /// ````
  UserStatisticsFilterState call({
    DateTime? fromDate,
    DateTime? toDate,
    List<ChapterData>? selectedChapters,
    bool? sortByDate,
    bool? filtersOn,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfUserStatisticsFilterState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfUserStatisticsFilterState.copyWith.fieldName(...)`
class _$UserStatisticsFilterStateCWProxyImpl
    implements _$UserStatisticsFilterStateCWProxy {
  const _$UserStatisticsFilterStateCWProxyImpl(this._value);

  final UserStatisticsFilterState _value;

  @override
  UserStatisticsFilterState fromDate(DateTime fromDate) =>
      this(fromDate: fromDate);

  @override
  UserStatisticsFilterState toDate(DateTime toDate) => this(toDate: toDate);

  @override
  UserStatisticsFilterState selectedChapters(
          List<ChapterData> selectedChapters) =>
      this(selectedChapters: selectedChapters);

  @override
  UserStatisticsFilterState sortByDate(bool sortByDate) =>
      this(sortByDate: sortByDate);

  @override
  UserStatisticsFilterState filtersOn(bool filtersOn) =>
      this(filtersOn: filtersOn);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UserStatisticsFilterState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UserStatisticsFilterState(...).copyWith(id: 12, name: "My name")
  /// ````
  UserStatisticsFilterState call({
    Object? fromDate = const $CopyWithPlaceholder(),
    Object? toDate = const $CopyWithPlaceholder(),
    Object? selectedChapters = const $CopyWithPlaceholder(),
    Object? sortByDate = const $CopyWithPlaceholder(),
    Object? filtersOn = const $CopyWithPlaceholder(),
  }) {
    return UserStatisticsFilterState(
      fromDate: fromDate == const $CopyWithPlaceholder() || fromDate == null
          ? _value.fromDate
          // ignore: cast_nullable_to_non_nullable
          : fromDate as DateTime,
      toDate: toDate == const $CopyWithPlaceholder() || toDate == null
          ? _value.toDate
          // ignore: cast_nullable_to_non_nullable
          : toDate as DateTime,
      selectedChapters: selectedChapters == const $CopyWithPlaceholder() ||
              selectedChapters == null
          ? _value.selectedChapters
          // ignore: cast_nullable_to_non_nullable
          : selectedChapters as List<ChapterData>,
      sortByDate:
          sortByDate == const $CopyWithPlaceholder() || sortByDate == null
              ? _value.sortByDate
              // ignore: cast_nullable_to_non_nullable
              : sortByDate as bool,
      filtersOn: filtersOn == const $CopyWithPlaceholder() || filtersOn == null
          ? _value.filtersOn
          // ignore: cast_nullable_to_non_nullable
          : filtersOn as bool,
    );
  }
}

extension $UserStatisticsFilterStateCopyWith on UserStatisticsFilterState {
  /// Returns a callable class that can be used as follows: `instanceOfUserStatisticsFilterState.copyWith(...)` or like so:`instanceOfUserStatisticsFilterState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$UserStatisticsFilterStateCWProxy get copyWith =>
      _$UserStatisticsFilterStateCWProxyImpl(this);
}

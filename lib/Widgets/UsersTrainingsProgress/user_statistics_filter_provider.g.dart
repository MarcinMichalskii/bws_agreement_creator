// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_statistics_filter_provider.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UserStatisticsFilterStateCWProxy {
  UserStatisticsFilterState filtersOn(bool filtersOn);

  UserStatisticsFilterState fromDate(DateTime fromDate);

  UserStatisticsFilterState selectedChapters(
      List<ChapterData> selectedChapters);

  UserStatisticsFilterState sortByDate(bool sortByDate);

  UserStatisticsFilterState toDate(DateTime toDate);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UserStatisticsFilterState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UserStatisticsFilterState(...).copyWith(id: 12, name: "My name")
  /// ````
  UserStatisticsFilterState call({
    bool? filtersOn,
    DateTime? fromDate,
    List<ChapterData>? selectedChapters,
    bool? sortByDate,
    DateTime? toDate,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfUserStatisticsFilterState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfUserStatisticsFilterState.copyWith.fieldName(...)`
class _$UserStatisticsFilterStateCWProxyImpl
    implements _$UserStatisticsFilterStateCWProxy {
  final UserStatisticsFilterState _value;

  const _$UserStatisticsFilterStateCWProxyImpl(this._value);

  @override
  UserStatisticsFilterState filtersOn(bool filtersOn) =>
      this(filtersOn: filtersOn);

  @override
  UserStatisticsFilterState fromDate(DateTime fromDate) =>
      this(fromDate: fromDate);

  @override
  UserStatisticsFilterState selectedChapters(
          List<ChapterData> selectedChapters) =>
      this(selectedChapters: selectedChapters);

  @override
  UserStatisticsFilterState sortByDate(bool sortByDate) =>
      this(sortByDate: sortByDate);

  @override
  UserStatisticsFilterState toDate(DateTime toDate) => this(toDate: toDate);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UserStatisticsFilterState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UserStatisticsFilterState(...).copyWith(id: 12, name: "My name")
  /// ````
  UserStatisticsFilterState call({
    Object? filtersOn = const $CopyWithPlaceholder(),
    Object? fromDate = const $CopyWithPlaceholder(),
    Object? selectedChapters = const $CopyWithPlaceholder(),
    Object? sortByDate = const $CopyWithPlaceholder(),
    Object? toDate = const $CopyWithPlaceholder(),
  }) {
    return UserStatisticsFilterState(
      filtersOn: filtersOn == const $CopyWithPlaceholder() || filtersOn == null
          ? _value.filtersOn
          // ignore: cast_nullable_to_non_nullable
          : filtersOn as bool,
      fromDate: fromDate == const $CopyWithPlaceholder() || fromDate == null
          ? _value.fromDate
          // ignore: cast_nullable_to_non_nullable
          : fromDate as DateTime,
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
      toDate: toDate == const $CopyWithPlaceholder() || toDate == null
          ? _value.toDate
          // ignore: cast_nullable_to_non_nullable
          : toDate as DateTime,
    );
  }
}

extension $UserStatisticsFilterStateCopyWith on UserStatisticsFilterState {
  /// Returns a callable class that can be used as follows: `instanceOfUserStatisticsFilterState.copyWith(...)` or like so:`instanceOfUserStatisticsFilterState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$UserStatisticsFilterStateCWProxy get copyWith =>
      _$UserStatisticsFilterStateCWProxyImpl(this);
}

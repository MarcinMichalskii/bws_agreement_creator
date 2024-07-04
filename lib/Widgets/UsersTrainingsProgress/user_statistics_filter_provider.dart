import 'package:bws_agreement_creator/Model/chapter_data.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
part 'user_statistics_filter_provider.g.dart';

@CopyWith()
class UserStatisticsFilterState {
  final DateTime fromDate;
  final DateTime toDate;
  final List<ChapterData> selectedChapters;
  final bool sortByDate;
  final bool filtersOn;

  UserStatisticsFilterState({
    required this.fromDate,
    required this.toDate,
    required this.selectedChapters,
    required this.sortByDate,
    this.filtersOn = false,
  });
}

class UserStatisticsFilterNotifier
    extends StateNotifier<UserStatisticsFilterState> {
  UserStatisticsFilterNotifier()
      : super(
          UserStatisticsFilterState(
            fromDate: DateTime.now().subtract(const Duration(days: 30)),
            toDate: DateTime.now(),
            selectedChapters: [],
            sortByDate: false,
          ),
        );

  void updateFromDate(DateTime newDate) {
    state = state.copyWith(fromDate: newDate);
  }

  void updateToDate(DateTime newDate) {
    state = state.copyWith(toDate: newDate);
  }

  void updateSelectedChapters(List<ChapterData> newChapters) {
    state = state.copyWith(selectedChapters: newChapters);
  }

  void toggleSortByDate() {
    state = state.copyWith(sortByDate: !state.sortByDate);
  }

  void toggleFiltersOn() {
    state = state.copyWith(filtersOn: !state.filtersOn);
  }
}

final userStatisticsFilterProvider = StateNotifierProvider<
    UserStatisticsFilterNotifier, UserStatisticsFilterState>(
  (ref) => UserStatisticsFilterNotifier(),
);

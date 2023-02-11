import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/advanced_search_type_enum.dart';
import '../../models/advanced_search_view_model.dart';
import '../../views/advance_list_view.dart';

class PaginationList<T> {
  RxList<AdvancedSearchViewModel> filterChipsList =
      <AdvancedSearchViewModel>[].obs;

  int paginationOffset = 0;
  RxBool hasMoreData = true.obs;
  RxBool showError = false.obs;

  RxList<T> list = <T>[].obs;
  GlobalKey<AdvanceListViewState<T>> key = GlobalKey<AdvanceListViewState<T>>();
  int limit;

  PaginationList({this.limit = 15}) {
    filterChipsList.add(AdvancedSearchViewModel(
      type: AdvancedSearchType.limit,
      key: 'limit',
      startValue: '$limit',
      show: false,
    ));
  }

  void removeFilter(final String key) {
    filterChipsList().removeWhere((final element) => element.key == key);
  }

  void removeFilters(final List<String> keys) {
    filterChipsList.removeWhere((final element) => keys.contains(element.key));
  }

  void onPageLoaded(final int totalItemsCount) {
    paginationOffset++;
    if (totalItemsCount == list.length) {
      hasMoreData.value = false;
    }
  }

  bool get isFirstPage => paginationOffset == 0;

  String get query {
    removeFilter('offset');
    removeFilter('limit');

    filterChipsList().add(AdvancedSearchViewModel(
      type: AdvancedSearchType.offset,
      key: 'offset',
      startValue: paginationOffset.toString(),
      show: false,
    ));
    filterChipsList.add(AdvancedSearchViewModel(
      type: AdvancedSearchType.limit,
      key: 'limit',
      startValue: '$limit',
      show: false,
    ));
    return generateQuery(filterChipsList());
  }

  static String generateQuery(
    final List<AdvancedSearchViewModel> chipsList,
  ) {
    final List<String> query = [];
    for (final chip in chipsList) {
      if (chip.type == AdvancedSearchType.range) {
        if (chip.startValue != null && chip.startValue!.trim() != '') {
          query.add('${chip.key} GreaterThanEqual ${chip.startValue}');
        }
        if (chip.endValue != null && chip.endValue!.trim() != '') {
          query.add('${chip.key} lessThanOrEqual ${chip.endValue}');
        }
      } else {
        query.add('${chip.key}=${chip.startValue}');
      }
    }
    return '?${query.join('&')}';
  }
}

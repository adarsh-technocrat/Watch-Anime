import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_anime/bloc/search_page_state.dart';
import 'package:watch_anime/model/search_data_model.dart';
import 'package:watch_anime/service/search_anime.dart';

class SearchPageCubit extends Cubit<SearchPageState> {
  SearchPageCubit()
      : super(
          SearchPageState(
              searchDataModel: SearchDataModel(),
              showLoading: false,
              searchedQuery: ""),
        );

  SearchService searchService = SearchService();

  Timer? _debouncing;

  onSearchChange(String newSearch, String oldSearch) {
    if (_debouncing?.isActive ?? false) _debouncing?.cancel();
    _debouncing = Timer(const Duration(milliseconds: 500), () {
      if (newSearch != oldSearch) {
        getSearchQueryData(newSearch.toString());
        emit(state.copyWith(searchedQuery: newSearch));
      }
    });
  }

  Future<SearchDataModel> getSearchQueryData(String query) async {
    showLoading(true);
    var searchModel = await searchService.getSearchData(query);
    showLoading(false);
    emit(state.copyWith(searchDataModel: searchModel, showLoading: false));
    return searchModel;
  }

  showLoading(bool loading) {
    emit(state.copyWith(showLoading: loading));
  }

  void disposeDebouncing() {
    _debouncing?.cancel();
  }
}

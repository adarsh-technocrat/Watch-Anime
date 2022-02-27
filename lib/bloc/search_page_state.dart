import 'package:watch_anime/model/search_data_model.dart';

class SearchPageState {
  SearchDataModel searchDataModel;
  bool showLoading;
  String searchedQuery;

  SearchPageState({
    required this.searchDataModel,
    required this.showLoading,
    required this.searchedQuery,
  });

  SearchPageState copyWith({
    SearchDataModel? searchDataModel,
    bool? showLoading,
    String? searchedQuery,
  }) {
    return SearchPageState(
        searchDataModel: searchDataModel ?? this.searchDataModel,
        showLoading: showLoading ?? this.showLoading,
        searchedQuery: searchedQuery ?? this.searchedQuery);
  }
}

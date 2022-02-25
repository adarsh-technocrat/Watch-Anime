import 'package:watch_anime/model/search_data_model.dart';

class SearchPageState {
  SearchDataModel searchDataModel;
  bool showLoading;

  SearchPageState({
    required this.searchDataModel,
    required this.showLoading,
  });

  SearchPageState copyWith({
    SearchDataModel? searchDataModel,
    bool? showLoading,
  }) {
    return SearchPageState(
      searchDataModel: searchDataModel ?? this.searchDataModel,
      showLoading: showLoading ?? this.showLoading,
    );
  }
}

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_anime/constants/enums.dart';
import 'package:watch_anime/data/models/anime_list_model.dart';
import 'package:watch_anime/data/services/api_result.dart';
import 'package:watch_anime/data/services/network_exceptions.dart';
import 'package:watch_anime/repositories/home_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeRepository homeRepository = HomeRepository();

  HomeCubit() : super(const HomeState());

  void changeScreenIndex(int index) {
    emit(state.copyWith(selectedIndexPsition: index));
  }

  void changeHoverCardIndex(int index) {
    emit(state.copyWith(hoverCardIndex: index));
  }

  void onEnter(bool isHovered) => emit(state.copyWith(onHover: isHovered));

  void getAnimeList(int pageNumber) async {
    emit(state.copyWith(status: Status.loading));
    ApiResult<AnimeListModel> animeListResponse =
        await homeRepository.getAnimeList(pageNumber);
    animeListResponse.when(success: (AnimeListModel animeListResponse) {
      emit(state.copyWith(
        status: Status.success,
        message: animeListResponse.message,
        animeList: animeListResponse.data?.documents,
      ));
    }, failure: (NetworkExceptions error) {
      emit(state.copyWith(
          status: Status.failure,
          message: NetworkExceptions.getErrorMessage(error)));
    });
  }
}

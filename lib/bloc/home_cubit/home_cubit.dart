import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_anime/enums/enums.dart';
import 'package:watch_anime/data/models/anime_list_model.dart';
import 'package:watch_anime/data/services/api_result.dart';
import 'package:watch_anime/data/services/network_exceptions.dart';
import 'package:watch_anime/repositories/home_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeRepository homeRepository = HomeRepository();

  HomeCubit() : super(const HomeState());

  List<Anime> anime = [];

  void changeScreenIndex(int index) {
    emit(state.copyWith(selectedIndexPsition: index));
  }

  void onEnter(bool isHovered) => emit(state.copyWith(onHover: isHovered));

  void getAnimeList() async {
    if (state.pageNumber == 0) {
      emit(state.copyWith(status: Status.loading));
    }

    ApiResult<AnimeListModel> animeListResponse =
        await homeRepository.getAnimeList(state.pageNumber);
    animeListResponse.when(success: (AnimeListModel animeListResponse) {
      anime.addAll(animeListResponse.data?.documents as List<Anime>);
      emit(state.copyWith(
        status: Status.success,
        message: animeListResponse.message,
        animeList: anime,
      ));
      emit(state.copyWith(pageNumber: state.pageNumber + 1));
    }, failure: (NetworkExceptions error) {
      emit(
        state.copyWith(
          status: Status.failure,
          message: NetworkExceptions.getErrorMessage(error),
        ),
      );
    });
  }
}

part of 'home_cubit.dart';

class HomeState extends Equatable {
  final int selectedIndexPsition;
  final bool onHover;
  final Status status;
  final String message;
  final List<Anime> animeList;
  final int pageNumber;
  final List<Documents> animeEpisodesList;
  final List<SongDocument> animeSongPlayList;

  const HomeState({
    this.status = Status.initial,
    this.message = "",
    this.selectedIndexPsition = 0,
    this.onHover = false,
    this.animeList = const [],
    this.pageNumber = 1,
    this.animeEpisodesList = const [],
    this.animeSongPlayList = const [],
  });

  HomeState copyWith(
      {int? selectedIndexPsition,
      int? hoverCardIndex,
      bool? onHover,
      Status? status,
      String? message,
      List<Anime>? animeList,
      int? pageNumber,
      List<Documents>? animeEpisodesList,
      List<SongDocument>? animeSongPlayList}) {
    return HomeState(
        status: status ?? this.status,
        message: message ?? this.message,
        selectedIndexPsition: selectedIndexPsition ?? this.selectedIndexPsition,
        onHover: onHover ?? this.onHover,
        animeList: animeList ?? this.animeList,
        pageNumber: pageNumber ?? this.pageNumber,
        animeEpisodesList: animeEpisodesList ?? this.animeEpisodesList,
        animeSongPlayList: animeSongPlayList ?? this.animeSongPlayList);
  }

  @override
  List<Object?> get props => [
        selectedIndexPsition,
        onHover,
        status,
        message,
        animeList,
        pageNumber,
        animeEpisodesList,
        animeSongPlayList
      ];
}

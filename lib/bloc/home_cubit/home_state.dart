part of 'home_cubit.dart';

class HomeState extends Equatable {
  final int selectedIndexPsition;
  final bool onHover;
  final Status status;
  final String message;
  final List<Anime> animeList;
  final int pageNumber;

  const HomeState({
    this.status = Status.initial,
    this.message = "",
    this.selectedIndexPsition = 0,
    this.onHover = false,
    this.animeList = const [],
    this.pageNumber = 1,
  });

  HomeState copyWith({
    int? selectedIndexPsition,
    int? hoverCardIndex,
    bool? onHover,
    Status? status,
    String? message,
    List<Anime>? animeList,
    int? pageNumber,
  }) {
    return HomeState(
      status: status ?? this.status,
      message: message ?? this.message,
      selectedIndexPsition: selectedIndexPsition ?? this.selectedIndexPsition,
      onHover: onHover ?? this.onHover,
      animeList: animeList ?? this.animeList,
      pageNumber: pageNumber ?? this.pageNumber,
    );
  }

  @override
  List<Object?> get props => [
        selectedIndexPsition,
        onHover,
        status,
        message,
        animeList,
        pageNumber,
      ];
}

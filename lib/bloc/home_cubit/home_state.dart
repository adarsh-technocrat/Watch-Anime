part of 'home_cubit.dart';

class HomeState extends Equatable {
  final int selectedIndexPsition;
  final int hoverCardIndex;
  final bool onHover;
  final Status status;
  final String message;
  final List<Anime> animeList;

  const HomeState({
    this.status = Status.initial,
    this.message = "",
    this.selectedIndexPsition = 0,
    this.hoverCardIndex = 0,
    this.onHover = false,
    this.animeList = const [],
  });

  HomeState copyWith({
    int? selectedIndexPsition,
    int? hoverCardIndex,
    bool? onHover,
    Status? status,
    String? message,
    List<Anime>? animeList,
  }) {
    return HomeState(
      status: status ?? this.status,
      message: message ?? this.message,
      selectedIndexPsition: selectedIndexPsition ?? this.selectedIndexPsition,
      hoverCardIndex: hoverCardIndex ?? this.hoverCardIndex,
      onHover: onHover ?? this.onHover,
      animeList: animeList ?? this.animeList,
    );
  }

  @override
  List<Object?> get props => [
        selectedIndexPsition,
        hoverCardIndex,
        onHover,
        status,
        message,
        animeList
      ];
}

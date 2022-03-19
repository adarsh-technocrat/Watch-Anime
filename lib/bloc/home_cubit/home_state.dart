class LandingPageState {
  int selectedIndexPsition;
  int hoverCardIndex;
  bool onHover;

  LandingPageState({
    required this.selectedIndexPsition,
    required this.hoverCardIndex,
    required this.onHover,
  });

  LandingPageState copyWith(
      {int? selectedIndexPsition, int? hoverCardIndex, bool? onHover}) {
    return LandingPageState(
        selectedIndexPsition: selectedIndexPsition ?? this.selectedIndexPsition,
        hoverCardIndex: hoverCardIndex ?? this.hoverCardIndex,
        onHover: onHover ?? this.onHover);
  }
}

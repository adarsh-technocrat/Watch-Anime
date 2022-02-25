class LandingPageState {
  int selectedIndexPsition;

  LandingPageState({
    required this.selectedIndexPsition,
  });

  LandingPageState copyWith({
    int? selectedIndexPsition,
  }) {
    return LandingPageState(
      selectedIndexPsition: selectedIndexPsition ?? this.selectedIndexPsition,
    );
  }
}

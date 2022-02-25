import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_anime/bloc/landing_page_state.dart';

class LandingPageCubit extends Cubit<LandingPageState> {
  LandingPageCubit() : super(LandingPageState(selectedIndexPsition: 0));

  void changeScreenIndex(int index) {
    emit(state.copyWith(selectedIndexPsition: index));
  }
}

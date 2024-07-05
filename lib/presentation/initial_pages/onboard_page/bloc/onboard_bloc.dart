import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'onboard_event.dart';
part 'onboard_state.dart';

class OnboardBloc extends Bloc<OnboardEvent, OnboardState> {
  late PageController pageController;

  OnboardBloc() : super(OnboardInitial(0)) {
    pageController = PageController(initialPage: 0);

    on<PageChangedEvent>((event, emit) {
      emit(OnboardInitial(event.index));
    });

    on<SkipOnboardEvent>((event, emit) {
      emit(OnboardSkipped());
    });

    on<OnPressedButtonEvent>((event, emit) {
      final state = this.state;
      if (state is OnboardInitial && state.pageIndex == 2) {
        emit(OnboardSkipped());
      } else {
        pageController.nextPage(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }
}

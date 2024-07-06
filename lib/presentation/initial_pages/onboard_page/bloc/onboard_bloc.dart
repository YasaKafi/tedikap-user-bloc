import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboard_event.dart';
part 'onboard_state.dart';
part 'onboard_bloc.freezed.dart';

class OnboardBloc extends Bloc<OnboardEvent, OnboardState> {
  late PageController pageController;
  OnboardBloc() : super(const OnboardState.initial(pageIndex: 0)) {
    pageController = PageController(initialPage: 0);

    on<_PageChanged>((event, emit) {
      emit(OnboardState.initial(pageIndex: event.index));
    });

    on<_SkipOnboard>((event, emit) {
      emit(OnboardState.finished());
    });

    on<_OnPressedButton>((event, emit) {
      if (OnboardState.initial(pageIndex: 2) == state){
        emit(OnboardState.finished());
      } else {
        pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });

  }
}

part of 'onboard_bloc.dart';


abstract class OnboardEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class PageChangedEvent extends OnboardEvent {
  final int index;

  PageChangedEvent(this.index);

  @override
  List<Object?> get props => [index];
}

class SkipOnboardEvent extends OnboardEvent {}

class OnPressedButtonEvent extends OnboardEvent {}


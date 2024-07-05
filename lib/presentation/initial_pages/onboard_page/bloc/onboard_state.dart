part of 'onboard_bloc.dart';

abstract class OnboardState extends Equatable {
  @override
  List<Object?> get props => [];
}

class OnboardInitial extends OnboardState {
  final int pageIndex;

  OnboardInitial(this.pageIndex);

  @override
  List<Object?> get props => [pageIndex];
}

class OnboardSkipped extends OnboardState {}


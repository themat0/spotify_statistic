part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeChangeMenuEvent extends HomeEvent {
  HomeChangeMenuEvent(this.index);
  final int index;
}

class HomeForceLogout extends HomeEvent {}
part of 'home_bloc.dart';

class HomeState extends Equatable {
  final int index;

  const HomeState({required this.index});

  @override
  List<Object?> get props => [index];
}

class HomeForceLogoutState extends HomeState {
  const HomeForceLogoutState({required super.index});
}
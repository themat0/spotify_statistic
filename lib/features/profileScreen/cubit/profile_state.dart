part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final UserObject user;

  ProfileLoaded(this.user);
}

class ProfileLogoutSuccess extends ProfileState {}
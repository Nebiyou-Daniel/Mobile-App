// profile states:
// profile loading state, profile load success state, profile load failure state, profile update success state, profile update failure state.

import 'package:equatable/equatable.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

// ProfileInitial
class ProfileInitial extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

class ProfileLoadSuccessState extends ProfileState {
  final String name;
  final String email;
  final String bio;

  const ProfileLoadSuccessState(
      {required this.name, required this.bio, required this.email});

  @override
  List<Object> get props => [name, bio];
}

class ProfileLoadFailureState extends ProfileState {}

class ProfileOperationSuccessState extends ProfileState {
  final String name;
  final String email;
  final String bio;

  const ProfileOperationSuccessState({required this.name, required this.email, required this.bio});

  @override
  List<Object> get props => [name, bio];
}

class ProfileOperationErrorState extends ProfileState {
  final String message;

  const ProfileOperationErrorState({required this.message});

  @override
  List<Object> get props => [message];
}

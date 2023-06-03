import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../serviceLocator.dart';
import '../profile.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    SharedPreferences preferences = ServiceLocator().preferences;

    on<ProfileLoadEvent>((event, emit) async {
      emit(ProfileLoadingState());
      await Future.delayed(const Duration(seconds: 1));
      try {
        emit(const ProfileLoadSuccessState(
          name: "John Adamu",
          bio: "I am a trainer",
          email: 'thisisemail@gmail.com',
          phoneNumber: "125673456",
        ));
      } catch (e) {
        emit(ProfileLoadFailureState());
      }
    });

    on<ProfileUpdateEvent>((event, emit) async {
      emit(ProfileLoadingState());
      await Future.delayed(const Duration(seconds: 1));
      try {
        emit(const ProfileOperationSuccessState(
          name: "John Adamu",
          bio: "I am a trainer",
          email: 'thisisemail@gmail.com',
          phoneNumber: "234567876543",
        ));
        // add profileLoad event to this bloc
        add(ProfileLoadEvent());
      } catch (e) {
        emit(const ProfileOperationErrorState(
            message: "Inexpected error occurred when updating profile!"));
      }
    });
  }
}

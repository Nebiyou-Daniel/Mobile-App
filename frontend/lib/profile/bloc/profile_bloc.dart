import 'package:flutter_bloc/flutter_bloc.dart';

import '../profile.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileLoadEvent>((event, emit) async {
      emit(ProfileLoadingState());
      await Future.delayed(const Duration(seconds: 1));
      try {
        emit(ProfileLoadSuccessState(
            name: "John Adamu",
            bio: "I am a trainer",
            image:
                "https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png"));
      } catch (e) {
        emit(ProfileLoadFailureState());
      }
    });

    on<ProfileUpdateEvent>((event, emit) async {
      emit(ProfileLoadingState());
      await Future.delayed(const Duration(seconds: 1));
      try {
        emit(
            ProfileOperationSuccessState(name: event.fullname, bio: event.bio));
      } catch (e) {
        emit(ProfileOperationErrorState());
      }
    });
  }
}

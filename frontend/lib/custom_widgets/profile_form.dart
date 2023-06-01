import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/custom_widgets/initial_avatar.dart';

import '../profile/profile.dart';

class ProfileForm extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  ProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        final profileBloc = BlocProvider.of<ProfileBloc>(context);

        if (state is ProfileLoadSuccessState) {
          nameController.text = state.name;
          bioController.text = state.bio;
          emailController.text = state.email;
          phoneNumberController.text = state.phoneNumber;
        }

        if (state is ProfileOperationSuccessState) {
          profileBloc.add(ProfileLoadEvent());
        }

        return Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InitialsAvatar(
                initials: nameController.text,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Icon(Icons.person),
                  Container(margin: const EdgeInsets.only(left: 20.0)),
                  Expanded(
                    child: TextField(
                      controller: nameController,
                      enabled: state is! ProfileLoadSuccessState,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.save),
                    onPressed: () {
                      _updateProfile(profileBloc);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.info),
                  Container(margin: const EdgeInsets.only(left: 20.0)),
                  Expanded(
                    child: state is ProfileLoadSuccessState
                        ? TextField(
                            controller: bioController,
                            enabled: state is! ProfileLoadSuccessState,
                          )
                        : Text(bioController.text),
                  ),
                  IconButton(
                    icon: const Icon(Icons.save),
                    onPressed: () {
                      _updateProfile(profileBloc);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.email),
                  Container(margin: const EdgeInsets.only(left: 20.0)),
                  Expanded(
                    child: state is ProfileLoadSuccessState
                        ? TextField(
                            controller: emailController,
                            enabled: state is! ProfileLoadSuccessState,
                          )
                        : Text(emailController.text),
                  ),
                  IconButton(
                    icon: const Icon(Icons.save),
                    onPressed: () {
                      _updateProfile(profileBloc);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.phone),
                  Container(margin: const EdgeInsets.only(left: 20.0)),
                  Expanded(
                    child: TextField(
                      controller: phoneNumberController,
                      enabled: state is! ProfileLoadSuccessState,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.save),
                    onPressed: () {
                      _updateProfile(profileBloc);
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void _updateProfile(ProfileBloc profileBloc) {
    print("Updating profile");
    final String newName = nameController.text;
    final String newBio = bioController.text;
    final String newEmail = emailController.text;
    final String newPhoneNumber = phoneNumberController.text;

    profileBloc.add(ProfileUpdateEvent(
      fullname: newName,
      bio: newBio,
      email: newEmail,
      phonenumber: newPhoneNumber,
    ));
  }
}

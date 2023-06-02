import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/presentation/common_screens/loading.dart';
import 'package:frontend/presentation/custom_widgets/initial_avatar.dart';

import '../../application/profile/profile.dart';

class ProfileForm extends StatefulWidget {
  const ProfileForm({Key? key}) : super(key: key);

  @override
  _ProfileFormState createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  late TextEditingController nameController;
  late TextEditingController bioController;
  late TextEditingController emailController;
  late TextEditingController phoneNumberController;
  bool isNameEditable = false;
  bool isBioEditable = false;
  bool isEmailEditable = false;
  bool isPhoneNumberEditable = false;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    bioController = TextEditingController();
    emailController = TextEditingController();
    phoneNumberController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    bioController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        final profileBloc = BlocProvider.of<ProfileBloc>(context);
        print(profileBloc.state);

        if (state is ProfileInitial) {
          profileBloc.add(ProfileLoadEvent());
          return const LoadingScreen();
        }

        if (state is ProfileLoadingState) {
          return const LoadingScreen();
        }

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
                    child: isNameEditable
                        ? TextField(
                            controller: nameController,
                          )
                        : Text(nameController.text),
                  ),
                  IconButton(
                    icon: isNameEditable
                        ? const Icon(Icons.save)
                        : const Icon(Icons.edit),
                    onPressed: () {
                      setState(() {
                        isNameEditable = !isNameEditable;
                        if (isNameEditable) {
                          nameController.text = nameController.text;
                        } else {
                          _updateProfile(
                              profileBloc, 'name', nameController.text);
                        }
                      });
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
                    child: isBioEditable
                        ? TextField(
                            controller: bioController,
                          )
                        : Text(bioController.text),
                  ),
                  IconButton(
                    icon: isBioEditable
                        ? const Icon(Icons.save)
                        : const Icon(Icons.edit),
                    onPressed: () {
                      setState(() {
                        isBioEditable = !isBioEditable;
                        if (isBioEditable) {
                          bioController.text = bioController.text;
                        } else {
                          _updateProfile(
                              profileBloc, 'bio', bioController.text);
                        }
                      });
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
                    child: isEmailEditable
                        ? TextField(
                            controller: emailController,
                          )
                        : Text(emailController.text),
                  ),
                  IconButton(
                    icon: isEmailEditable
                        ? const Icon(Icons.save)
                        : const Icon(Icons.edit),
                    onPressed: () {
                      setState(() {
                        isEmailEditable = !isEmailEditable;
                        if (isEmailEditable) {
                          emailController.text = emailController.text;
                        } else {
                          _updateProfile(
                              profileBloc, 'email', emailController.text);
                        }
                      });
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
                    child: isPhoneNumberEditable
                        ? TextField(
                            controller: phoneNumberController,
                          )
                        : Text(phoneNumberController.text),
                  ),
                  IconButton(
                    icon: isPhoneNumberEditable
                        ? const Icon(Icons.save)
                        : const Icon(Icons.edit),
                    onPressed: () {
                      setState(() {
                        isPhoneNumberEditable = !isPhoneNumberEditable;
                        if (isPhoneNumberEditable) {
                          phoneNumberController.text =
                              phoneNumberController.text;
                        } else {
                          _updateProfile(profileBloc, 'phoneNumber',
                              phoneNumberController.text);
                        }
                      });
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

  void _updateProfile(ProfileBloc profileBloc, String field, String value) {
    print("Updating profile");
    final String fullname = nameController.text;
    final String bio = bioController.text;
    final String email = emailController.text;
    final String phoneNumber = phoneNumberController.text;

    profileBloc.add(ProfileUpdateEvent(
        fullname: fullname, bio: bio, email: email, phonenumber: phoneNumber));
  }
}

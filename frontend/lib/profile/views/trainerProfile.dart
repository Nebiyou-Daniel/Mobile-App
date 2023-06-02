import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/Reviews/views/trainerListOfReviews.dart';
import 'package:frontend/custom_widgets/deleteSelfAccountButton.dart';
import 'package:frontend/custom_widgets/initial_avatar.dart';
import 'package:frontend/profile/profile.dart';

import 'package:go_router/go_router.dart';
import '../../Theme/theme.dart';
import '../../UI/common/loading.dart';
import '../../auth/auth.dart';
import '../../custom_widgets/bottom_navigation_trainer.dart';
import '../../custom_widgets/logoutButton.dart';

class TrainerProfile extends StatelessWidget {
  TrainerProfile({Key? key}) : super(key: key);

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: context.watch<ThemeBloc>().state.theme,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Workout Warrior"),
          leading: PopupMenuButton(
            child: const Icon(Icons.person_2_outlined),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: TextButton(
                  onPressed: () {
                    BlocProvider.of<AuthBloc>(context).add(AuthLogoutEvent());
                  },
                  child: const Text("Logout"),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {
                GoRouter.of(context).push('/notifications');
              },
            ),
          ],
        ),
        body: BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
          final profileBloc = BlocProvider.of<ProfileBloc>(context);
          final profileState = profileBloc.state;
          if (profileState is ProfileInitial) {
            profileBloc.add(ProfileLoadEvent());
          }
          if (profileState is ProfileLoadingState) {
            return const LoadingScreen();
          }
          if (profileState is ProfileLoadSuccessState) {
            _nameController.text = profileState.name;
            _emailController.text = profileState.email;
            _bioController.text = profileState.bio;

            return SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // intialavatar image
                    InitialsAvatar(
                      initials: profileState.name,
                    ),
                    // an info icon followed by a text that says, click on texts to edit them
                    Center(
                      child: Row(
                        children: const <Widget>[
                          Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Icon(Icons.info),
                          ),
                          Expanded(
                            child: Text(
                              "Click on text to edit your profile.",
                              softWrap: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 300,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Icon(Icons.person),
                            const Padding(padding: EdgeInsets.all(15)),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _showTextDialog(
                                    context,
                                    'User Name',
                                    _nameController,
                                    (value) {
                                      if (value != null) {
                                        // Send update event to the bloc
                                        BlocProvider.of<ProfileBloc>(context)
                                            .add(
                                          ProfileUpdateEvent(
                                            fullname: value,
                                            bio: value,
                                            email: value,
                                            phonenumber: value,
                                          ),
                                        );
                                      }
                                    },
                                  );
                                },
                                child: Text('User Name: ${profileState.name}'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 300,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Icon(Icons.email),
                            const Padding(padding: EdgeInsets.all(15)),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _showTextDialog(
                                    context,
                                    'Email',
                                    _emailController,
                                    (value) {
                                      if (value != null) {
                                        // Send update event to the bloc
                                        BlocProvider.of<ProfileBloc>(context)
                                            .add(
                                          ProfileUpdateEvent(
                                            fullname: value,
                                            bio: value,
                                            email: value,
                                            phonenumber: value,
                                          ),
                                        );
                                      }
                                    },
                                  );
                                },
                                child: Text('Email: ${profileState.email}'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 300,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Icon(Icons.info),
                            const Padding(padding: EdgeInsets.all(15)),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  _showTextDialog(
                                    context,
                                    'Bio',
                                    _bioController,
                                    (value) {
                                      if (value != null) {
                                        // Send update event to the bloc
                                        BlocProvider.of<ProfileBloc>(context)
                                            .add(
                                          ProfileUpdateEvent(
                                            fullname: value,
                                            bio: value,
                                            email: value,
                                            phonenumber: value,
                                          ),
                                        );
                                      }
                                    },
                                  );
                                },
                                child: Text('Bio: ${profileState.bio}'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(30)),
                    const Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text("Reviews"),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 400,
                      width: 400,
                      child: const ReviewList(trainerId: -1),
                    ),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 20)),

                    // Logout button
                    const LogoutButton(),

                    // const Delete button
                    const Padding(padding: EdgeInsets.symmetric(vertical: 20)),
                    // DELETE ACCOUNT BUTTON
                    const DeleteSelfAccountButton(),
                  ],
                ),
              ),
            );
          } else if (profileState is ProfileOperationSuccessState) {
            profileBloc.add(ProfileLoadEvent());
            return const Text("✅ Profile Edited Successfully");
          } else if (profileState is ProfileOperationErrorState) {
            return Text("❌ ${profileState.message}]}");
          } else {
            return const Text("Unexpected Error Occurred");
          }
        }),
        bottomNavigationBar: TrainerBottomNavigation(
          selectedIndex: 1,
        ),
      ),
    );
  }

  void _showTextDialog(
    BuildContext context,
    String title,
    TextEditingController controller,
    Function(String?) onSave,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: TextField(
            controller: controller,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                onSave(controller.text);
                Navigator.pop(context);
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }
}

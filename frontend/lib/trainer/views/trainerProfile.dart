import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:frontend/Reviews/views/list_of_reviews.dart';
import 'package:frontend/custom_widgets/initial_avatar.dart';
import 'package:frontend/profile/bloc/profile_bloc.dart';
import 'package:frontend/profile/profile.dart';

import 'package:go_router/go_router.dart';

import '../../auth/auth.dart';
import '../../custom_widgets/bottom_navigation_trainer.dart';
import '../../custom_widgets/logoutButton.dart';
import '../../custom_widgets/trainerdeleteAccountButton.dart';
import '../trainer.dart';

class TrainerProfile extends StatefulWidget {
  final int trainerId;

  const TrainerProfile({Key? key, required this.trainerId}) : super(key: key);

  @override
  State<TrainerProfile> createState() => _TrainerProfileState();
}

class _TrainerProfileState extends State<TrainerProfile> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _bioController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrainerBloc, TrainerState>(
      builder: (context, state) {
        if (state is TrainerLoadSuccess) {
          _nameController.text = state.trainer.name;
          _emailController.text = state.trainer.email;
          _bioController.text = state.trainer.bio;

          return Scaffold(
            appBar: AppBar(
              title: const Text("Workout Warrior"),
              backgroundColor: const Color(0xFF0A568A),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.notifications),
                  onPressed: () {
                    GoRouter.of(context).push('/notifications');
                  },
                ),
              ],
              leading: PopupMenuButton(
                child: const Icon(Icons.person_2_outlined),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: TextButton(
                      onPressed: () {
                        BlocProvider.of<AuthBloc>(context)
                            .add(AuthLogoutEvent());
                      },
                      child: const Text("Logout"),
                    ),
                  ),
                ],
              ),
            ),
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // intialavatar image
                    InitialsAvatar(
                      initials: state.trainer.name,
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
                                child: Text(
                                  'User Name: ${state.trainer.name}',
                                ),
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
                                child: Text(
                                  'Email: ${state.trainer.email}',
                                ),
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
                                child: Text(
                                  'Bio: ${state.trainer.bio}',

                                ),
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
                        child: ElevatedButton(
                          onPressed: () => null,
                          child: const Text('Update Profile'),
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
                    // const TrainerDeleteAccountButton(
                      // trainerId: id.toString()
                    // ),
                    // DELETE ACCOUNT BUTTON
                  ],
                ),
              ),
            ),
            bottomNavigationBar: TrainerBottomNavigation(
              selectedIndex: 1,
            ),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  void _showTextDialog(BuildContext context, String title,
      TextEditingController controller, Function(String?) onSave) {
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

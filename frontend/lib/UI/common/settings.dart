import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../custom_widgets/header_banner.dart';
import '../../Theme/theme.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: MaterialApp(
        theme: context.watch<ThemeBloc>().state.theme,
        debugShowCheckedModeBanner: false,
        home: MultiBlocProvider(
          providers: [
            BlocProvider<ThemeBloc>(
              create: (context) => ThemeBloc(),
            ),
          ],
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.keyboard_arrow_left_outlined),
              ),
              title: const Text('Settings'),
            ),
            body: Column(
              children: <Widget>[
                const HeaderBanner(),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 3,
                  child: ListView(
                    children: [
                      // a dark mode toggler
                      ListTile(
                        title: const Text('Dark Mode'),
                        trailing: Switch(
                          value: context.watch<ThemeBloc>().state is DarkTheme,
                          onChanged: (bool value) {
                            // Here I am having the issue error:- The argument type 'ThemeChangedEvent' can't be assigned to the parameter type 'ThemeEvent'.dartargument_type_not_assignable
                            context.read<ThemeBloc>().add(ThemeChangedEvent(isDarkThemeOn: value));
                          },
                        ),
                      ),

                      // A settings for editing profile
                      ListTile(
                        title: const Text('Edit Profile'),
                        onTap: () {
                          // Replace with our own logic to toggle notifications
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

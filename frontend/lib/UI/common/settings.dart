import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../theme/bloc/theme_bloc.dart';
import '../../theme/bloc/theme_event.dart';
import '../../custom_widgets/header_banner_with_icons.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: MaterialApp(
          theme: context.watch<ThemeBloc>().state.theme,
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            body: MultiBlocProvider(
              providers: [
                BlocProvider<ThemeBloc>(
                  create: (context) => ThemeBloc(),
                ),
              ],
              child: Column(
                children: const <Widget>[
                  HeaderBannerWithIcons(),
                  SettingsWidget(),
                ],
              ),
            ),
          ),
        ),
    );
  }
}


class SettingsWidget extends StatelessWidget {
  const SettingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 3,
      child: ListView(
        children: [

          // a dark mode toggler
          ListTile(
            title: const Text('Dark Mode'),
            trailing: Switch(
              value: false,
              onChanged: (bool value) {
                value = !value;
                context.read<ThemeBloc>().add(ThemeChangedEvent(value));
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
    );
  }
}

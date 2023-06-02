

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../common_screens/loading_paragraph.dart';
import '../../application/Theme/theme.dart';
import '../../application/notifications/bloc/notification_bloc.dart';
import '../../application/notifications/bloc/notification_event.dart';
import '../../application/notifications/bloc/notification_state.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: context.watch<ThemeBloc>().state.theme,
      home: BlocProvider<NotificationBloc>(
        create: (context) => NotificationBloc()..add(NotificationLoadEvent()),
        child: Scaffold(
          // a back button to pop back of the context

          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: const Text("Notifications"),
          ),
          body: BlocBuilder<NotificationBloc, NotificationState>(
            builder: (context, state) {
              if (state is NotificationInitial) {
                final NotificationBloc notificationBloc =
                    BlocProvider.of<NotificationBloc>(context);
                notificationBloc.add(NotificationLoadEvent());
                return const LoadingParagraphWidget(numberOfLines: 3);
              }
              if (state is NotificationsLoading) {
                return const LoadingParagraphWidget(numberOfLines: 3);
              } else if (state is NotificationsLoadedSuccess) {
                if (state.notifications.isEmpty) {
                  return const Center(
                    child: Text(
                      "🌵 All Caught Up 🏜",
                      style: TextStyle(color: Colors.blueAccent, fontSize: 25),
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: state.notifications.length,
                  itemBuilder: (context, index) {
                    final notification = state.notifications[index];
                    return Dismissible(
                      key: Key(notification.id.toString()),
                      onDismissed: (direction) {
                        BlocProvider.of<NotificationBloc>(context).add(
                          NotificationMarkAsSeenEvent(
                              notification: notification),
                        );
                      },
                      // an expandable tile
                      child: ExpansionTile(
                        title: Text(notification.message),
                        subtitle: const Text("03-03-2021"),
                        // subtitle: Text(notification.createdAt.toString()),
                        children: [
                          Text(notification.message),
                        ],
                      ),
                    );
                  },
                );
              } else if (state is NotificationsLoadedError) {
                return Center(
                  child: Text(state.message),
                );
              } else {
                return const Center(
                  child: Text(
                      " Something went wrong while loading your Notifications"),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
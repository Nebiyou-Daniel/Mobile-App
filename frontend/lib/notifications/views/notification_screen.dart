import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/UI/common/loading_paragraph.dart';
import '../notification.dart';

// this class must have a screen that has a list of notifications that are wrapped inside a gesture detector that when swipe to the right it will mark the notification as done

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NotificationBloc>(
      create: (context) => NotificationBloc()..add(NotificationLoadEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Notifications"),
        ),
        body: BlocBuilder<NotificationBloc, NotificationState>(
          builder: (context, state) {
            if (state is NotificationsLoading) {
              return const LoadingParagraphWidget(numberOfLines: 3);
            } else if (state is NotificationsLoadedSuccess) {
              return ListView.builder(
                itemCount: state.notifications.length,
                itemBuilder: (context, index) {
                  final notification = state.notifications[index];
                  return Dismissible(
                    key: Key(notification.id.toString()),
                    onDismissed: (direction) {
                      BlocProvider.of<NotificationBloc>(context).add(
                        NotificationMarkAsDoneEvent(notification: notification),
                      );
                    },
                    child: ListTile(
                      title: Text(notification.message),
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
                child: Text(" Something went wrong while loading your Notifications"),
              );
            }
          },
        ),
      ),
    );
  }
}

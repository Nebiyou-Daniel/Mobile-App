import 'package:equatable/equatable.dart';

import '../../../domain/notification/Model/notification_model.dart';

abstract class NotificationState extends Equatable {
  const NotificationState();

  @override
  List<Object?> get props => [];
}

class NotificationInitial extends NotificationState {}

class NotificationsLoading extends NotificationState {}

class NotificationsLoadedSuccess extends NotificationState {
  final List<Notification> notifications;

  const NotificationsLoadedSuccess({required this.notifications});

  @override
  List<Object?> get props => [notifications];
}

class NotificationsLoadedError extends NotificationState {
  final String message;

  const NotificationsLoadedError({required this.message});

  @override
  List<Object?> get props => [message];
}

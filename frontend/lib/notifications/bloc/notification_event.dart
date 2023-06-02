import '../Model/notification_model.dart';

abstract class NotificationEvent {}

class NotificationLoadEvent extends NotificationEvent {}

class NotificationMarkAsDoneEvent extends NotificationEvent {
  final Notification notification;
  NotificationMarkAsDoneEvent({required this.notification});
}

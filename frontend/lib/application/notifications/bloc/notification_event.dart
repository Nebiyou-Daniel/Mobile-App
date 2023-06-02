import '../../../domain/notifications/Model/notification_model.dart';

abstract class NotificationEvent {}

class NotificationLoadEvent extends NotificationEvent {}

class NotificationMarkAsSeenEvent extends NotificationEvent {
  final Notification notification;
  NotificationMarkAsSeenEvent({required this.notification});
}

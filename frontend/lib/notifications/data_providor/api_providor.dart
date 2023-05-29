import '../Model/notification_model.dart';

class ApiDataProvidor {
  Future<List<Notification>> getNotifications() async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      Notification(
          id: 1,
          recipientId: 1,
          message: "You have a new message from user 1",
          seen: false),
      Notification(
          id: 2,
          recipientId: 1,
          message: "You have a new message from user 2",
          seen: false),
      Notification(
          id: 3,
          recipientId: 1,
          message: "You have a new message from user 3",
          seen: false),
      // that's enough notifications to test
    ];
  }

  Future<void> markNotificationAsDone(Notification notification) async {
    await Future.delayed(const Duration(seconds: 2));
    print("Notification ${notification.id} marked as done");
  }
}

 
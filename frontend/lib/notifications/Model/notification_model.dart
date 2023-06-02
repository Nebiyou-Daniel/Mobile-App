class Notification {
  final int id;
  final int recipientId;
  final String message;
  final bool seen;

  Notification(
      {required this.id,
      required this.recipientId,
      required this.message,
      required this.seen});

  factory Notification.fromJson(Map<String, dynamic> json) {
    return Notification(
        id: json['id'],
        recipientId: json['recipientId'],
        message: json['message'],
        seen: json['seen']);
  }
}

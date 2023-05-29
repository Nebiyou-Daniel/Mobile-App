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
}

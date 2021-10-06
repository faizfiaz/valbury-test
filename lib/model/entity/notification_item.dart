class NotificationItem {
  String picture;
  String title;
  String message;
  bool isRead;
  String action;
  String actionTitle;
  String date;

  NotificationItem(
      {required this.picture,
      required this.title,
      required this.message,
      this.isRead = false,
      this.action = "no_action",
      this.actionTitle = "",
      required this.date});
}

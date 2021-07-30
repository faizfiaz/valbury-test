class NotificationItem {
  String name;
  String picture;
  String month;
  String title;
  String message;
  bool isRead;
  String action;
  String actionTitle;
  String date;

  NotificationItem(
      {required this.name,
      required this.picture,
      required this.month,
      required this.title,
      required this.message,
      this.isRead = false,
      this.action = "no_action",
      this.actionTitle = "",
      required this.date});
}

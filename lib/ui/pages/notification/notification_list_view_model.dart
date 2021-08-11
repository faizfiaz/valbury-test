import 'package:terkelola/commons/base_view_model.dart';
import 'package:terkelola/constants/images.dart';
import 'package:terkelola/model/entity/notification_item.dart';
import 'package:terkelola/repository/user_repository.dart';
import 'package:terkelola/usecases/user/user_usecase.dart';

import 'notification_list_navigator.dart';

class NotificationListViewModel
    extends BaseViewModel<NotificationListNavigator> {
  late UserUsecase _usecase;

  List<NotificationItem> data = [
    NotificationItem(
        name: "Pengelola",
        picture: dummyUser,
        month: "Februari 2020",
        title: "mengirimkan total iuran",
        message: "untuk kamu",
        isRead: false,
        action: "see_detail",
        actionTitle: "Lihat",
    date: "1 Jam yang lalu"),
    NotificationItem(
        name: "Pak Faiz",
        picture: dummyUser2,
        month: "Januari 2020",
        title: "Pembayaran iuran Anda telah kami terima untuk",
        message: "",
        isRead: false,
        action: "info",
        actionTitle: "Lunas",
        date: "12 Jam yang lalu"),
    NotificationItem(
        name: "Pak Faiz",
        picture: icClockNotification,
        month: "Januari 2020",
        title: "Hari ini iuran",
        message:
            "telah jatuh Tempo, yuk bayar melalui pilihan pembayaran yang tersedia",
        isRead: true,
        action: "pay",
        actionTitle: "Bayar",
        date: "1 Hari yang lalu"),
    NotificationItem(
        name: "Pengelola",
        picture: dummyUser,
        month: "Januari 2020",
        title: "mengirimkan total iuran",
        message: "untuk kamu",
        isRead: true,
        date: "1 Bulan yang lalu")
  ];

  NotificationListViewModel() {
    _usecase = new UserUsecase(UserRepository(dioClient));
  }

  String buildNotificationText(NotificationItem data) {
    return "${data.name} ${data.title} bulan ${data.month} ${data.message}";
  }

  markAllRead() {

  }
}

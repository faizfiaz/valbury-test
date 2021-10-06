import 'package:valburytest/commons/base_view_model.dart';
import 'package:valburytest/constants/images.dart';
import 'package:valburytest/model/entity/notification_item.dart';
import 'package:valburytest/repository/user_repository.dart';
import 'package:valburytest/usecases/user/user_usecase.dart';

import 'notification_list_navigator.dart';

class NotificationListViewModel
    extends BaseViewModel<NotificationListNavigator> {
  late UserUsecase _usecase;

  List<NotificationItem> data = [
    NotificationItem(
        picture: dummyUser,
        title: "Promo Bulan Oktober 2021",
        message: "Topup sekarang dan dapatkan promonya",
        isRead: false,
        action: "see_detail",
        actionTitle: "Lihat",
    date: "1 Jam yang lalu"),
    NotificationItem(
        picture: dummyUser2,
        title: "Topup anda sudah berhasil",
        message: "",
        isRead: false,
        action: "info",
        actionTitle: "Sukses Topup",
        date: "12 Jam yang lalu"),
    NotificationItem(
        picture: icClockNotification,
        title: "Maintenance tanggal 12 Juli 2021",
        message:
            "Mohon untuk tidak menggunakan Aplikasi pada jam 23:30 - 23:59",
        isRead: true,
        action: "see_detail",
        actionTitle: "Lihat",
        date: "1 Hari yang lalu")
  ];

  NotificationListViewModel() {
    _usecase = new UserUsecase(UserRepository(dioClient));
  }

  String buildNotificationText(NotificationItem data) {
    return "${data.title} ${data.message}";
  }

  markAllRead() {

  }
}

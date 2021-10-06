import 'package:valburytest/commons/base_view_model.dart';
import 'package:valburytest/constants/images.dart';
import 'package:valburytest/model/entity/services_menu.dart';
import 'package:valburytest/repository/user_repository.dart';
import 'package:valburytest/usecases/user/user_usecase.dart';

import 'services_navigator.dart';

class ServicesViewModel extends BaseViewModel<ServicesNavigator> {
  List<ServicesMenu> billsMenu = [
    ServicesMenu("Iuran", icBill, 0),
    ServicesMenu("Apartement", icApartment, 1),
    ServicesMenu("Kost", icBoardingHouse, 2),
    ServicesMenu("Parkir", icPark, 3),
    ServicesMenu("Laundry", icLaundry, 4),
    ServicesMenu("Token", icToken, 5),
  ];

  List<ServicesMenu> ppobMenu = [
    ServicesMenu("Listrik", icThunder, 6),
    ServicesMenu("Pulsa", icPhone, 7),
    ServicesMenu("Air", icWater, 8),
    ServicesMenu("Internet", icInternet, 9),
  ];

  List<ServicesMenu> coverLetterMenu = [
    ServicesMenu("KTP", icIdentityCard, 10),
    ServicesMenu("Kartu Keluarga", icFamilyCard, 11),
    ServicesMenu("Izin Nikah", icMarriagePermit, 12),
    ServicesMenu("Izin Usaha", icBusinessPermit, 13),
    ServicesMenu("Pindahan", icMovePermit, 14),
  ];

  late UserUsecase _usecase;

  ServicesViewModel() {
    _usecase = new UserUsecase(UserRepository(dioClient));
  }
}

import 'dart:async';

import 'package:valburytest/commons/base_view_model.dart';
import 'package:valburytest/commons/multilanguage.dart';
import 'package:valburytest/constants/images.dart';
import 'package:valburytest/model/entity/banners.dart';
import 'package:valburytest/model/entity/chips.dart';
import 'package:valburytest/model/entity/rs_clinic.dart';
import 'package:valburytest/repository/user_repository.dart';
import 'package:valburytest/usecases/user/user_usecase.dart';

import 'dashboard_navigator.dart';

class DashboardViewModel extends BaseViewModel<DashboardNavigator> {
  late UserUsecase _usecase;

  bool rsLoadingChip = true;
  bool rsLoadingList = true;

  bool clinicLoadingChip = true;
  bool clinicLoadingList = true;

  DashboardViewModel() {
    _usecase = new UserUsecase(UserRepository(dioClient));
  }

  void getData() {
    //mock data rs chip
    Timer(Duration(seconds: 3), () {
      populateRsChip();
      populateClinicChip();
      populateBanner();
    });
  }

  void populateRsChip() {
    List<Chips> dummyChips = [
      Chips(1, txt("all"), true),
      Chips(2, "BPJS"),
      Chips(3, "Partner"),
      Chips(4, txt("nearest"))
    ];
    getView()?.populateRsChips(dummyChips);
    Timer(Duration(seconds: 2), () => reloadRsList(true, dummyChips[0].id));
  }

  void populateClinicChip() {
    List<Chips> dummyChips = [
      Chips(1, txt("all"), true),
      Chips(2, "BPJS"),
      Chips(3, "Partner"),
      Chips(4, txt("nearest"))
    ];
    getView()?.populateClinicChips(dummyChips);
    Timer(Duration(seconds: 2), () => reloadClinicList(true, dummyChips[0].id));
  }

  void reloadRsList(bool init, int id) {
    Future.delayed(Duration(milliseconds: init ? 0 : 2000), () {
      List<RSClinic> dummyRs = [
        RSClinic(1, "RS Eka Hospital BSD", imgRsEka,
            "Central Business District Lot. IX, Jl. Boulevard BSD Tim., Lengkong Gudang, Kec. Serpong, Kota Tangerang Selatan, Banten 15321"),
        RSClinic(2, "RS Siloam Semanggi", imgRsSiloam,
            "Jalan Garnisiun Dalam No 2-3, Daerah Khusus Ibukota Jakarta 12930"),
        RSClinic(3, "RSCM Kencana ", imgRsCipto,
            "Jl. Pangeran Diponegoro No.71, RW.5, Kenari, Kec. Senen, Kota Jakarta Pusat, Daerah Khusus Ibukota Jakarta 10430")
      ];
      dummyRs.shuffle();
      getView()?.populateRsList(dummyRs);
    });
  }

  void reloadClinicList(bool init, int id) {
    Future.delayed(Duration(milliseconds: init ? 0 : 2000), () {
      List<RSClinic> dummyClinic = [
        RSClinic(1, "Klinik Depok Tua", klinikDepokTua,
            "No. 10-11, Jl. Moh. Yusuf Raya, Mekar Jaya, Kec. Sukmajaya, Kota Depok, Jawa Barat 16411"),
        RSClinic(2, "Klinik Kayu Besar", klinikKayu,
            "Jalan Kapuk Raya Kayu Besar, RT.13/RW.11, Cengkareng Timur, Cengkareng, RT.13/RW.11, Cengkareng Tim., Kecamatan Cengkareng, Kota Jakarta Barat, Daerah Khusus Ibukota Jakarta 11730"),
        RSClinic(3, "Klinik Kecantikan Medisa Mangga Besar ", klinikMedisa,
            "Jl. Mangga Besar IV No.46, RT.2/RW.3, Taman Sari, Kec. Taman Sari, Kota Jakarta Barat, Daerah Khusus Ibukota Jakarta 11150")
      ];
      dummyClinic.shuffle();
      getView()?.populateClinicList(dummyClinic);
    });
  }

  void populateBanner() {
    List<Banners> dummyBanners = [
      Banners(1, banner1),
      Banners(2, banner2),
      Banners(3, banner3),
    ];
    getView()?.populateBannerList(dummyBanners);
  }
}

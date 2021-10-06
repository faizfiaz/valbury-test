import 'package:valburytest/commons/base_navigator.dart';
import 'package:valburytest/model/entity/banners.dart';
import 'package:valburytest/model/entity/chips.dart';
import 'package:valburytest/model/entity/rs_clinic.dart';

abstract class DashboardNavigator extends BaseNavigator {
  void populateRsChips(List<Chips> dummyChips);

  void populateRsList(List<RSClinic> dummyRs);

  void populateBannerList(List<Banners> dummyBanners);

  void populateClinicChips(List<Chips> dummyChips);

  void populateClinicList(List<RSClinic> dummyClinic);
}

import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class BottomNavBarController extends GetxController {
  late PersistentTabController bottomTabscontroller;
  late bool hideNavBar;

  @override
  void onInit() {
    super.onInit();
    bottomTabscontroller = PersistentTabController(initialIndex: 0);
    hideNavBar = false;
  }

  @override
  void onClose() {}
}

import 'package:get/get.dart';

import '../controllers/pay_ticket_controller.dart';

class PayTicketBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PayTicketController>(
      () => PayTicketController(),
    );
  }
}

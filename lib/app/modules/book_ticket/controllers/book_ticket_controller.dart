import 'package:get/get.dart';
import 'package:movielistapp/app/data/models/movie_model.dart';

class BookTicketController extends GetxController {
  final MovieModel movieModel = Get.arguments[0];
  List<String> dates = [
    '5 Mar',
    '6 Mar',
    '7 Mar',
    '8 Mar',
    '9 Mar',
  ];

  @override
  void onClose() {}
}

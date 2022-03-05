import 'package:get/get.dart';

import '../controllers/single_movie_controller.dart';

class SingleMovieBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SingleMovieController>(
      () => SingleMovieController(),
    );
  }
}

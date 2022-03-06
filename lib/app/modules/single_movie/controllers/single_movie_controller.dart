import 'package:get/get.dart';
import 'package:movielistapp/app/data/models/movie_model.dart';
import 'package:movielistapp/core/services/movie_service.dart';

class SingleMovieController extends GetxController {
  final MovieModel movieModel = Get.arguments[0];
  final MovieService movieService = Get.find();
  final isLoading = false.obs;
  final isLandscape = false.obs;

  @override
  void onInit() async {
    super.onInit();
    print("****** Single Movie********");
    print(movieModel.toJson());
    await getMovieVideosById();
  }

  Future<void> getMovieVideosById() async {
    print("******Getting Movie Details");
    toggleLoading();
    await movieService.getMovieVideosById(movieId: movieModel.id);
    toggleLoading();
  }

  void toggleLoading() {
    isLoading.toggle();
    update();
  }

  @override
  void onClose() {}
}

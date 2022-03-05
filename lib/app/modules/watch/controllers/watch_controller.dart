import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:movielistapp/core/services/movie_service.dart';

class WatchController extends GetxController {
  final isLoading = false.obs;

  final Rx<TextEditingController> searchBarTextController =
      TextEditingController().obs;
  final MovieService movieService = Get.find();

  @override
  void onInit() async {
    super.onInit();
    await getMoviesGenre();
    await getUpComingMovies();
  }

  @override
  void onClose() {}

  Future<void> getMoviesGenre() async {
    toggleLoading();
    await movieService.getMoviesGenre().then((_) => toggleLoading());
    print("************Genre List*************");
    print(movieService.genresList.toJson());
  }

  Future<void> getUpComingMovies() async {
    toggleLoading();
    await movieService.getUpComingMovies().then((_) => toggleLoading());
    print("************Movies List*************");
    print(movieService.upComingMoviesList.toJson());
  }

  void toggleLoading() {
    isLoading.toggle();
    update();
  }
}

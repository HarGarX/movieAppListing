import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movielistapp/app/data/models/search_result_model.dart';
import 'package:movielistapp/core/services/movie_service.dart';

class SearchResultController extends GetxController {
  final isLoading = false.obs;
  final MovieService movieService = Get.find();
  final noResult = false.obs;

  final TextEditingController searchBarTextController = TextEditingController();
  final searchMoviesByTermResultList = RxList<SearchResultModel>();
  SearchResultController() {
    // searchBarTextController.listen((searchBarTextController) {
    //   print(searchBarTextController);
    // });
  }
  @override
  void onInit() {
    super.onInit();
    searchBarTextController.addListener(() async {
      print(searchBarTextController.text);
      filterSearchResults(searchBarTextController.text);
    });
  }

  @override
  void onClose() {}

  void filterSearchResults(String query) async {
    if (query.isNotEmpty && query.length > 5) {
      toggleLoading();
      await movieService
          .searchMovieByTitle(searchTerm: query)
          .then((apiMovieSearchResultList) {
        if (apiMovieSearchResultList.isNotEmpty) {
          searchMoviesByTermResultList(apiMovieSearchResultList);
          for (var element in searchMoviesByTermResultList) {
            print("/*/*/*/*/*/* ${searchMoviesByTermResultList.length}");
            print(element.backdropPath);
          }
          toggleLoading();
        } else {
          toggleLoading();
        }
      });
    } else {}
  }

  void toggleLoading() {
    isLoading.toggle();
    update();
  }
}

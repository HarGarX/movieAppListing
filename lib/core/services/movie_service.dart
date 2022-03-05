import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movielistapp/app/data/models/genre_model.dart';
import 'package:movielistapp/app/data/models/movie_model.dart';
import 'package:movielistapp/app/data/models/movie_video_model.dart';
import 'package:movielistapp/app/data/models/search_result_model.dart';
import 'package:movielistapp/app/data/providers/movie_provider.dart';
import 'package:movielistapp/app/data/repositories/movie_repository.dart';

class MovieService extends GetxService {
  late final MovieProvider movieProvider;
  late final MovieRepository movieRepository;
  final genresList = RxList<GenreModel>();
  final upComingMoviesList = RxList<MovieModel>();
  final movieVideoList = RxList<MovieVideoModel>();
  final searchMoviesByTermResultList = RxList<SearchResultModel>();

  Future<MovieService> init() async {
    movieProvider = MovieProvider();
    movieRepository = MovieRepository(movieProvider: movieProvider);
    print('$runtimeType delays 2 sec');
    await 2.delay();
    print('$runtimeType ready!');
    return this;
  }

  Future<void> getMoviesGenre() async {
    await movieRepository.getMoviesGenre().then((apiGenresList) {
      genresList(apiGenresList);
      print(genresList.toJson());
    });
  }

  Future<void> getUpComingMovies() async {
    await movieRepository.getUpComingMovies().then((apiUpComingMoviesList) {
      upComingMoviesList(apiUpComingMoviesList);
      print(upComingMoviesList.toJson());
    });
  }

  Future<void> getMovieVideosById({required int movieId}) async {
    await movieRepository
        .getMovieVideosById(movieId: movieId)
        .then((apiMovieVideosList) {
      movieVideoList(apiMovieVideosList);
      print(movieVideoList.toJson());
    });
  }

  Future<RxList<SearchResultModel>> searchMovieByTitle(
      {required String searchTerm}) async {
    await movieRepository
        .searchMovieByTerm(searchTerm: searchTerm)
        .then((apiMovieSearchResultList) {
      searchMoviesByTermResultList(apiMovieSearchResultList);
    });

    return searchMoviesByTermResultList;
  }

  Color getGenreColor({required String genreName}) {
    switch (genreName) {
      case 'Action':
        return Color(0xff15D2BC);
      case 'Crime':
        return Color(0xFFC51206);
      case 'Thriller':
        return Color(0xffE26CA5);
      case 'Science Fiction':
        return Color(0xff564CA3);
      case 'Fantasy':
        return Color(0xffCD9D0F);
      default:
        return Color(0xff2E2739);
    }
  }

  String getGenreName({required int genreId}) {
    String genreName = '';
    for (var genre in genresList) {
      print("//Movie Genre ${genre.id}");
      print("//Movie Serach $genreId");

      if (genre.id == genreId) {
        return genre.name;
      }
    }
    return genreName ?? 'Un named';
  }
}

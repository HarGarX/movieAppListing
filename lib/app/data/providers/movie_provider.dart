import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:movielistapp/app/data/models/genre_model.dart';
import 'package:movielistapp/app/data/models/movie_model.dart';
import 'package:movielistapp/app/data/models/movie_video_model.dart';
import 'package:movielistapp/app/data/models/search_result_model.dart';
import 'package:movielistapp/app/data/repositories/movie_repository.dart';

class MovieProvider extends GetConnect implements MovieRepositoryDAO {
  static const String apiKey = '259f88559587d69d838d005f57b77929';
  @override
  void onInit() {
    // httpClient.baseUrl = 'https://api.themoviedb.org';
    //  apiKey = '259f88559587d69d838d005f57b77929';
  }

  @override
  Future<List<GenreModel>> getMoviesGenre() async {
    try {
      final response = await httpClient
          .get('https://api.themoviedb.org/3/genre/movie/list?api_key=$apiKey');
      if (response.statusCode == 200) {
        final genresList = await compute(
          genresModelFromJson,
          jsonEncode(
            response.body['genres'],
          ),
        );
        return genresList;
      } else {
        print("********** From Provider getMoviesGenre() ***************");
        print(response);
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  @override
  Future<List<MovieModel>> getUpComingMovies() async {
    try {
      final response = await httpClient
          .get('https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey');
      if (response.statusCode == 200) {
        final upComingMoviesList = await compute(
          moviesModelFromJson,
          jsonEncode(
            response.body['results'],
          ),
        );
        return upComingMoviesList;
      } else {
        print("********** From Provider getUpComingMovies() ***************");
        print(response);
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  @override
  Future<List<MovieVideoModel>> getMovieVideosById(
      {required int movieId}) async {
    try {
      final response = await httpClient.get(
          'https://api.themoviedb.org/3/movie/$movieId/videos?api_key=$apiKey');
      if (response.statusCode == 200) {
        final movieVideosList = await compute(
          moviesVideoModelFromJson,
          jsonEncode(
            response.body['results'],
          ),
        );
        return movieVideosList;
      } else {
        print("********** From Provider getMovieVideosById() ***************");
        print(response);
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  @override
  Future<List<SearchResultModel>> searchMovieByTerm(
      {required String searchTerm}) async {
    try {
      final response = await httpClient.get(
          'https://api.themoviedb.org/3/search/movie?api_key=$apiKey&query=$searchTerm');
      if (response.statusCode == 200) {
        final searchMovieByTermResult = await compute(
          searchResultsModelFromJson,
          jsonEncode(
            response.body['results'],
          ),
        );
        print(
            "********** From Provider searchMovieByTerm() Response 200***************");
        print(response.body['results']);
        return searchMovieByTermResult;
      } else {
        print("********** From Provider searchMovieByTerm() ***************");
        print(response.toString());
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}

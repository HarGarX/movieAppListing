import 'package:movielistapp/app/data/models/genre_model.dart';
import 'package:movielistapp/app/data/models/movie_model.dart';
import 'package:movielistapp/app/data/models/movie_video_model.dart';
import 'package:movielistapp/app/data/models/search_result_model.dart';
import 'package:movielistapp/app/data/providers/movie_provider.dart';

class MovieRepository implements MovieRepositoryDAO {
  final MovieProvider movieProvider;
  MovieRepository({
    required this.movieProvider,
  });

  @override
  Future<List<GenreModel>> getMoviesGenre() async {
    return await movieProvider.getMoviesGenre();
  }

  @override
  Future<List<MovieModel>> getUpComingMovies() async {
    return await movieProvider.getUpComingMovies();
  }

  @override
  Future<List<MovieVideoModel>> getMovieVideosById(
      {required int movieId}) async {
    return await movieProvider.getMovieVideosById(movieId: movieId);
  }

  @override
  Future<List<SearchResultModel>> searchMovieByTerm(
      {required String searchTerm}) async {
    return await movieProvider.searchMovieByTerm(searchTerm: searchTerm);
  }
}

abstract class MovieRepositoryDAO {
  Future<List<MovieModel>> getUpComingMovies();
  Future<List<GenreModel>> getMoviesGenre();
  Future<List<MovieVideoModel>> getMovieVideosById({required int movieId});
  Future<List<SearchResultModel>> searchMovieByTerm(
      {required String searchTerm});
}

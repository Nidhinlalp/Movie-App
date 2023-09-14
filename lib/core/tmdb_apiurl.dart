import 'package:movie_app/core/api_key.dart';

class TmdbApiUrl {
  static const baseUrl = "https://api.themoviedb.org/3";
  static const imageBaseUrl = "https://image.tmdb.org/t/p/w500";
  static const youtubeBaseUrl = "https://www.youtube.com/watch?v=";
  static const upcomingMoviesUrl = "$baseUrl/movie/upcoming?api_key=$apiKey";
  static String trailerMoviesUrl(String movieID) {
    return "$baseUrl/movie/$movieID/videos?api_key=$apiKey";
  }
}

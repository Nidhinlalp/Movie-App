class MoviesModel {
  int id;
  String title;
  String overview;
  String releaseDate;
  String posterPath;
  String backdropPath;
  List<int> genreIds;
  bool adult;
  bool video;
  num popularity;
  num voteAverage;
  int voteCount;

  MoviesModel({
    required this.id,
    required this.title,
    required this.overview,
    required this.releaseDate,
    required this.posterPath,
    required this.backdropPath,
    required this.genreIds,
    required this.adult,
    required this.video,
    required this.popularity,
    required this.voteAverage,
    required this.voteCount,
  });

  factory MoviesModel.fromJson(Map<String, dynamic> json) {
    return MoviesModel(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      releaseDate: json['release_date'],
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
      genreIds: List<int>.from(json['genre_ids']),
      adult: json['adult'],
      video: json['video'],
      popularity: json['popularity'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
    );
  }
}

class MovieListResponse {
  int page;
  List<MoviesModel> results;

  MovieListResponse({
    required this.page,
    required this.results,
  });

  factory MovieListResponse.fromJson(Map<String, dynamic> json) {
    return MovieListResponse(
      page: json['page'],
      results: List<MoviesModel>.from(
        json['results'].map(
          (movieJson) => MoviesModel.fromJson(movieJson),
        ),
      ),
    );
  }
}

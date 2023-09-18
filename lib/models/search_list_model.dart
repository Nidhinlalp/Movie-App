import '../core/tmdb_apiurl.dart';

class SearchListModel {
  List<SearchMovieModel> movieModelList = [];

  SearchListModel(this.movieModelList);

  SearchListModel.fromJson(Map<String, dynamic> json) {
    for (int index = 0; index < json["results"].length; index++) {
      movieModelList.add(
        SearchMovieModel(
          json["results"][index]["id"].toString(),
          json["results"][index]["title"] ?? json["results"][index]["name"],
          "${TmdbApiUrl.imageBaseUrl}${json["results"][index]["backdrop_path"]}",
          "${TmdbApiUrl.imageBaseUrl}${json["results"][index]["poster_path"]}",
          json["results"][index]["overview"],
        ),
      );
    }
  }
}

class SearchMovieModel {
  String id;
  String imageUrl;
  String posterUrl;
  String movieName;
  String descriptions;

  SearchMovieModel(
    this.id,
    this.movieName,
    this.imageUrl,
    this.posterUrl,
    this.descriptions,
  );
}

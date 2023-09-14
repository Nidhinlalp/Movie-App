import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:movie_app/core/tmdb_apiurl.dart';
import 'package:movie_app/models/movie_list.dart';

class HomeRepository {
  // Function to fetch upcoming movies
  Future<List<MoviesModel>?> fetchMovie() async {
    try {
      // Send an HTTP GET request to the TMDB API
      final response = await http.get(Uri.parse(TmdbApiUrl.upcomingMoviesUrl));

      // Check if the response status code is 200 (OK) or 201 (Created)
      if (response.statusCode == 200 || response.statusCode == 201) {
        // Parse the JSON response into a MovieListResponse object
        final movieListResponse =
            MovieListResponse.fromJson(json.decode(response.body));

        // Extract the list of movies from the response
        final movies = movieListResponse.results;

        // Return the list of movies
        return movies;
      } else {
        // If the response status code is not 200 or 201, return null
        return null;
      }
    } catch (e) {
      // Handle any exceptions that occur during the HTTP request
      log(e.toString());
    }

    // Return null if an error occurs
    return null;
  }
}

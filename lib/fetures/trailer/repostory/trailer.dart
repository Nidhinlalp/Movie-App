import 'package:movie_app/core/tmdb_apiurl.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import '../../../models/trailer_model.dart';

// TrailerRepository: Handles the fetching of movie trailers from an API.
class TrailerRepository {
  // fetchMovieTrailers: Fetches movie trailers for a given movie ID.
  Future<List<TrailerModel>?> fetchMovieTrailers(String movieID) async {
    try {
      // Send an HTTP GET request to the TMDB API using the provided movieID
      final response =
          await http.get(Uri.parse(TmdbApiUrl.trailerMoviesUrl(movieID)));

      // Check if the response status code is 200 (OK) or 201 (Created)
      log('Response Status Code: ${response.statusCode}');
      if (response.statusCode == 200 || response.statusCode == 201) {
        // Parse the JSON response into a list of TrailerModel objects
        final json = jsonDecode(response.body);
        final trailerList = (json['results'] as List<dynamic>)
            .cast<Map<String, dynamic>>()
            .map((e) => TrailerModel.fromJson(e))
            .toList();

        // Return the list of movie trailers
        return trailerList;
      } else {
        // If the response status code is not 200 or 201, return null
        return null;
      }
    } catch (e) {
      // Handle any exceptions that occur during the HTTP request and log them
      log('Error fetching movie trailers: $e');
    }

    // Return null if an error occurs
    return null;
  }
}

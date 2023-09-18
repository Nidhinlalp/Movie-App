import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/fetures/search/repository/debouncer.dart';

import '../../../core/tmdb_apiurl.dart';
import '../../../models/search_list_model.dart';

class SearchRepository extends ChangeNotifier {
  SearchListModel? searchResultData;

  final Debouncer _debouncer = Debouncer(miiliseconds: 500);

  /// Call this function when the text in the search input field changes.
  void onTextChanged(String query) {
    _debouncer.run(() {
      fetchSearchResults(query);
    });
  }

  /// Fetch search results based on the provided query.
  void fetchSearchResults(String query) async {
    try {
      final response =
          await http.get(Uri.parse("${TmdbApiUrl.searchBaseUrl}$query"));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);

        searchResultData = SearchListModel.fromJson(jsonData);
        notifyListeners();
      } else {
        log('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      log('Error: $e');
    }
  }
}

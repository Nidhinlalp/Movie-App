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
  void onTextChanged(String query) {
    // This function will be debounced and only executed after a 500ms delay
    _debouncer.run(() {
      getSearchResult(query);
      print('Search for: $query');
      // Perform your search or other action here
    });
  }

  void getSearchResult(String query) async {
    try {
      var response =
          await http.get(Uri.parse("${TmdbApiUrl.searchBaseUrl}$query"));
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);

        searchResultData = SearchListModel.fromJson(json);
        notifyListeners();
        log(searchResultData!.movieModelList[0].imageUrl);
      }
    } catch (e) {
      log("getSearchResult: Failed to load Data!");
    }
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:movie_app/fetures/home/controller/home_controller.dart';

import 'package:movie_app/fetures/search/widgets/search_intractive.dart';
import 'package:movie_app/models/movie_list.dart';
import 'package:provider/provider.dart';

import '../../../core/tmdb_apiurl.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    final List<MoviesModel?> moviesModel =
        context.watch<HomeController>().result;
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      childAspectRatio: 1 / 1.5,
      children: List.generate(
        moviesModel.length,
        (index) {
          return MainCard(
            imageurl:
                "${TmdbApiUrl.imageBaseUrl}${moviesModel[index]!.posterPath}",
          );
        },
      ),
    );
  }
}

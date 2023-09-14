import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movie_app/constants/color/color.dart';
import 'package:movie_app/core/tmdb_apiurl.dart';

import '../../../models/movie_list.dart';

class BackgroundListView extends StatefulWidget {
  final ScrollController backgroundScrollController;
  final List<MoviesModel?> moviesModel;
  const BackgroundListView({
    super.key,
    required this.backgroundScrollController,
    required this.moviesModel,
  });

  @override
  State<BackgroundListView> createState() => _BackgroundListViewState();
}

class _BackgroundListViewState extends State<BackgroundListView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    log(widget.moviesModel.length.toString());
    return ListView.builder(
      controller: widget.backgroundScrollController,
      padding: EdgeInsets.zero,
      reverse: true,
      itemCount: widget.moviesModel.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (ctx, index) {
        return SizedBox(
          width: size.width,
          height: size.height,
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Positioned(
                left: -size.width / 3,
                right: -size.width / 3,
                child: Image.network(
                  '${TmdbApiUrl.imageBaseUrl}${widget.moviesModel[index]!.posterPath}',
                  fit: BoxFit.cover,
                ),
              ),
              Container(color: black.withOpacity(.4)),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      // black.withOpacity(.9),
                      black.withOpacity(.3),
                      black.withOpacity(.95)
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [0.5, 0.9],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

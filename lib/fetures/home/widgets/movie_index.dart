import 'package:flutter/material.dart';
import 'package:movie_app/constants/color/color.dart';
import 'package:movie_app/core/tmdb_apiurl.dart';
import 'package:movie_app/fetures/details/screens/detail_screen.dart';
import 'package:movie_app/constants/widget/star_rating.dart';

import '../../../models/movie_list.dart';

class MovieIndex extends StatefulWidget {
  final int index;
  final ScrollController movieScrollController;
  final double movieItemWidth;
  final List<MoviesModel?> moviesModel;

  const MovieIndex({
    super.key,
    required this.index,
    required this.movieScrollController,
    required this.movieItemWidth,
    required this.moviesModel,
  });

  @override
  State<MovieIndex> createState() => _MovieIndexState();
}

class _MovieIndexState extends State<MovieIndex> {
  double maxMovieTranslate = 65;

  double _movieTranslate(double offset, double activeOffset) {
    double translate;
    if (widget.movieScrollController.offset + widget.movieItemWidth <=
        activeOffset) {
      translate = maxMovieTranslate;
    } else if (widget.movieScrollController.offset <= activeOffset) {
      translate = maxMovieTranslate -
          ((widget.movieScrollController.offset -
                  (activeOffset - widget.movieItemWidth)) /
              widget.movieItemWidth *
              maxMovieTranslate);
    } else if (widget.movieScrollController.offset <
        activeOffset + widget.movieItemWidth) {
      translate = ((widget.movieScrollController.offset -
                  (activeOffset - widget.movieItemWidth)) /
              widget.movieItemWidth *
              maxMovieTranslate) -
          maxMovieTranslate;
    } else {
      translate = maxMovieTranslate;
    }
    return translate;
  }

  double _movieDescriptionOpacity(double offset, double activeOffset) {
    double opacity;
    if (widget.movieScrollController.offset + widget.movieItemWidth <=
        activeOffset) {
      opacity = 0;
    } else if (widget.movieScrollController.offset <= activeOffset) {
      opacity = ((widget.movieScrollController.offset -
              (activeOffset - widget.movieItemWidth)) /
          widget.movieItemWidth *
          100);
    } else if (widget.movieScrollController.offset <
        activeOffset + widget.movieItemWidth) {
      opacity = 100 -
          (((widget.movieScrollController.offset -
                      (activeOffset - widget.movieItemWidth)) /
                  widget.movieItemWidth *
                  100) -
              100);
    } else {
      opacity = 0;
    }
    return opacity;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: appPadding + 4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          AnimatedBuilder(
            animation: widget.movieScrollController,
            builder: (ctx, child) {
              double activeOffset = widget.index * widget.movieItemWidth;

              double translate = _movieTranslate(
                  widget.movieScrollController.offset, activeOffset);

              return SizedBox(height: translate);
            },
          ),
          SizedBox(height: size.height * .08),

          //  ------ Title

          SizedBox(
            height: size.height * .1,
            child: Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(
                    widget.moviesModel[widget.index]!.title,
                    style: TextStyle(
                      color: white,
                      fontSize: size.width / 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: size.height * .000001),

          //---------- Star Rating
          StarRating(rating: widget.moviesModel[widget.index]!.voteAverage),
          SizedBox(height: size.height * .01),
          Container(
            width: size.width * .25,
            height: 1,
            color: secondary.withOpacity(0.5),
          ),
          SizedBox(height: size.height * .01),
          SizedBox(height: size.height * .01),
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, a1, a2) => DetailScreen(
                  index: widget.index,
                  moviesModel: widget.moviesModel,
                  size: size,
                ),
              ),
            ),
            // --------- Movie Image
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: Image.network(
                '${TmdbApiUrl.imageBaseUrl}${widget.moviesModel[widget.index]!.posterPath}',
                width: size.width * 0.5,
                height: size.height * 0.35,
              ),
            ),
          ),
          SizedBox(height: size.height * .02),

          // ------------- Movie Name

          Row(
            children: [
              Text(
                'Vote: ',
                style: TextStyle(
                  color: white,
                  fontSize: size.width / 14,
                  fontWeight: FontWeight.w200,
                ),
              ),
              Text(
                widget.moviesModel[widget.index]!.voteCount.toString(),
                style: TextStyle(
                  color: white,
                  fontSize: size.width / 14,
                  fontWeight: FontWeight.w200,
                ),
              ),
            ],
          ),
          AnimatedBuilder(
            animation: widget.movieScrollController,
            builder: (context, child) {
              double activeOffset = widget.index * widget.movieItemWidth;
              double opacity = _movieDescriptionOpacity(
                widget.movieScrollController.offset,
                activeOffset,
              );

              return Opacity(
                opacity: opacity / 100,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: size.height * .01,
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

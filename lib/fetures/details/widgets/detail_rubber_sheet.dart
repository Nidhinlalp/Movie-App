import 'package:flutter/material.dart';
import 'package:movie_app/constants/color/color.dart';
import 'package:movie_app/models/movie_list.dart';
import 'package:movie_app/constants/widget/star_rating.dart';
import 'package:rubber/rubber.dart';

import '../../../core/tmdb_apiurl.dart';

class DetailRubberSheet extends StatelessWidget {
  final List<MoviesModel?> moviesModel;
  final int index;

  final ScrollController rubberSheetScrollController;
  final RubberAnimationController rubberSheetAnimationController;
  const DetailRubberSheet({
    super.key,
    required this.rubberSheetScrollController,
    required this.rubberSheetAnimationController,
    required this.moviesModel,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 600),
      tween: Tween<double>(begin: size.height / 2, end: 0),
      builder: (_, value, child) {
        return Transform.translate(
          offset: Offset(0, value),
          child: child,
        );
      },
      child: RubberBottomSheet(
        scrollController: rubberSheetScrollController,
        animationController: rubberSheetAnimationController,
        lowerLayer: Container(
          color: Colors.transparent,
        ),
        upperLayer: Column(
          children: [
            // --------- Movie PosterPath
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.network(
                  '${TmdbApiUrl.imageBaseUrl}${moviesModel[index]!.posterPath}',
                  width: size.width / 2,
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(50.0),
                  ),
                ),
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(appPadding),
                  controller: rubberSheetScrollController,
                  children: [
                    // --------- Movie Name
                    Text(
                      moviesModel[index]!.title,
                      style: const TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8.0),

                    const SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          moviesModel[index]!.voteAverage.toString(),
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        // ---------- Star Rating
                        StarRating(
                          rating: moviesModel[index]!.voteAverage,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),

                    const Text(
                      'Overview',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    Text(
                      moviesModel[index]!.overview,
                      style: TextStyle(
                        fontSize: 15,
                        color: black.withOpacity(0.6),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 100.0),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

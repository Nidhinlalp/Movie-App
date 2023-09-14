import 'package:flutter/material.dart';
import 'package:movie_app/fetures/home/widgets/movie_index.dart';
import 'package:movie_app/models/movie_list.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

class MovieListView extends StatefulWidget {
  final ScrollController movieScrollController;
  final double movieItemWidth;
  final List<MoviesModel?> moviesModel;
  const MovieListView({
    super.key,
    required this.movieScrollController,
    required this.movieItemWidth,
    required this.moviesModel,
  });

  @override
  State<MovieListView> createState() => _MovieListViewState();
}

class _MovieListViewState extends State<MovieListView> {
  @override
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 700),
      tween: Tween<double>(begin: 600, end: 0),
      curve: Curves.easeOutCubic,
      builder: (_, value, child) {
        return Transform.translate(
          offset: Offset(value, 0),
          child: child,
        );
      },
      child: SizedBox(
        height: size.height * .8,
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overScroll) {
            overScroll.disallowIndicator();
            return true;
          },
          child: ScrollSnapList(
            listController: widget.movieScrollController,
            onItemFocus: (item) {},
            itemSize: widget.movieItemWidth,
            padding: EdgeInsets.zero,
            itemCount: widget.moviesModel.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return MovieIndex(
                index: index,
                movieScrollController: widget.movieScrollController,
                movieItemWidth: widget.movieItemWidth,
                moviesModel: widget.moviesModel,
              );
            },
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movie_app/constants/color/color.dart';
import 'package:movie_app/fetures/home/controller/home_controller.dart';
import 'package:movie_app/fetures/home/widgets/background_list_view.dart';
import 'package:movie_app/constants/widget/custom_appbar.dart';
import 'package:movie_app/fetures/home/widgets/movie_list_view.dart';
import 'package:movie_app/models/movie_list.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<HomeController>().fetchMovieData(context);
    super.initState();
  }

  Size get size => MediaQuery.of(context).size;

  //to Center the movie List View
  double get movieItemWidth => size.width / 2 + 48;

  ScrollController backgroundScrollController = ScrollController();
  ScrollController movieScrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    final List<MoviesModel?> moviesModel =
        context.watch<HomeController>().result;
    // connecting Background list and Movie list
    movieScrollController.addListener(
      () {
        backgroundScrollController.jumpTo(
          movieScrollController.offset * (size.width / movieItemWidth),
        );
      },
    );
    return Scaffold(
      backgroundColor: black,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          //Background of home screen
          BackgroundListView(
            backgroundScrollController: backgroundScrollController,
            moviesModel: moviesModel,
          ),

          //Movie detail List view
          MovieListView(
            movieScrollController: movieScrollController,
            movieItemWidth: movieItemWidth,
            moviesModel: moviesModel,
          ),

          //Appbar
          const CustomAppBar(),
        ],
      ),
    );
  }
}

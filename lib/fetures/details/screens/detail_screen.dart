import 'package:flutter/material.dart';
import 'package:movie_app/constants/color/color.dart'; // Corrected the import path
import 'package:movie_app/models/trailer_model.dart';
import 'package:rubber/rubber.dart';

import '../../../models/movie_list.dart';
import '../../trailer/repostory/trailer.dart';
import '../widgets/background.dart';
import '../../../constants/widget/costom_back_button.dart';
import '../widgets/detail_rubber_sheet.dart';
import '../widgets/trailer_button.dart';

class DetailScreen extends StatefulWidget {
  final Size size;
  final int index;
  final List<MoviesModel?> moviesModel;

  const DetailScreen({
    super.key,
    required this.size,
    required this.moviesModel,
    required this.index,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with TickerProviderStateMixin {
  RubberAnimationController? rubberAnimationSheetController;
  ScrollController? rubberSheetScrollController;
  final TrailerRepository _trailerRepository = TrailerRepository();
  late Future<List<TrailerModel>?> trailerModel;

  @override
  void initState() {
    super.initState();
    trailerModel = _trailerRepository.fetchMovieTrailers(
      widget.moviesModel[widget.index]!.id.toString(),
    );
    rubberSheetScrollController = ScrollController();
    rubberAnimationSheetController = RubberAnimationController(
      vsync: this,
      lowerBoundValue:
          AnimationControllerValue(pixel: widget.size.height * 0.75),
      dismissable: false,
      upperBoundValue: AnimationControllerValue(percentage: 0.9),
      duration: const Duration(milliseconds: 300),
      springDescription: SpringDescription.withDampingRatio(
        mass: 1,
        stiffness: Stiffness.LOW,
        ratio: DampingRatio.MEDIUM_BOUNCY,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: Stack(
        alignment: Alignment.center,
        children: [
          // Background movie image
          Background(
            background: widget.moviesModel[widget.index]!.backdropPath,
          ),

          // Bottom sheet
          DetailRubberSheet(
            index: widget.index,
            moviesModel: widget.moviesModel,
            rubberSheetScrollController: rubberSheetScrollController!,
            rubberSheetAnimationController: rubberAnimationSheetController!,
          ),

          // Trailer button
          TrailerButton(trailerModel: trailerModel),

          // Back button
          const CustomBackButton(),
        ],
      ),
    );
  }
}

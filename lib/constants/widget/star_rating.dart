import 'package:flutter/material.dart';
import 'package:movie_app/constants/color/color.dart';

class StarRating extends StatelessWidget {
  final num rating;
  const StarRating({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    Widget star(bool fill) {
      return Icon(
        Icons.star,
        size: 18.0,
        color: fill ? primary : grey,
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        5,
        (index) {
          if (index < (rating / 2).round()) {
            return star(true);
          } else {
            return star(false);
          }
        },
      ),
    );
  }
}

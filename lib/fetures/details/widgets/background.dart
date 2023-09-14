import 'package:flutter/material.dart';
import 'package:movie_app/constants/color/color.dart';
import 'package:movie_app/core/tmdb_apiurl.dart';

class Background extends StatelessWidget {
  final String background;
  const Background({super.key, required this.background});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Positioned(
      top: -48,
      bottom: 0,
      child: TweenAnimationBuilder(
        duration: const Duration(milliseconds: 700),
        tween: Tween<double>(begin: 0.25, end: 1),
        builder: (_, value, child) {
          return Transform.scale(
            scale: value,
            child: child,
          );
        },
        child: Stack(
          children: [
            Image.network(
              '${TmdbApiUrl.imageBaseUrl}$background',
              width: size.width,
              height: size.height,
              fit: BoxFit.cover,
            ),
            Container(
              width: size.width,
              height: size.height,
              color: black.withOpacity(0.6),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movie_app/constants/color/color.dart';
import 'package:movie_app/fetures/trailer/screens/trailer.dart';
import 'package:movie_app/models/trailer_model.dart';

class TrailerButton extends StatelessWidget {
  const TrailerButton({super.key, required this.trailerModel});
  final Future<List<TrailerModel>?> trailerModel;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Positioned(
      bottom: 0,
      child: Container(
        width: size.width * 0.9,
        height: size.height * 0.08,
        margin: EdgeInsets.symmetric(vertical: size.width * 0.05),
        child: ElevatedButton(
          onPressed: () async {
            trailerModel.then(
              (value) => showDialog(
                context: context,
                builder: (context) {
                  return TrailerPage(trailerModel: value);
                },
              ),
            );
          },
          child: const Text(
            'Watch Trailer',
            style: TextStyle(
              color: white,
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movie_app/constants/color/color.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Positioned(
      left: 16,
      top: MediaQuery.of(context).padding.top + appPadding,
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Padding(
          padding: const EdgeInsets.all(appPadding / 2),
          child: Container(
            height: size.height * 0.075,
            width: size.width * 0.15,
            decoration: BoxDecoration(
              color: black.withOpacity(0.4),
              border: Border.all(
                color: white.withOpacity(0.35),
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: const Icon(
              Icons.arrow_back_ios,
              color: white,
              size: 18,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/constants/color/color.dart';

import '../../fetures/search/widgets/search_intractive.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: appPadding * 2.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: size.height * 0.075,
              width: size.width * 0.15,
              decoration: BoxDecoration(
                border: Border.all(
                  color: white.withOpacity(0.35),
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: const Icon(
                Icons.clear_all_rounded,
                color: white,
                size: 30.0,
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => const SearchResultwidget(),
                ),
              ),
              child: Container(
                height: size.height * 0.075,
                width: size.width * 0.7,
                decoration: BoxDecoration(
                    border: Border.all(color: white.withOpacity(0.35)),
                    borderRadius: BorderRadius.circular(20.0)),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: appPadding / 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Search Movies',
                        style: TextStyle(color: white, letterSpacing: 1.0),
                      ),
                      Icon(
                        Icons.search,
                        size: 30.0,
                        color: white,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

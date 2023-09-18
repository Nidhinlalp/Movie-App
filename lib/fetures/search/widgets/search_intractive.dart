import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/constants/widget/loader.dart';
import 'package:movie_app/fetures/search/repository/get_serch_result.dart';
import 'package:movie_app/fetures/search/screens/serch_screen.dart';
import 'package:provider/provider.dart';

class SearchResultwidget extends StatefulWidget {
  const SearchResultwidget({super.key});

  @override
  State<SearchResultwidget> createState() => _SearchResultwidgetState();
}

class _SearchResultwidgetState extends State<SearchResultwidget> {
  TextEditingController searchController = TextEditingController();
  SearchRepository searchRepository = SearchRepository();
  @override
  Widget build(BuildContext context) {
    final myData = Provider.of<SearchRepository>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 50),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CupertinoSearchTextField(
            controller: searchController,
            style: const TextStyle(color: Colors.black),
            backgroundColor: Colors.grey[900],
            itemColor: Colors.grey,
            onSubmitted: (value) {
              myData.getSearchResult(value);
              setState(() {});
            },
          ),
        ),
        Expanded(
          child: searchController.text.isEmpty
              ? const SearchScreen()
              : myData.searchResultData == null
                  ? const Loader()
                  : GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 3,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      childAspectRatio: 1 / 1.5,
                      children: List.generate(
                        myData.searchResultData!.movieModelList.length,
                        (index) {
                          return MainCard(
                            imageurl: myData.searchResultData!
                                .movieModelList[index].imageUrl,
                          );
                        },
                      ),
                    ),
        )
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  final String imageurl;
  const MainCard({super.key, required this.imageurl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageurl),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(7),
      ),
    );
  }
}

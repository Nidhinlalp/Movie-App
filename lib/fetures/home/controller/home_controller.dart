import 'package:flutter/widgets.dart';
import 'package:movie_app/constants/utils/utils.dart';
import '../../../models/movie_list.dart';
import '../repository/repository.dart';

// HomeController: Manages the state for the home screen.
class HomeController extends ChangeNotifier {
  final HomeRepository _homeRepository = HomeRepository();

  // List to store fetched movie data.
  List<MoviesModel?> result = [];

  // fetchMovieData: Fetches movie data from the repository and notifies listeners.
  Future<void> fetchMovieData(BuildContext context) async {
    try {
      final response = await _homeRepository.fetchMovie();

      // Check if the response is not null.
      if (response != null) {
        // Update the result list with the fetched data.
        result = response;
      } else {
        // Show Snackbar an error message if the response is null.
        if (context.mounted) {
          showSnackBar(context: context, content: 'Something went wrong');
        }
      }

      // Notify listeners to update the UI.
      notifyListeners();
    } catch (error) {
      // Handle any exceptions or errors that occur during the fetch operation.
      if (context.mounted) {
        showSnackBar(context: context, content: error.toString());
      }
    }
  }
}

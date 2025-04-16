import 'package:dio/dio.dart';
import 'package:movie_app/components/constants/strings.dart';
import 'package:movie_app/models/movie.dart';
// TODO add try catch to service

class MovieService {
  Map<String, String> headers = {
    "accept": ApiStrings.accept,
    "Authorization": ApiStrings.bearer,
  };
  // fetch popular,topRated,upcoming,trend movies --->
  Future<List<Movie>> getMovieList({
    required String url,
    required String errorMessage,
  }) async {
    Response response = await Dio().get(
      url,
      queryParameters: {'language': 'en-US', 'api_key': ApiStrings.apiKey},
      options: Options(method: ApiStrings.method, headers: headers),
    );
    if (response.statusCode == 200) {
      List<Movie> movieList =
          response.data['results']
              .map<Movie>((e) => Movie.fromJson(e))
              .toList();
      return movieList;
    } else {
      throw (errorMessage);
    }
  }

  // fetch movie details using movieId --->
  Future<Movie> getMovieDetails(int movieId) async {
    Response response = await Dio().get(
      options: Options(headers: headers, method: ApiStrings.method),
      'https://api.themoviedb.org/3/movie/$movieId?language=en-US',
    );
    if (response.statusCode == 200) {
      Movie movie = Movie.fromJson(response.data);
      return movie;
    } else {
      throw ('error while fetching movie details');
    }
  }
}

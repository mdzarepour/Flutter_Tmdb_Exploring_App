import 'package:dio/dio.dart';
import 'package:movie_app/components/constants/strings.dart';
import 'package:movie_app/models/movie.dart';

class MovieService {
  Map<String, String> headers = {
    "accept": ApiStrings.accept,
    "Authorization": ApiStrings.bearer,
  };

  Future<List<Movie>> getMovieList(
      {required String url, required String errorMessage}) async {
    Response response = await Dio().get(
      url,
      options: Options(
        method: ApiStrings.method,
        headers: headers,
      ),
    );
    if (response.statusCode == 200) {
      List<Movie> movieList = response.data['results']
          .map<Movie>((e) => Movie.fromJson(e))
          .toList();
      return movieList;
    } else {
      throw (errorMessage);
    }
  }

  Future<Movie> getMovieDetails(int movieId) async {
    Response response = await Dio().get(
        options: Options(
          headers: headers,
          method: ApiStrings.method,
        ),
        'https://api.themoviedb.org/3/movie/$movieId?language=en-US');
    if (response.statusCode == 200) {
      Movie movie = Movie.fromJson(response.data);
      return movie;
    } else {
      throw ('error while fetching movie details');
    }
  }
}

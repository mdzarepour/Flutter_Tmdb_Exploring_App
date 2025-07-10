import 'package:dio/dio.dart';
import 'package:movie_app/core/constants/constant_strings.dart';
import 'package:movie_app/models/movie_model.dart';

class MovieService {
  Map<String, String> headers = {
    "accept": CopnstantServiceStrings.accept,
    "Authorization": CopnstantServiceStrings.bearer,
  };
  // fetch popular,topRated,upcoming,trend movies --->
  Future<List<MovieModel>> getMovieList({required String url}) async {
    Response response = await Dio().get(
      url,
      queryParameters: {
        'language': 'en-US',
        'api_key': CopnstantServiceStrings.apiKey,
      },
      options: Options(
        method: CopnstantServiceStrings.method,
        headers: headers,
      ),
    );
    if (response.statusCode == 200) {
      List<MovieModel> movieList =
          response.data['results']
              .map<MovieModel>((e) => MovieModel.fromJson(e))
              .toList();
      return movieList;
    } else {
      throw ('error while fetching data');
    }
  }

  // fetch movie details using movieId --->
  Future<MovieModel> getMovieDetails(int movieId) async {
    Response response = await Dio().get(
      options: Options(
        headers: headers,
        method: CopnstantServiceStrings.method,
      ),
      'https://api.themoviedb.org/3/movie/$movieId?language=en-US',
    );
    if (response.statusCode == 200) {
      MovieModel movie = MovieModel.fromJson(response.data);
      return movie;
    } else {
      throw ('error while fetching movie details');
    }
  }
}

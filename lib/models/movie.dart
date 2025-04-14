class Movie {
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final String releaseDate;
  final String posterPath;
  final String backDropPath;
  final double popularity;
  final double voteAverage;
  final int id;
  Movie({
    required this.backDropPath,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.id,
  });
  factory Movie.fromJson(Map<String, dynamic> jsonMap) {
    const String backdropImageBaseUrl = 'https://image.tmdb.org/t/p/original/';
    const String posterImageBaseUrld =
        'https://image.tmdb.org/t/p/w500/'; // corrected this line
    return Movie(
      backDropPath: backdropImageBaseUrl + jsonMap['backdrop_path'],
      originalLanguage: jsonMap['original_language'],
      originalTitle: jsonMap['original_title'],
      overview: jsonMap['overview'],
      popularity: jsonMap['popularity'],
      posterPath: posterImageBaseUrld + jsonMap['poster_path'],
      releaseDate: jsonMap['release_date'],
      voteAverage: jsonMap['vote_average'],
      id: jsonMap['id'],
    );
  }
}

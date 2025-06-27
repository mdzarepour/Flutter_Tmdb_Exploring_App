class ApiStrings {
  static const String accept = 'application/json';
  static const String method = 'GET';
  static const String apiKey =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlOWFiYzJkNGY5NGViZWVmZjg1NWFiMTg0ODdhNDA1YiIsIm5iZiI6MS43NDM1MDk0MTI2MzY5OTk4ZSs5LCJzdWIiOiI2N2ViZDdhNGQ5OTgxZmRhMTg3YWIyNDEiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.IAKd_aVa1sqyyCX_FyGu63Es-xNksXXcAixz94fefCU';
  static const String bearer =
      ' Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlOWFiYzJkNGY5NGViZWVmZjg1NWFiMTg0ODdhNDA1YiIsIm5iZiI6MTc0MzUwOTQxMi42MzY5OTk4LCJzdWIiOiI2N2ViZDdhNGQ5OTgxZmRhMTg3YWIyNDEiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.kwrPc0wbLaRWt8o-I-ymh_X7AGaQKuwmNDKsIRJmadA';
  static const String popularVideosUrl =
      'https://api.themoviedb.org/3/movie/popular?language=en-US&page=1';
  static const String ratedVideosUrl =
      'https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1';
  static const String upcomingVideosUrl =
      'https://api.themoviedb.org/3/movie/upcoming?language=en-US&page=1';
  static const String trendingMoviesUrl =
      'https://api.themoviedb.org/3/trending/movie/day';
}

class UiString {
  static const catTitle1 = 'Popular Movies';
  static const catTitle2 = 'Top Rated Movies';
  static const catTitle3 = 'Upcoming Movies';
  static const connectionProplem = 'Oops Connection problem!';
  static const tryAgain = 'Try Again';
  static const snackBarMessage = 'Movies are already updated';
}

import 'package:tmdb_api/tmdb_api.dart';

class MoviesProvider {
  static String apiKey = '52d442ca74b2aa6c67159d0bc62bbeb2';
  static String readToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1MmQ0NDJjYTc0YjJhYTZjNjcxNTlkMGJjNjJiYmViMiIsInN1YiI6IjYwOWJmMzdhN2VjZDI4MDAyYWZiNDQ0YyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.rhHPbCZMUJtcu0-zobuXnfaL4bdXsvnWnrhSq2KqjQg';

  static final TMDB tmdbDataProvider = TMDB(
    ApiKeys(apiKey, readToken),
  );

  static List trendingMovies = [];
  static List popularMovies = [];
  static List topRatedMovies = [];

  static Future<void> getTrendingMovies() async {
    Map trending = await tmdbDataProvider.v3.trending.getTrending();
    if (trending.isNotEmpty) {
      trendingMovies.addAll(trending['results']);
    }
  }

  static Future<void> getPopularMovies() async {
    Map popular = await tmdbDataProvider.v3.movies.getPouplar();
    if (popular.isNotEmpty) {
      popularMovies.addAll(popular['results']);
    }
  }

  static Future<void> getTopRatedMovies() async {
    Map topRated = await tmdbDataProvider.v3.movies.getTopRated();
    if (topRated.isNotEmpty) {
      topRatedMovies.addAll(topRated['results']);
    }
  }
}

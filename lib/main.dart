import 'package:flutter/material.dart';
import 'package:nf_clone/provider/movies_provider.dart';
import 'package:nf_clone/ui/screens/splash_screen.dart';

void main() async {
  await MoviesProvider.getTrendingMovies();
  await MoviesProvider.getPopularMovies();
  await MoviesProvider.getTopRatedMovies();
  runApp(const NetflixCloneApp());
}

class NetflixCloneApp extends StatelessWidget {
  const NetflixCloneApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Netflix Clone",
      theme: ThemeData(
        fontFamily: 'Mont',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const SplashScreen(),
    );
  }
}

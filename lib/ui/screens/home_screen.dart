import 'package:flutter/material.dart';
import 'package:nf_clone/provider/movies_provider.dart';
import 'package:nf_clone/ui/widgets/movietiles_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Image.asset(
          'assets/images/netflix.png',
          width: 80.0,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              MoviesTileList(
                name: "Trending Now",
                moviesList: MoviesProvider.trendingMovies,
              ),
              MoviesTileList(
                name: "Popular Movies",
                moviesList: MoviesProvider.popularMovies,
              ),
              MoviesTileList(
                name: "Top Rated Movies",
                moviesList: MoviesProvider.topRatedMovies,
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:nf_clone/ui/widgets/movietile.dart';

class ListingScreen extends StatelessWidget {
  final String category;
  final List moviesList;
  const ListingScreen({
    Key? key,
    required this.category,
    required this.moviesList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: true,
        title: Text(
          category,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
          ),
        ),
      ),
      body: GridView.builder(
        itemCount: moviesList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.0,
          mainAxisSpacing: 8.0,
        ),
        itemBuilder: (context, index) {
          return MovieTile(
            imageUrl: moviesList[index]['poster_path'],
            movieId: moviesList[index]['id'],
            overview: moviesList[index]['overview'],
            title: moviesList[index]['title'] ?? "No Title",
            releaseDate: moviesList[index]['release_date'].toString(),
          );
        },
      ),
    );
  }
}

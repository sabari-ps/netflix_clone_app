import 'package:flutter/material.dart';
import 'package:nf_clone/ui/screens/details_screen.dart';

class MovieTile extends StatelessWidget {
  final String imageUrl;
  final String overview;
  final String title;
  final int movieId;
  final String releaseDate;
  const MovieTile({
    Key? key,
    required this.imageUrl,
    required this.movieId,
    required this.overview,
    required this.title,
    required this.releaseDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => DetailsScreen(
            imageUrl: imageUrl,
            overview: overview,
            title: title,
            releaseDate: releaseDate,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SizedBox(
          width: 150.0,
          height: 300.0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(
              16.0,
            ),
            child: Image.network(
              'https://image.tmdb.org/t/p/w1280/$imageUrl',
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:nf_clone/ui/screens/listing_screen.dart';
import 'package:nf_clone/ui/widgets/movietile.dart';

class MoviesTileList extends StatelessWidget {
  final String name;
  final List moviesList;
  const MoviesTileList({
    Key? key,
    required this.name,
    required this.moviesList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ListingScreen(
                category: name,
                moviesList: moviesList,
              ),
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                ),
                child: Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
              const Icon(
                Icons.chevron_right,
                color: Colors.white,
              ),
            ],
          ),
        ),
        (moviesList.isNotEmpty)
            ? SizedBox(
                height: 220.0,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: moviesList.length,
                  itemBuilder: (context, index) {
                    return MovieTile(
                      imageUrl: moviesList[index]['poster_path'],
                      movieId: moviesList[index]['id'],
                      overview: moviesList[index]['overview'],
                      title: moviesList[index]['title'],
                      releaseDate: moviesList[index]['release_date'].toString(),
                    );
                  },
                ),
              )
            : const Center(
                child: Text(
                  "NO ITEMS FOUND",
                ),
              )
      ],
    );
  }
}

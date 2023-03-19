import 'package:flutter/material.dart';
import 'package:movie_app/constraints.dart';
import 'package:movie_app/models/movie.dart';

import '../../../components/genreCard.dart';
import 'category.dart';
import 'genres.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[CategoryList(), Genres(), MovieCarousel()],
    );
  }
}

class MovieCarousel extends StatefulWidget {
  const MovieCarousel({super.key});

  @override
  State<MovieCarousel> createState() => _MovieCarouselState();
}

class _MovieCarouselState extends State<MovieCarousel> {
  late PageController _pageController;
  int initialPage = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
    _pageController.dispose();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: AspectRatio(
        aspectRatio: 0.85,
        child: PageView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) => MovieCard(movie: movies[index])),
      ),
    );
  }
}

class MovieCard extends StatelessWidget {
  final Movie movie;
  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        children: [
          Expanded(
              child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                boxShadow: [kDefaultShadow],
                image: DecorationImage(
                    image: AssetImage(movie.poster), fit: BoxFit.fill)),
          ))
        ],
      ),
    );
  }
}

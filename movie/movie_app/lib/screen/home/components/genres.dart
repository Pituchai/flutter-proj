import 'package:flutter/material.dart';
import 'package:movie_app/constraints.dart';

import '../../../components/genreCard.dart';

class Genres extends StatelessWidget {
  const Genres({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> genres = [
      'Actions',
      'Comedy',
      'Sci-fi',
      'Thriller',
      'Animation',
      'Crime'
    ];
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      height: 36,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) => GenreCard(genre: genres[index]))),
    );
  }
}

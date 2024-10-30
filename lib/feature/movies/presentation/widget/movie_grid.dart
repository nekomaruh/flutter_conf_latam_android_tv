import 'package:flutter/material.dart';
import 'package:flutter_conf_android_tv/core/extension/focus_ext.dart';

import '../../../../core/framework/platform.dart';
import '../../domain/entity/movie.dart';
import 'movie_card/movie_card.dart';

typedef MovieTapHandler = void Function(Movie);

class MovieGrid extends StatelessWidget {
  MovieGrid({
    required this.movies,
    required this.onTapMovie,
    super.key,
  });

  final controller = ScrollController();
  final List<Movie> movies;
  final MovieTapHandler onTapMovie;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: controller,
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(28),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: MyPlatform.isTv ? 5 : (context.screenSize.width / 250).round(),
              childAspectRatio: 1.6,
              crossAxisSpacing: MyPlatform.isTv ? 50 : 10,
              mainAxisSpacing: MyPlatform.isTv ? 50 : 10,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) => getMovieCard()(
                movie: movies[index],
                index: index,
                onTap: () => onTapMovie(movies[index]),
              ),
              childCount: movies.length,
            ),
          ),
        )
      ],
    );
  }
}

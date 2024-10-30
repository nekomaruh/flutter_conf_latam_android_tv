import 'package:flutter/cupertino.dart';
import 'package:flutter_conf_android_tv/feature/movies/presentation/widget/movie_card/tv_movie_card.dart';

import '../../../../../core/framework/platform.dart';
import '../../../domain/entity/movie.dart';
import 'mobile_movie_card.dart';

typedef MyBuilder = Widget Function({
  required Movie movie,
  required int index,
  required GestureTapCallback onTap,
});

MyBuilder getMovieCard() => MyPlatform.isTv ? getTvCard : getMobileCard;

Widget getTvCard({
  required Movie movie,
  required int index,
  required GestureTapCallback onTap,
}) =>
    TvMovieCard(
      movie: movie,
      index: index,
      onTap: onTap,
      key: ValueKey(movie.name),
    );

Widget getMobileCard({
  required Movie movie,
  required int index,
  required GestureTapCallback onTap,
}) =>
    MovieCard(
      movie: movie,
      index: index,
      onTap: onTap,
      key: ValueKey(movie.name),
    );
